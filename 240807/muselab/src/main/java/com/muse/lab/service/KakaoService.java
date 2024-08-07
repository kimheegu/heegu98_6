package com.muse.lab.service;

import java.io.IOException;

import com.muse.lab.vo.MuseLabVO;

public interface KakaoService {
	// 카카오 code 보내서 토근 얻기
	public String getAccessToken (String authorize_code);
	
	// 토큰을 이용해 카카오 쪽에서 사용자 정보 가져오기 
	public MuseLabVO getUserInfo(String access_token) throws IOException;
	
	// 카카오 로그아웃
	public void kakaoLogout (String access_token);
	
	// 카카오 회원가입
	public int kakaoJoin(MuseLabVO mlVO) throws Exception;
	
	// 카카오 중복 회원 확인
	public int kakaoCheck(String kakaoid) throws Exception;
}
