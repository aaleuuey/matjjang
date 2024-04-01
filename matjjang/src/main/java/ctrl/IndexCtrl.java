package ctrl;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import svc.*;
import vo.*;

@Controller
public class IndexCtrl {
	private IndexSvc indexSvc;

	public void setIndexSvc(IndexSvc indexSvc) {
		this.indexSvc = indexSvc;
	}

	@GetMapping("/")
	public String index(Model model, HttpServletRequest request) throws Exception {
		
		return "index";
	}
	
}
