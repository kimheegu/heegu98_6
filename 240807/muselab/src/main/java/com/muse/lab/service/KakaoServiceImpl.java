package com.muse.lab.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.muse.lab.dao.UserDAO;
import com.muse.lab.vo.MuseLabVO;

@Service("kakaoService")
@Transactional(propagation = Propagation.REQUIRED)
public class KakaoServiceImpl implements KakaoService {
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private UserService userService;
	
	
	// 카카오 키 값들
	@Value("${kakao.restAPI}")
	String restAPI;
	
	@Value("${kakao.secretKey}")
	String secretKey;
	
	@Value("${kakao.Login}")
	String Login;
	
	@Value("${kakao.Logout}")
	String Logout;
	
	// 카카오한테 code 보내서 토큰 얻기
	public String getAccessToken (String authorize_code){
		System.out.println("--------------------토큰 발급--------------------");
		String access_token = "";
		String refresh_token = "";
		
		// 토큰 발급 요청 보낼 주소
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			// URL 객체 생성
			URL url = new URL(reqURL);
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			// .setDoOutput(true): URLConnection이 서버에 데이터를 보내는데 사용할 수 있는 지의 여부를 설정하는 것
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id="+restAPI);
			sb.append("&client_secret="+secretKey);
			sb.append("&redirect_uri="+Login);
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			
			// 응답코드 200이면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("responseBody : " + result);
			
			// GSON 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonElement element = JsonParser.parseString(result);
			
			access_token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();
			
			System.out.println("access_token : " + access_token);
			System.out.println("refresh_token : " + refresh_token);
			
			br.close();
			bw.close();
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		return access_token;
	}
	
	// 토큰을 이용해 카카오 쪽에서 사용자 정보 가져오기
	public MuseLabVO getUserInfo(String access_token) throws IOException {
		System.out.println("--------------------사용자 정보 가져오기--------------------");
		MuseLabVO mlVO = new MuseLabVO();
		
		// 토큰을 이용해 카카오에 사용자 정보 요청
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		try {
			// URL 객체 생성
			URL url = new URL(reqURL);
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			// 연결 완료
			
			// 헤더 필드 읽기
			// 요청에 필요한 Header에 포함 될 내용 (문서에서 지정해둔 양식)
			conn.setRequestProperty("Authorization", "Bearer " + access_token);
			
			// 응답코드 확인
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			// 입력스트림을 가지고 오고 데이터 읽기
			// inputStream은 데이터를 바이트의 배열로 읽어 오는 low-level의 메서드
			// 따라서 데이터를 문자 '데이터'로 읽기 위해서 InputStreamReader로 매핑
			// 데이터를 문자'열'로 읽기 위해서 inputStream을 BufferedReader로 매핑하기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("responseBody : " + result);
			
			// GSON 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonElement element = JsonParser.parseString(result);

			// JsonElement.getAsJsonObject().get("key value").getAs타입(); 의 형태로 파싱한다. 
			// 응답데이터(JSON)
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			String id = String.valueOf(element.getAsJsonObject().get("id").getAsLong());

			// 파싱된 JSON데이터를 string에 담기
			String name = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			String phone = kakao_account.getAsJsonObject().get("phone_number").getAsString();
			
			String nickname = userService.randomNickname();
			
			System.out.println("kakaoId : " + id);
			System.out.println("kakaoName : " + name);
			System.out.println("kakaoEmail : " + email);
			System.out.println("kakaoPhone : " + phone);
			
			// 받아온 값들 VO에 담기
			mlVO.setKakaoId(id);
			mlVO.setKakaoName(name);
			mlVO.setKakaoNickname(nickname);
			mlVO.setKakaoEmail(email);
			mlVO.setKakaoPhone(phone);
		}
		catch (MalformedURLException e) {
			e.printStackTrace();
		}
		
		return mlVO;
	} 
	
	// 카카오 로그아웃
	public void kakaoLogout(String access_token) {
		System.out.println("--------------------카카오 로그아웃--------------------");
		String reqURL = "https://kapi.kakao.com/v1/user/logout?"
				+ "client_id="+restAPI+"&&logout_redirect_uri="+Logout;
		
		try {
			// URL 객체 생성
			URL url = new URL(reqURL);
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			// 연결 완료
			
			// 헤더 필드 읽기
			// 요청에 필요한 Header에 포함 될 내용 (문서에서 지정해둔 양식)
			conn.setRequestProperty("Authorization", "Bearer " + access_token);
			
			// 응답코드 확인
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br;
			if(responseCode >= 200 && responseCode <= 300) {
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			}
			else {
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			}
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("responseBody : " + result);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 카카오 회원가입
	@Override
	public int kakaoJoin(MuseLabVO mlVO) throws Exception{
		return userDAO.kakaoJoin(mlVO);
	}
	
	// 카카오 중복 회원 확인
	@Override
	public int kakaoCheck(String kakaoId) throws Exception{
		int result = userDAO.kakaoCheck(kakaoId);
		return result;
	}
}
