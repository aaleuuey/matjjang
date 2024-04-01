package ctrl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import svc.*;

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

}
