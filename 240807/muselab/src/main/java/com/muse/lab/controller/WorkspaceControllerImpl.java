package com.muse.lab.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.muse.lab.service.WorkspaceService;
import com.muse.lab.vo.MuseLabVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller("workspaceController")
public class WorkspaceControllerImpl implements WorkspaceController{

	@Autowired
	private WorkspaceService workspaceService;
	
	@Autowired
	private MuseLabVO mlVO;
	
	// 작업실 목록 출력
	@Override
	@GetMapping("/workspace/workspaceList.do")
	public ModelAndView workspaceList(HttpServletRequest request, HttpServletResponse response) throws Exception {
			List workspaceList = workspaceService.workspaceList();
			ModelAndView mav = new ModelAndView("/workspace/workspaceList");
			mav.addObject("workspaceList", workspaceList);
			return mav;
	}

	// 작업실 상세 보기
	@Override
	@GetMapping("/workspace/workspaceDetail.do")
	public ModelAndView workspaceDetail(@RequestParam("musicId") int musicId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("musicId",musicId);
		List workspaceList = workspaceService.workspaceDetail(musicId);
		ModelAndView mav = new ModelAndView("/workspace/workspaceDetail");
		mav.addObject("workspaceList", workspaceList);
		return mav;
	}

	// 작업실 글 작성
	@Override
	public ModelAndView workspaceWrite(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	// 작업실 글 수정
	@Override
	public ModelAndView workspaceMod(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	// 작업실 글 삭제
	@Override
	public ModelAndView workspaceDel(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	// 작업실 조회수 증가
	@Override
	public ModelAndView musicViewPlus(@RequestParam("musicId") int musicId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	// 작업실 좋아요 추가
	@Override
	public ModelAndView musicLikeInsert(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	// 작업실 좋아요 삭제
	@Override
	public ModelAndView musicLikeDel(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	// 작업실 좋아요 수 확인
	@Override
	public ModelAndView musicLikeCnt(@RequestParam("musicId") int musicId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	// 작업실 댓글 추가
	@Override
	@PostMapping("/workspace/musicCommentInsert.do")
	public ModelAndView musicCommentInsert(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = workspaceService.musicCommentInsert(mlVO);
		ModelAndView mav = new ModelAndView("redirect:/workspace/workspaceDetail.do");
		return mav;
	}

	// 작업실 댓글 수정
	@Override
	public ModelAndView musicCommentMod(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	// 작업실 댓글 삭제
	@Override
	public ModelAndView musicCommentDel(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
