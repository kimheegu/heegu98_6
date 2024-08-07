package com.muse.lab.controller;

import java.io.IOException;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.muse.lab.vo.MuseLabVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface KakaoController {
	// 카카오 로그인
	public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpServletRequest request,  HttpServletResponse response, RedirectAttributes rAttr) throws IOException;
	
	// 카카오 회원가입
	public ModelAndView kakaoJoin(@ModelAttribute("mlVO") MuseLabVO mlVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 카카오 회원 중복 확인
	public ModelAndView kakaoCheck(@RequestParam("kakaoId") Long kakaoId, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
