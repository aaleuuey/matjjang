package config;

import org.springframework.context.annotation.Bean;

import dao.*;
import svc.*;

public class LoginConfig {
	@Bean
	public LoginDao loginDao() {
		return new LoginDao(DbConfig.dataSource());
	}
	
	@Bean
	public LoginSvc loginSvc() {
		LoginSvc loginSvc = new LoginSvc();
		loginSvc.setLoginDao(loginDao());
		return loginSvc;
	}
}
