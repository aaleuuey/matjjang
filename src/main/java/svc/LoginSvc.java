package svc;

import dao.*;

public class LoginSvc {
	private LoginDao loginDao;
	
	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;	
	}
}
