package svc;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.fasterxml.jackson.core.JsonParser;
import com.google.gson.JsonElement;

import ctrl.*;
import dao.*;
import vo.MemberInfo;

public class KakaoSvc {
	private KakaoDao kakaoDao;

	public void setKakaoDao(KakaoDao kakaoDao) {
		this.kakaoDao = kakaoDao;
	}

	public String getAccessToken(String code) {
		String access_token = "";
		String refresh_token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
	        conn.setDoOutput(true); //OutputStream으로 POST 데이터를 넘겨주겠다는 옵션.
	        
	        // 출력 스트림을 통해 데이터를 전송할 BufferedWriter를 생성
	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        
	        // 데이터를 담을 StringBuilder를 생성
	        StringBuilder sb = new StringBuilder();
	        
	        //필수 쿼리 파라미터 세팅
	        sb.append("grant_type=authorization_code");
	        sb.append("&client_id=0c70a890210b5db7d3ba3c375e8ae99c");
	        sb.append("&redirect_uri=http://localhost:8080/matjjang/kakaoLoginProc");
	        sb.append("&code=" + code);
	        
			bw.write(sb.toString());
			bw.flush();
	        
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			// 응답코드 200을 받아오는 지 체크
			
			BufferedReader br;
	        if (responseCode >= 200 && responseCode <= 300) {
	            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        
	        String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            
            System.out.println("response body : " + result);
	        
	        JSONParser p = new JSONParser();
			JSONObject jo = (JSONObject)p.parse(result);
			access_token = (String)jo.get("access_token");
			refresh_token = (String)jo.get("refresh_token");			

			br.close();
			bw.close();
			
		} catch(Exception e) {
			System.out.println("getAccessToken() 에러 발생");
			e.printStackTrace();
		}
		
		return access_token;
	}

	public HashMap<String, String> getUserInfo(String accessToken) {
		HashMap<String, String> loginInfo = new HashMap<String, String>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    
	    try {
	    	URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
	        
			BufferedReader br;
	        if (responseCode >= 200 && responseCode <= 300) {
	            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        
	        String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            
            System.out.println("response body : " + result);
            
            JSONParser p = new JSONParser();
			JSONObject jo = (JSONObject)p.parse(result);
			JSONObject properties = (JSONObject)jo.get("properties");
			JSONObject kakao_account = (JSONObject)jo.get("kakao_account");
			
			String id = jo.get("id").toString();
			String nickname = properties.get("nickname").toString();
			String gender = kakao_account.get("gender").toString();
			String number = kakao_account.get("phone_number").toString();
			String birthyear = kakao_account.get("birthyear").toString();
			String birthday = kakao_account.get("birthday").toString();
			String email = kakao_account.get("email").toString();

			loginInfo.put("id", id);
			loginInfo.put("nickname", nickname);
			loginInfo.put("gender", gender);
			loginInfo.put("number", number);
			loginInfo.put("birthyear", birthyear);
			loginInfo.put("birthday", birthday);
			loginInfo.put("email", email);
			
			
	        
	    } catch (Exception e) {
	        System.out.println("getUserInfo() 에러 발생");
	        e.printStackTrace();
	    }

	    return loginInfo;
	}

	public int isMem(String id) {
		int chkId = kakaoDao.isMem(id);
		return chkId;
	}

	public int kakaoInsert(MemberInfo mi) {
		int result = kakaoDao.kakaoInsert(mi);
		return result;
	}

	public MemberInfo getLoginInfo(String email) {
		MemberInfo mi = kakaoDao.getLoginInfo(email);
		return mi;
	}

}
