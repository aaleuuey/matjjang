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
}
