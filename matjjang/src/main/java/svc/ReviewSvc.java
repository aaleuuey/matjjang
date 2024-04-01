package svc;

import dao.*;

public class ReviewSvc {
	private ReviewDao reviewDao;
	
	public void setReviewDao(ReviewDao reviewDao) {
		this.reviewDao = reviewDao;	
	}
}
