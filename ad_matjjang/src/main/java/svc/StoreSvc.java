package svc;

import java.util.List;

import dao.*;
import vo.*;

public class StoreSvc {
	private StoreDao storeDao;
	
	public void setStoreDao(StoreDao storeDao) {
		this.storeDao = storeDao;	
	}

	public int storeInsert(StoreInfo si) {
		int result = storeDao.productInsert(si);
		
		return result;
	}

	public List<StoreInfo> getStoreList(PageInfo pi) {
		List<StoreInfo> storeList = storeDao.getStoreList(pi);
		return storeList;
	}
	
	public int getStoreListCount() {
		int result = storeDao.getStoreListCount();
		return result;
	}

	
}
