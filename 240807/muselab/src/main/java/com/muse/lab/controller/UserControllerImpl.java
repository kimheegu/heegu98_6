package com.muse.lab.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.muse.lab.service.EmailService;
import com.muse.lab.service.KakaoService;
import com.muse.lab.service.UserService;
import com.muse.lab.vo.MuseLabVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller("userController")
@RequestMapping(value = "/user")
public class UserControllerImpl implements UserController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private KakaoService kakaoService;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private MuseLabVO mlVO;
	
	// 유저 프로필 저장 경로
	@Value("${user.imgdir}")
	String udir;
	
	// 회원 메인페이지
	@GetMapping("/userMain.do")
	public ModelAndView userMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/user/userMain");
		return mav;
	}
	
	// 회원 로그인
	@GetMapping("/loginForm.do")
	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/user/function/loginForm");
		return mav;
	}
	
	// 회원 가입 
	@GetMapping("/userJoinForm.do")
	public ModelAndView userJoinForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/user/function/userJoinForm");
		return mav;
	}
	
	// 정보 수정 페이지
	@GetMapping("/userModForm.do")
	public ModelAndView userModForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String access_token = (String)session.getAttribute("accessToken");
		MuseLabVO user = (MuseLabVO)session.getAttribute("user");
		String userid = user.getUserId();

		// 토큰값 유무로 카카오 가입 유저인지 아닌지 판별
		if(access_token != null) {
			MuseLabVO userInfo = kakaoService.getUserInfo(access_token);
			String kakaoid = userInfo.getKakaoId();
			mlVO.setKakaoId(kakaoid);
			
			List userList = userService.userInfo(kakaoid);
			ModelAndView mav = new ModelAndView("/user/mypage/userModForm");
			mav.addObject("userList",userList);
			return mav;
		}
		
		List userList = userService.userInfo(userid);
		ModelAndView mav = new ModelAndView("/user/mypage/userModForm");
		mav.addObject("userList",userList);
		return mav;
	}
	
	// 비밀번호 변경 페이지
	@GetMapping("/pwdModForm.do")
	public ModelAndView pwdModForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MuseLabVO user = (MuseLabVO)session.getAttribute("user");
		String userid = user.getUserId();
		
		List userList = userService.userInfo(userid);
		ModelAndView mav = new ModelAndView("/user/mypage/pwdModForm");
		mav.addObject("userList",userList);
		return mav;
	}
	
	// 회원 로그인
	@Override
	@PostMapping("/userLogin.do")
	public ModelAndView userLogin(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes rAttr) throws Exception {
		ModelAndView mav = new ModelAndView();
		mlVO = userService.userLogin(mlVO);
		if(mlVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", mlVO);
			session.setAttribute("isLogOn", true);

			String action = (String) session.getAttribute("action");
			session.removeAttribute("action");

			if (action != null) {
				mav.setViewName("redirect:" + action);
			} else {
				mav.setViewName("redirect:/user/userMain.do");
				mav.addObject("userId", mlVO.getUserId());
			}
		} else {
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/user/loginForm.do");
		}
		return mav;
	}
	
	// 로그아웃
	@Override
	@GetMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("user");
		session.setAttribute("isLogOn", false);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/user/userMain.do");
		
		String access_token = (String)session.getAttribute("accessToken");
		
		if(access_token != null && !"".equals(access_token)){
			kakaoService.kakaoLogout(access_token);
			
			session.removeAttribute("accessToken");
			session.removeAttribute("kakaoId");
			return mav;
		}
		return mav;
	}
	
	// 회원가입
	@Override
	@PostMapping("/userJoin.do")
	public ModelAndView userJoin(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userId");
		HttpSession session = request.getSession();
		
		String email = mlVO.getUserEmail1() + mlVO.getUserEmail2();
		mlVO.setUserEmail(email);
		
		session.setAttribute("userEmail", email);
		
		int result = 0;
		result = userService.userJoin(mlVO);
		mav.addObject("userId", userid);
		mav.setViewName("redirect:/user/userJoinComplete.do");
		return mav;
	}
	
	// 회원가입 확인
	@Override
	@GetMapping("/userJoinComplete.do")
	public ModelAndView userJoinComplete(@RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		List userList = userService.userJoinComplete(userId);
		
		ModelAndView mav = new ModelAndView("/user/function/userJoinComplete");
		mav.addObject("userList",userList);
		return mav;
	}

	// 아이디 중복 확인
	@ResponseBody
	@PostMapping("/idCheck.do")
	public int idCheck(@RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int result = userService.idCheck(userId);
		return result;
	}
	
	// 닉네임 중복 확인
	@ResponseBody
	@PostMapping("/nicknameCheck.do")
	public int nicknameCheck(@RequestParam("userNickname") String userNickname, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int result = userService.nicknameCheck(userNickname);
		return result;
	}
	
	// 기존 비밀번호 일치 확인
	@ResponseBody
	@PostMapping("/pwdCheck.do")
	public String pwdCheck(@RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String result = userService.pwdCheck(userId);
		return result;
	}
	
	// 메일 본인 인증
	@ResponseBody
	@PostMapping("/emailCheck.do")
	public String emailCheck(@RequestParam("email")String email) {
		System.out.println("이메일 : " + email);
		
		int randomCode = emailService.sendEmail(email);
		String code = "" + randomCode;
	
		System.out.println("인증 코드 :" + code);
		
		return code;
	}
	
	// 회원 정보 가져오기
	@Override
	@GetMapping("/userInfo.do")
	public ModelAndView userInfo(@RequestParam(value = "userId", required = false) String userId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MuseLabVO user = (MuseLabVO) session.getAttribute("user");
		String access_token = (String)session.getAttribute("accessToken");
		
		// 유저 정보 가져오기
		String userid = user.getUserId();
		
		// 토큰값 유무로 카카오 가입 유저인지 아닌지 판별
		if(access_token != null) {
			MuseLabVO userInfo = kakaoService.getUserInfo(access_token);
			String kakaoid = userInfo.getKakaoId();
			mlVO.setKakaoId(kakaoid);
			
			List userList = userService.userInfo(kakaoid);
			ModelAndView mav = new ModelAndView("/user/mypage/myPage");
			mav.addObject("userList",userList);
			return mav;
			
		}
		List userList = userService.userInfo(userid);
		
		ModelAndView mav = new ModelAndView("/user/mypage/myPage");
		mav.addObject("userList",userList);
		return mav;
	}
	
	// 회원 정보 수정
	@Override
	@PostMapping("/userInfoMod.do")
	public ModelAndView userInfoMod (@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		MuseLabVO user = (MuseLabVO) session.getAttribute("user");
		String access_token = (String)session.getAttribute("accessToken");
		
		// 일반 가입 유저 정보 가져오기
		String userid = user.getUserId();
		
		// 토큰값 유무로 카카오 가입 유저인지 아닌지 판별
		if(access_token != null) {
			MuseLabVO userInfo = kakaoService.getUserInfo(access_token);
			String kakaoid = userInfo.getKakaoId();
			mlVO.setUserId(kakaoid);
			
			int result = 0;
			result = userService.userInfoMod(mlVO);
			
			ModelAndView mav = new ModelAndView("redirect:/user/userInfo.do");
			return mav;
		}
		
		int result = 0;
		result = userService.userInfoMod(mlVO);
		
		ModelAndView mav = new ModelAndView("redirect:/user/userInfo.do");
		mav.addObject("userId",userid);
		return mav;
	}
	
	// 회원 프로필 사진 수정
	@Override
	@PostMapping("/userProfileMod.do")
	public ModelAndView userProfileMod(@RequestParam("userProfile") MultipartFile userProfile, HttpServletRequest request, HttpServletResponse response, Model m, MultipartHttpServletRequest mtf) throws Exception {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		MuseLabVO user = (MuseLabVO) session.getAttribute("user");
		String access_token = (String)session.getAttribute("accessToken");
		
		MultipartFile profile = mtf.getFile("userProfile");

		String fileName;
		UUID uuid = UUID.randomUUID();
		
		if(profile.isEmpty()) {
			fileName = "-";
		}
		else {
			fileName = profile.getOriginalFilename();
			String fileName1 = uuid.toString() + fileName;
			mlVO.setUserProfile(fileName1);	
			try {
				// 실제 경로 images/userprofile
				String path = udir;
				File targetFile = new File(path, fileName1);
				
				profile.transferTo(targetFile);
			}
			catch(IOException e){
				e.printStackTrace();
			}
		}
		// 일반 가입 유저 정보 가져오기
		String userid = user.getUserId();
		
		// 토큰값 유무로 카카오 가입 유저인지 아닌지 판별
		if(access_token != null) {
			MuseLabVO userInfo = kakaoService.getUserInfo(access_token);
			String kakaoid = userInfo.getKakaoId();
			mlVO.setUserId(kakaoid);
			
			int result = 0;
			result = userService.userProfileMod(mlVO);
			
			ModelAndView mav = new ModelAndView("redirect:/user/userInfo.do");
			return mav;
		}
		
		int result = 0;
		result = userService.userProfileMod(mlVO);
		
		ModelAndView mav = new ModelAndView("redirect:/user/userInfo.do");
		mav.addObject("userId",userid);
		return mav;
	}
	
	// form으로 끝나는 파일 실행시
	@GetMapping("/*Form.do")
	private ModelAndView form(@RequestParam(value = "result", required = false) String result,
			@RequestParam(value = "action", required = false) String action, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);

		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName(viewName);
		return mav;
	}
	
}
