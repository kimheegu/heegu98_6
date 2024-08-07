package com.muse.lab.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.muse.lab.service.KakaoService;
import com.muse.lab.vo.MuseLabVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller("kakaoController")
@RequestMapping(value = "/kakao")
public class KakaoControllerImpl implements KakaoController {
	@Autowired
	private KakaoService kakaoService;
	
	@Autowired
	private MuseLabVO mlVO;
	
	// 카카오 API 이용 위치 정보 제공 지도
	@GetMapping("/muselabMap.do")
	public ModelAndView muselabMap(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/user/map/museLabMap");
		return mav;
	}
	
	// 회사 위치 제공 지도
	@GetMapping("/companyMap.do")
	public ModelAndView companyMap(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/user/map/companyMap");
		return mav;
	}
	
	//카카오 로그인
	@Override
	@GetMapping("/kakaoLogin")
	public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpServletRequest request,  HttpServletResponse response, RedirectAttributes rAttr) throws IOException {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		System.out.println("#####authorize_code##### : [" + code +"]");
		
		// 카카오 code 보내서 토근 얻기
		String accessToken = kakaoService.getAccessToken(code);
		System.out.println("#####accessToken##### : [" + accessToken +"]");
		
		session.setAttribute("accessToken", accessToken);
		
		// 토큰을 이용해 카카오 쪽에서 사용자 정보 가져오기
		MuseLabVO userInfo = kakaoService.getUserInfo(accessToken);
		
		// 세션 형성 + request 내장 객체 가져오기
		session = request.getSession();
		
		// 세션에 담기
		if(userInfo.getKakaoId() != null) {
			session.setAttribute("user", mlVO);
			session.setAttribute("isLogOn", true);
			
			session.setAttribute("kakaoId", userInfo.getKakaoId());
			session.setAttribute("KakaoName", userInfo.getKakaoName());
			session.setAttribute("KakaoNickname", userInfo.getKakaoNickname());
			session.setAttribute("kakaoEmail", userInfo.getKakaoEmail());
			session.setAttribute("kakaoPhone", userInfo.getKakaoPhone());
			
			mav.addObject("kakaoId", userInfo.getKakaoId());
			mav.setViewName("redirect:/kakao/kakaoCheck.do");
			return mav;
		}
		mav.setViewName("redirect:/user/userMain.do");
		return mav;
	}
	
	// 카카오 회원가입
	@Override
	@GetMapping("/kakaoJoin.do")
	public ModelAndView kakaoJoin(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("--------------------카카오 회원 가입 진행--------------------");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String access_token = (String)session.getAttribute("accessToken");
		
		MuseLabVO userInfo = kakaoService.getUserInfo(access_token);
		
		int result = 0;
		result = kakaoService.kakaoJoin(userInfo);
		
		mav.setViewName("redirect:/user/userMain.do");
		return mav;
	}
	
	
	// 카카오 회원 중복 확인
	@ResponseBody
	@GetMapping("/kakaoCheck.do")
	public ModelAndView kakaoCheck(@RequestParam(value = "kakaoId", required = false) Long kakaoId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("--------------------카카오 회원 중복 확인--------------------");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String kakaoid = (String)session.getAttribute("kakaoId");
		String access_token = (String)session.getAttribute("accessToken");
		
		int result = kakaoService.kakaoCheck(kakaoid);
		
		
		if(result == 0) {
			System.out.println("회원 정보 없음 : " + access_token);
			mav.setViewName("redirect:/kakao/kakaoJoin.do");
			return mav;
		}
		else if(result == 1) {
			System.out.println("회원 정보 있음 : " + kakaoid);
			mav.setViewName("redirect:/user/userMain.do");
			mav.addObject("userId", kakaoid);
			return mav;
		}
		
		mav.setViewName("redirect:/user/userMain.do");
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
