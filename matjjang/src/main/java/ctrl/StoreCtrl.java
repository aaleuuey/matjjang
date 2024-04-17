package ctrl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import svc.*;
import vo.*;

@Controller
public class StoreCtrl {
	
	@Autowired
	StoreSvc storeSvc;

	public void setStoreSvc(StoreSvc storeSvc) {
		this.storeSvc = storeSvc;
	}
	
	@GetMapping("/storeList")
	public String storeList(Model model, HttpServletRequest request) throws Exception {
		List<StoreInfo> storeList = storeSvc.getStoreList();
		
		int cpage = 1, pcnt = 0, spage = 0, rcnt = 0, psize = 5, bsize = 5, num = 0;
		
		rcnt = storeSvc.getStoreListCount();
		
		model.addAttribute("storeList", storeList);
		return "store/storeList";
		
	}
	
	@GetMapping("/storeView")
	public String storeView(Model model, HttpServletRequest request) throws Exception {
		
		return "store/storeView";
		
	}
}
