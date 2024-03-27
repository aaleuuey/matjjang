package ctrl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import svc.*;

@Controller
public class CommendCtrl {
	private CommendSvc commendSvc;

	public void setCommendSvc(CommendSvc commendSvc) {
		this.commendSvc = commendSvc;
	}
	
	@GetMapping("/commendList")
	public String commendList(Model model, HttpServletRequest request) throws Exception {
		
		return "commend/commendList";
		
	}
}
