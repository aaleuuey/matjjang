package ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import svc.*;

@Controller
public class MemberCtrl {
	private MemberSvc memberSvc;

	public void setMemberSvc(MemberSvc memberSvc) {
		this.memberSvc = memberSvc;
	}
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "member/joinForm";
	}

}
