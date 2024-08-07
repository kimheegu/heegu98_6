package com.muse.lab.controller;

import java.io.IOException;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.muse.lab.vo.MuseLabVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public interface UserController {
	// 회원 로그인
	public ModelAndView userLogin(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes rAttr) throws Exception;
	
	// 로그아웃
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 회원가입
	public ModelAndView userJoin(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 회원가입 확인
	public ModelAndView userJoinComplete(@RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 회원 정보 가져오기(마이페이지)
	public ModelAndView userInfo(@RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 회원 정보 수정
	public ModelAndView userInfoMod(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 회원 프로필 수정
	public ModelAndView userProfileMod(@RequestParam("userProfile") MultipartFile userProfile, HttpServletRequest request, HttpServletResponse response, Model m, MultipartHttpServletRequest mtf) throws Exception;
}
