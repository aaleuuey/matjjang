package config;

import org.springframework.context.annotation.Bean;

import dao.CommendDao;
import svc.CommendSvc;

public class CommendConfig {
	@Bean
	public CommendDao commendDao() {
		return new CommendDao(DbConfig.dataSource());
	}
	
	@Bean
	public CommendSvc commendSvc() {
		CommendSvc commendSvc = new CommendSvc();
		commendSvc.setCommendDao(commendDao()); 
		return commendSvc;
	}
}
