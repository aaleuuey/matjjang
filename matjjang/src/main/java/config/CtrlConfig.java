package config;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import ctrl.*;
import svc.*;

@Configuration
public class CtrlConfig {	
	@Autowired
	private IndexSvc indexSvc;
	
	@Autowired
	private ReviewSvc reviewSvc;

	@Autowired
	private CommendSvc commendSvc;
	
	@Autowired
	private LoginSvc loginSvc;
	
	@Autowired
	private MemberSvc memberSvc;
	
	@Bean
	public LoginCtrl loginCtrl() {
		LoginCtrl loginCtrl = new LoginCtrl();
		loginCtrl.setLoginSvc(loginSvc);
		return loginCtrl;
	}

	@Bean
	public IndexCtrl indexCtrl() {
		IndexCtrl indexCtrl = new IndexCtrl();
		indexCtrl.setIndexSvc(indexSvc);
		return indexCtrl;
	}
	
	@Bean
	public ReviewCtrl reviewCtrl() {
		ReviewCtrl reviewCtrl = new ReviewCtrl();
		reviewCtrl.setReviewSvc(reviewSvc);
		return reviewCtrl;
	}
	
	@Bean
	public CommendCtrl commendCtrl() {
		CommendCtrl commendCtrl = new CommendCtrl();
		commendCtrl.setCommendSvc(commendSvc);
		return commendCtrl;
	}
	
	@Bean
	public MemberCtrl memberCtrl() {
		MemberCtrl memberCtrl = new MemberCtrl();
		memberCtrl.setMemberSvc(memberSvc);
		return memberCtrl;
	}
}
