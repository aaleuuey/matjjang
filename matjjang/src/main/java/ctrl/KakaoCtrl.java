package ctrl;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import svc.*;

@Controller
public class KakaoCtrl {
	@Autowired
	KakaoSvc kakaoSvc;

	public void setKakaoSvc(KakaoSvc kakaoSvc) {
		this.kakaoSvc = kakaoSvc;
	}
	
	@GetMapping("/kakaoLoginProc")
	public String kakaoLoginProc(HttpServletRequest request, Model model, String code) throws Exception {
		String accessToken = kakaoSvc.getAccessToken(code);
		System.out.println("controller access_token : " + accessToken);
		
		HashMap<String, String> kakaoInfo = kakaoSvc.getUserInfo(accessToken);
		

		
		return "";
	}
}
