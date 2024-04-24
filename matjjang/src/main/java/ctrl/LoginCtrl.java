package ctrl;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import svc.*;
import vo.MemberInfo;

@Controller
@RequestMapping("/login")
public class LoginCtrl {

	private LoginSvc loginSvc;

	public void setLoginSvc(LoginSvc loginSvc) {
		this.loginSvc = loginSvc;
	}
	
	@GetMapping
	public String login() {
		return "login";
	}
	
	@PostMapping
	public String loginProc(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String uid = request.getParameter("uid").trim().toLowerCase();
		String pwd = request.getParameter("pwd").trim();
		
		MemberInfo loginInfo = loginSvc.getLoginInfo(uid, pwd);
		
		if (loginInfo == null) {	// 로그인 정보가 null이었을 때
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 정보가 올바르지 않습니다.')");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loginInfo", loginInfo);
		}
		
		model.addAttribute("loginInfo", loginInfo);
		
		return "redirect:/";
	}

}
