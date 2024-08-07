package com.muse.lab.service;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.muse.lab.dao.UserDAO;
import com.muse.lab.vo.MuseLabVO;

@Service("userService")
@Transactional(propagation = Propagation.REQUIRED)
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;

	
	// 회원 로그인
	@Override
	public MuseLabVO userLogin(MuseLabVO mlVO) throws Exception {
		return userDAO.userLogin(mlVO);
	}
	
	// 회원가입
	@Override
	public int userJoin(MuseLabVO mlVO) throws Exception {
		return userDAO.userJoin(mlVO);
	}
	
	// 회원가입 확인
	@Override
	public List userJoinComplete(String userId) throws Exception {
		List userList = null;
		userList = userDAO.userJoinComplete(userId);
		return userList;
	}

	// 아이디 중복 확인
	@Override
	public int idCheck(String userId) throws Exception {
		int result = userDAO.idCheck(userId);
		return result;
	}
	
	// 닉네임 중복 확인
	@Override
	public int nicknameCheck(String userNickname) throws Exception {
		int result = userDAO.nicknameCheck(userNickname);
		return result;
	}
	
	// 회원 정보 가져오기
	@Override
	public List userInfo(String userId) throws Exception {
		List userList = null;
		userList = userDAO.userInfo(userId);
		return userList;
	}
	
	// 기존 비밀번호 일치 확인
	@Override
	public String pwdCheck(String userId) throws Exception {
		String result = userDAO.pwdCheck(userId);
		return result;
	}
	
	// 회원 정보 수정
	@Override
	public int userInfoMod(MuseLabVO mlVO) throws Exception{
		return userDAO.userInfoMod(mlVO);
	}
	
	// 회원 프로필 수정
	@Override
	public int userProfileMod(MuseLabVO mlVO) throws Exception{
		return userDAO.userProfileMod(mlVO);
	}
	
	// 닉네임 랜덤 생성
	public String randomNickname(){
		List<String> First = Arrays.asList("귀여운", "배고픈", "밥먹는", "잠자는", "여유로운", "졸린", "심심한", "외로운", "행복한", "즐거운", "화난");
		List<String> Second = Arrays.asList("강아지", "고양이", "말", "사자", "호랑이", "늑대", "여우", "돌고래", "고래", "상어", "오징어", "문어", "조랑말", "당나귀", 
				"닭", "돼지", "하마", "소", "쥐", "햄스터", "외계인", "토끼", "뱀", "용", "양", "원숭이", "곰", "맷돼지", "기린", "코알라", "카멜레온", "두더지", "개구리", "박쥐");
		String number =(int)(Math.random() * 99) + 1 + "";
		
		Collections.shuffle(First);
		Collections.shuffle(Second);
		
		String first = First.get(0);
		String second = Second.get(0);
		
		return first + second + number;
	}
}
