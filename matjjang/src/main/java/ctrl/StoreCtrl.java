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
		int cpage = 1, pcnt = 0, spage = 0, rcnt = 0, psize = 5, bsize = 5;
		// ��������ȣ,  ������ ũ��,  ���ũ��,  ���ڵ�(�Խñ�),  ���������� ���� ������ ����
		
		if (request.getParameter("cpage") != null)
			cpage = Integer.parseInt(request.getParameter("cpage"));

		// String where = " where si_isview = 'y' and ", schargs = "";
		String sc = request.getParameter("sc");
		String orderBy = " order by ";
		String ob = request.getParameter("ob");
		String obargs = "&ob=" + ob;
		
		if (ob == null || ob.equals(""))	ob = "a";	// �⺻�� �ֽ� ��
		
		switch (ob) {
		case "a" :	
			orderBy += " a.si_date desc ";		break;	// �ֽ� ��
		case "b" :
			orderBy += " a.si_read desc ";		break;	// �α� ��
		case "c" :
			orderBy += " a.si_name asc ";		break; 	// �̸� ��
		}
		
		rcnt = storeSvc.getStoreListCount();
		
		pcnt = rcnt / psize;	if(rcnt % psize > 0)	pcnt++;
		spage = (cpage - 1) / bsize * bsize + 1;
		
		PageInfo pi = new PageInfo();
		pi.setBsize(bsize);			pi.setCpage(cpage);
		pi.setPcnt(pcnt);			pi.setPsize(psize);
		pi.setRcnt(rcnt);			pi.setSpage(spage);
		pi.setObargs(obargs);		pi.setOrderby(orderBy);
		if (sc != null && !sc.equals("")) {
			pi.setSc(sc);
		}
		
		List<StoreInfo> storeList = storeSvc.getStoreList(pi);
		
		
		
		rcnt = storeSvc.getStoreListCount();
		
		model.addAttribute("storeList", storeList);
		return "store/storeList";
		
	}
	
	@GetMapping("/storeView")
	public String storeView(Model model, HttpServletRequest request) throws Exception {
		
		return "store/storeView";
		
	}
}
