package ctrl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import svc.*;

@Controller
public class ReviewCtrl {
	private ReviewSvc reviewSvc;

	public void setReviewSvc(ReviewSvc reviewSvc) {
		this.reviewSvc = reviewSvc;
	}
	
	@GetMapping("/reviewList")
	public String reviewList(Model model, HttpServletRequest request) throws Exception {
		
		return "review/reviewList";
		
	}
}
