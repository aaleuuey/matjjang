package svc;

import java.util.List;

import dao.MemberDao;
import vo.BookmarkImageInfo;
import vo.BookmarkInfo;
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
}
