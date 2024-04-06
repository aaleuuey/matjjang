package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import svc.*;
import vo.*;

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
	
	// ¸ÀÁý µî·Ï view
	@GetMapping("/commendIn")
	public String commendIn(HttpServletRequest request) throws Exception {
		
		return "commend/commendIn";
	}
}
