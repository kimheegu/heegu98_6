package com.muse.lab.controller;


import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.muse.lab.vo.MuseLabVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface WorkspaceController {
	// 작업실 목록 출력
	public ModelAndView workspaceList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 작업실 상세 보기
	public ModelAndView workspaceDetail(@RequestParam("musicId") int musicId, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 작업실 글쓰기
	public ModelAndView workspaceWrite(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 작업실 글 수정
	public ModelAndView workspaceMod(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 작업실 글 삭제
	public ModelAndView workspaceDel(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 작업실 글 조회수 증가
	public ModelAndView musicViewPlus(@RequestParam("musicId") int musicId, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 작업실 글 좋아요 추가
	public ModelAndView musicLikeInsert(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 작업실 좋아요 삭제
	public ModelAndView musicLikeDel(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 작업실 좋아요 수 확인
	public ModelAndView musicLikeCnt(@RequestParam("musicId") int musicId, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 작업실 댓글 추가
	public ModelAndView musicCommentInsert(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 작업실 댓글 수정
	public ModelAndView musicCommentMod(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 작업실 댓글 삭제
	public ModelAndView musicCommentDel(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
