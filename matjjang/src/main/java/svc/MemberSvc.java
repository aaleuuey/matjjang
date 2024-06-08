package svc;

import java.util.List;

import dao.MemberDao;
import vo.BookmarkImageInfo;
import vo.BookmarkInfo;
import vo.HeartInfo;
import vo.MemberInfo;
import vo.StoreReplyList;

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

	public int getBookMarkCount(String miid) {
		int result = memberDao.getBookMarkCount(miid);
		return result;
	}

	public int getReviewCount(String miid) {
		int result = memberDao.getReviewCount(miid);
		return result;
	}

	public int getHeartCount(String miid) {
		int result = memberDao.getHeartCount(miid);
		return result;
	}

	public List<BookmarkInfo> getBookmarkView(String miid) {
		List<BookmarkInfo> bookmarkView = memberDao.getBookmarkView(miid);
		return bookmarkView;
	}

	public List<BookmarkImageInfo> getBookmarkImages(String miid) {
		List<BookmarkImageInfo> bookmarkImages = memberDao.getBookmarkImages(miid);
		return bookmarkImages;
	}

	public int folderAdd(String miid, String txCont) {
		int result = memberDao.folderAdd(miid, txCont);
		
		return result;
	}

	public int folderUpdate(String miid, int bfidx, String txCont) {
		int result = memberDao.folderUpdate(miid, bfidx, txCont);
		
		return result;
	}

	public int folderDelete(String miid, int bfidx) {
		int result = memberDao.folderDelete(miid, bfidx);
		
		return result;
	}

	public List<StoreReplyList> getReplyList(String miid) {
		List<StoreReplyList> replyList = memberDao.getReplyList(miid);
		
		return replyList;
	}

	public List<HeartInfo> getHeartInfo(String miid) {
		List<HeartInfo> heartInfo = memberDao.getHeartInfo(miid);
		
		return heartInfo;
	}

	public List<MemberInfo> getMemberInfo(String miid) {
		List<MemberInfo> memberInfo = memberDao.getMemberInfo(miid);
		
		return memberInfo;
	}

	public int getInfoChange(String mi_name, String mi_email, String mi_phone, String mi_id) {
		int result = memberDao.getInfoChange(mi_name, mi_email, mi_phone, mi_id);
		
		return result;
	}

	public int memberLeave(String miid) {
		int result = memberDao.memberLeave(miid);
		return result;
	}

	public MemberInfo getFindIdCheck(String mi_name, String mi_email) {
		MemberInfo memberInfo = memberDao.getFindIdCheck(mi_name, mi_email);
		
		return memberInfo;
	}

	public int PasswordChange(String td_pw, String miid, String mi_pw) {
		int result = memberDao.PasswordChange(td_pw, miid, mi_pw);
		
		return result;
	}

	public int getFindPwCheck(String mi_id, String mi_email) {
		int result  = memberDao.getFindPwCheck(mi_id, mi_email);
		
		return result;
	}

	public MemberInfo PwUpdate(String mi_id, String mi_email) {
		MemberInfo memberInfo = memberDao.PwUpdate(mi_id, mi_email);
		
		return memberInfo;
	}
}
