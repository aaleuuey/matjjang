package config;

import org.springframework.context.annotation.Bean;

import dao.*;
import svc.*;

public class StoreConfig {
	@Bean
	public StoreDao storeDao() {
		return new StoreDao(DbConfig.dataSource());
	}
	
	@Bean
	public StoreSvc storeSvc() {
		StoreSvc storeSvc = new StoreSvc();
		storeSvc.setStoreDao(storeDao()); 
		return storeSvc;
	}
}
