package config;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import ctrl.*;
import svc.*;

@Configuration
public class CtrlConfig {	
	@Autowired
	private IndexSvc indexSvc;
	
	@Autowired
	private StoreSvc storeSvc;

	@Bean
	public IndexCtrl indexCtrl() {
		IndexCtrl indexCtrl = new IndexCtrl();
		indexCtrl.setIndexSvc(indexSvc);
		return indexCtrl;
	}
	
	@Bean
	public StoreCtrl storeDaoCtrl() {
		StoreCtrl storeDaoCtrl = new StoreCtrl();
		storeDaoCtrl.setStoreSvc(storeSvc);
		return storeDaoCtrl;
	}

}
