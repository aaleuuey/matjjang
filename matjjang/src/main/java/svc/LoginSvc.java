package svc;

import dao.*;
import vo.MemberInfo;

public class LoginSvc {
	private LoginDao loginDao;
	
	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;	
	}

	public MemberInfo getLoginInfo(String uid, String pwd) {
		
		MemberInfo loginInfo = loginDao.getLoginInfo(uid, pwd);
		
		return loginInfo;
	}
}
