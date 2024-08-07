package com.muse.lab.service;

import java.util.List;

import com.muse.lab.vo.MuseLabVO;

public interface UserService {
	// 회원 로그인
	public MuseLabVO userLogin(MuseLabVO mlVO) throws Exception;
	
	// 회원가입
	public int userJoin(MuseLabVO mlVO) throws Exception;
	
	// 아이디 중복 확인
	public int idCheck(String userId) throws Exception;
	
	// 닉네임 중복 확인
	public int nicknameCheck(String userNickname) throws Exception;
	
	// 기존 비밀번호 일치 확인
	public String pwdCheck(String userId) throws Exception;
	
	// 회원가입 확인
	public List userJoinComplete(String userId) throws Exception;
	
	// 회원 정보 가져오기
	public List userInfo(String userId) throws Exception;
	
	// 회원 정보 수정
	public int userInfoMod(MuseLabVO mlVO) throws Exception;
	
	// 회원 프로필 수정
	public int userProfileMod(MuseLabVO mlVO) throws Exception;
	
	// 닉네임 랜덤 생성
	public String randomNickname();
}
