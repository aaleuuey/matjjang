package config;

import org.springframework.context.annotation.Bean;

import dao.*;
import svc.*;

public class MemberConfig {
	
	@Bean
	public MemberDao memberDao() {
		return new MemberDao(DbConfig.dataSource());
	}
	
	@Bean
	public MemberSvc memberSvc() {
		MemberSvc memberSvc = new MemberSvc();
		memberSvc.setMemberDao(memberDao());
		return memberSvc;
	}
}
