package svc;

import java.util.List;

import ctrl.*;
import dao.*;
import vo.*;

public class StoreSvc {

	private StoreDao storeDao;
	
	public void setStoreDao(StoreDao storeDao) {
		this.storeDao = storeDao;	
	}

	public List<StoreInfo> getStoreList(PageInfo pi) {
		List<StoreInfo> storeList = storeDao.getStoreList(pi);
		return storeList;
	}

	public int getStoreListCount(String where) {
		int result = storeDao.getStoreListCount(where);
		return result;
	}

	public List<StoreInfo> getStoreView(String siid) {
		List<StoreInfo> storeView = storeDao.getStoreView(siid);
		return storeView;
	}

	public List<StoreReplyList> getStoreReplyList(String siid) {
		List<StoreReplyList> storeReplyList = storeDao.getStoreReplyList(siid);
		return storeReplyList;
	}
	
	public int getStoreReplyCount(String siid) {
		int result = storeDao.getStoreReplyCount(siid);
		return result;
	}

	public int StoreReplyInsert(StoreReplyList srl) {
		int result = storeDao.getStoreReplyInsert(srl);
		return result;
	}

	public int replyGnb(int sridx, String siid, String mi_id) {
		int result = storeDao.replyGnb(sridx, siid, mi_id);
		return result;
	}

	public List<Integer> getStoreReplyGnb(List<Integer> srIdxList, String mi_id) {
		List<Integer> replyGnb = storeDao.getStoreReplyGnb(srIdxList, mi_id);
		return replyGnb;
	}

	public List<StoreReplyList> getMoreReviews(int currentReviews, int addReviews, String siid) {
		List<StoreReplyList> moreReviews = storeDao.getMoreReviews(currentReviews, addReviews, siid);
		return moreReviews;
	}

	public int storeReplyDelete(int sridx, String siid, String mi_id) {
		int result = storeDao.storeReplyDelete(sridx, siid, mi_id);
		return result;
	}

	public int getStoreHeartView(String siid, String mi_id) {
		int heart = storeDao.storeHeartView(siid, mi_id);
		return heart;
	}

	public int storeHeart(String siid, String mi_id) {
		int result = storeDao.storeHeart(siid, mi_id);
		return result;
	}

	public int getStoreBookmarkView(String siid, String mi_id) {
		int bookmark = storeDao.storeBookmarkView(siid, mi_id);
		return bookmark;
	}

	public int storeBookmark(String siid, String mi_id, String siimg1) {
		int result = storeDao.storeBookmark(siid, mi_id, siimg1);
		return result;
	}
}
