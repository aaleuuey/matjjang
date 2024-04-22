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
		request.setCharacterEncoding("utf-8");
		
		int cpage = 1, pcnt = 0, spage = 0, rcnt = 0, psize = 5, bsize = 5;
		// 페이지번호,  페이지 크기,  블록크기,  레코드(게시글),  페이지개수 등을 저장할 변수
		
		if (request.getParameter("cpage") != null)
			cpage = Integer.parseInt(request.getParameter("cpage"));

		String keyword = request.getParameter("keyword");
		String where = "where si_isview = 'y'", schargs = "";
		String sc = request.getParameter("sc");
		String orderBy = " order by ";
		String ob = request.getParameter("ob");
		

		if (keyword != null && !keyword.equals("")) {	// 키워드가 null이 아니고 공백이 아니었을 때
			where += " and si_name like '%" + keyword + "%'";
		}
		
		if (sc != null && !sc.equals(""))	{	// 분류 코드가 null이 아니고 공백이 아니었을 때
			schargs += "&sc=" + sc;
			where += " and a.sc_id = '" + sc + "' "; 
		}
		
		if (ob == null || ob.equals(""))	ob = "a";	// 기본값 최신 순
		String obargs = "&ob=" + ob;
		
		switch (ob) {
		case "a" :	
			orderBy += " a.si_date desc ";		break;	// 최신 순
		case "b" :
			orderBy += " a.si_read desc ";		break;	// 인기 순
		case "c" :
			orderBy += " a.si_name asc ";		break; 	// 이름 순
		}
		
		rcnt = storeSvc.getStoreListCount(where);
		
		pcnt = rcnt / psize;	if(rcnt % psize > 0)	pcnt++;
		spage = (cpage - 1) / bsize * bsize + 1;
		
		PageInfo pi = new PageInfo();
		pi.setBsize(bsize);			pi.setCpage(cpage);
		pi.setPcnt(pcnt);			pi.setPsize(psize);
		pi.setRcnt(rcnt);			pi.setSpage(spage);
		pi.setObargs(obargs);		pi.setOrderby(orderBy);
		pi.setWhere(where);			pi.setOb(ob);	
		pi.setKeyword(keyword);
		if (sc != null && !sc.equals("")) {
			pi.setSc(sc);
		}
		
		List<StoreInfo> storeList = storeSvc.getStoreList(pi);
		
		model.addAttribute("storeList", storeList);
		model.addAttribute("pi", pi);
		model.addAttribute("rcnt", rcnt);
		model.addAttribute("sc", sc);
		return "store/storeList";
		
	}
	
	@GetMapping("/storeView")
	public String storeView(Model model, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String siid = request.getParameter("siid");
		
		List<StoreInfo> storeView = storeSvc.getStoreView(siid);
		
		// StoreInfo 객체의 List인 storeView에서 첫 번째 StoreInfo 객체를  가져옴
		StoreInfo si = storeView.get(0);
		
		// StoreInfo 객체에서 위도와 경도 값을 가져와서 문자열 변수에 저장
		String si_lat = si.getSi_lat();
		String si_lng = si.getSi_lng();
		
		model.addAttribute("storeView", storeView);
		model.addAttribute("si_lat", si_lat);
		model.addAttribute("si_lng", si_lng);
		
		return "store/storeView";
		
	}
}
