package svc;

import dao.MemberDao;
import vo.MemberInfo;

public class MemberSvc {
	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public int chkId(String uid) {
		int result = memberDao.chkId(uid);
		return result;
	}

	public int memberInsert(MemberInfo mi) {
		int result = memberDao.memberInsert(mi);
		return result;
	}
}
