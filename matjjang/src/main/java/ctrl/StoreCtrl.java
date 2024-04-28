package ctrl;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

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
		List<StoreReplyList> storeReplyList = storeSvc.getStoreReplyList(siid);
		
		// StoreInfo 객체의 List인 storeView에서 첫 번째 StoreInfo 객체를  가져옴
		StoreInfo si = storeView.get(0);
		
		// StoreInfo 객체에서 위도와 경도 값을 가져와서 문자열 변수에 저장
		String si_lat = si.getSi_lat();
		String si_lng = si.getSi_lng();	
		
		model.addAttribute("storeView", storeView);
		model.addAttribute("siid", siid);
		model.addAttribute("storeReplyList", storeReplyList);
		model.addAttribute("si_lat", si_lat);
		model.addAttribute("si_lng", si_lng);
		
		return "store/storeView";
		
	}
	
	@PostMapping("/storeReplyIn")
	public String storeReplyeInProc(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "imageFiles", required = false) MultipartFile[] imageFiles, @RequestParam("imageNames[]") String[] imageNames) throws Exception {
																											// 이미지를 전송하지 않았을 경우를 위해 피라미터 필수가 아닌 선택적으로 설정
		request.setCharacterEncoding("utf-8");
		
		String uploadPath = "C:/Users/naeha/eclipse-workspace/matjjang/matjjang/src/main/webapp/resources/img/storeReply";
		
		String uploadFiles = "";
		String siid = request.getParameter("siid");
		System.out.println(request.getParameter("rcon"));
		System.out.println(request.getParameter("rstar"));
		
		StoreReplyList srl = new StoreReplyList();
		
		HttpSession session = request.getSession();
		MemberInfo mi = (MemberInfo)session.getAttribute("loginInfo");
		
		srl.setMi_id(mi.getMi_id());
		srl.setSi_id(request.getParameter("siid"));
		srl.setSr_content(request.getParameter("rcon"));
		srl.setSr_star(request.getParameter("rstar"));
	
		for (int i = 0; i < imageNames.length; i++) {
			if (i == 0) {
				String sr_img1 = imageNames[i];
				srl.setSr_img1(sr_img1);

			} else if (i == 1) {
				String sr_img2 = imageNames[i];
				srl.setSr_img2(sr_img2);
			} else if (i == 2) {
				String sr_img3 = imageNames[i];
				srl.setSr_img3(sr_img3);
			}
	    }
		
		int result = storeSvc.StoreReplyInsert(srl);
		
		// 이미지 서버에 저장
	    for (MultipartFile file : imageFiles) {
	        if (!file.isEmpty()) {
	            String fileName = file.getOriginalFilename();
	            String filePath = uploadPath + File.separator + fileName;
	            File dest = new File(filePath);
	            file.transferTo(dest);
	            uploadFiles += ", " + fileName;
	        }
	    }
		
		if (!uploadFiles.equals(""))	uploadFiles = uploadFiles.substring(2);
		
		
		
		return "redirect:/storeView?siid=" + siid + "&sridx=" + result;
		
		
	}

}
