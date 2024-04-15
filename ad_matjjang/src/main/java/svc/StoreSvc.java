package svc;

import dao.*;
import vo.StoreInfo;

public class StoreSvc {
	private StoreDao storeDao;
	
	public void setStoreDao(StoreDao storeDao) {
		this.storeDao = storeDao;	
	}

	public int storeInsert(StoreInfo si) {
		int result = storeDao.productInsert(si);
		
		return result;
	}
}
