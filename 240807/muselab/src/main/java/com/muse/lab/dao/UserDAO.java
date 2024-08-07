package com.muse.lab.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.muse.lab.vo.MuseLabVO;

@Mapper
@Repository("userDAO")
public interface UserDAO {
	// 회원 로그인
	public MuseLabVO userLogin(MuseLabVO mlVO) throws DataAccessException;
	
	// 회원가입
	public int userJoin(MuseLabVO mlVO) throws DataAccessException;
	
	// 아이디 중복 확인
	public int idCheck(String userId) throws DataAccessException;
	
	// 닉네임 중복 확인
	public int nicknameCheck(String userNickname) throws DataAccessException;
	
	// 기존 비밀번호 일치 확인
	public String pwdCheck(String userId) throws DataAccessException;
	
	// 회원가입 확인
	public List<MuseLabVO> userJoinComplete(String userId) throws DataAccessException;
	
	// 카카오 회원가입
	public int kakaoJoin(MuseLabVO mlVO) throws DataAccessException;
	
	// 카카오 중복 회원 확인
	public int kakaoCheck(String kakaoId) throws DataAccessException;
	
	// 회원 정보 가져오기(마이페이지)
	public List<MuseLabVO> userInfo(String userId) throws DataAccessException;
	
	// 회원 정보 수정
	public int userInfoMod(MuseLabVO mlVO) throws DataAccessException;
	
	// 회원 프로필 수정
	public int userProfileMod(MuseLabVO mlVO) throws DataAccessException;
}
