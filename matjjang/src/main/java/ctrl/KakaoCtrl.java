package ctrl;

import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import svc.*;
import vo.MemberInfo;

@Controller
public class KakaoCtrl {
	@Autowired
	KakaoSvc kakaoSvc;

	public void setKakaoSvc(KakaoSvc kakaoSvc) {
		this.kakaoSvc = kakaoSvc;
	}
	
	@GetMapping("/kakaoLoginProc")
	public String kakaoLoginProc(HttpServletRequest request, HttpServletResponse response, Model model, String code) throws Exception {
		String accessToken = kakaoSvc.getAccessToken(code);
		
		HashMap<String, String> kakaoInfo = kakaoSvc.getUserInfo(accessToken);
		String id = kakaoInfo.get("id");
		String nickname = kakaoInfo.get("nickname");
		String gender = kakaoInfo.get("gender");
		String mi_gender = gender.equals("female") ? "여" : "남";
		String number = kakaoInfo.get("number");
		String phone = number.replace("+82 ", "").replace("-", "");
		phone = "0" + phone.substring(0, 2) + "-" + phone.substring(2, 6) + "-" + phone.substring(6);

		String birthyear = kakaoInfo.get("birthyear");
		String birthday = kakaoInfo.get("birthday");
		String birth = birthyear + "-" + birthday.substring(0, 2) + "-" + birthday.substring(2);
		String email = kakaoInfo.get("email");
		
		System.out.println(id);
		System.out.println(nickname);
		System.out.println(birth);
		System.out.println(phone);
		System.out.println(mi_gender);
		System.out.println(email);

		
		MemberInfo mi = new MemberInfo();
		mi.setMi_id(id);
		mi.setMi_pw("정보없음");
		mi.setMi_name(nickname);
		mi.setMi_gender(mi_gender);
		mi.setMi_phone(phone);
		mi.setMi_birth(birth);
		mi.setMi_email(email);
		
		
		int chkId = kakaoSvc.isMem(id);
		
		
		if(chkId != 1) {
			int result = kakaoSvc.kakaoInsert(mi);
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			if (result != 1) {
				out.println("<script>");
				out.println("alert('로그인을 다시 해주세요.');");
				out.println("</script>");
				out.close();
				return "redirect:/previous-page-url";
			} else {
				MemberInfo loginInfo = kakaoSvc.getLoginInfo(email);
				HttpSession session = request.getSession();
				session.setAttribute("loginInfo", loginInfo);
				return "redirect:/";
			}
			
		} else {
			MemberInfo loginInfo = kakaoSvc.getLoginInfo(email);
			HttpSession session = request.getSession();
			session.setAttribute("loginInfo", loginInfo);
			return "redirect:/";
		}
	}
}
