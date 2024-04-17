package ctrl;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;

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
		
		int cpage = 1, pcnt = 0, spage = 0, rcnt = 0, psize = 5, bsize = 5, num = 0;
		// 페이지번호,  페이지 크기,  블록크기,  레코드(게시글),  페이지개수 등을 저장할 변수
		
		if (request.getParameter("cpage") != null)
			cpage = Integer.parseInt(request.getParameter("cpage"));
		
		rcnt = storeSvc.getStoreListCount();
		
		pcnt = rcnt / psize;	if(rcnt % psize > 0)	pcnt++;
		spage = (cpage - 1) / bsize * bsize + 1;
		num = rcnt - (psize * (cpage - 1)); 
		PageInfo pi = new PageInfo();
		pi.setBsize(bsize);			pi.setCpage(cpage);
		pi.setPcnt(pcnt);			pi.setPsize(psize);
		pi.setRcnt(rcnt);			pi.setSpage(spage);
		pi.setNum(num);
		
		List<StoreInfo> storeList = storeSvc.getStoreList(pi);
		
		model.addAttribute("storeList", storeList);
		model.addAttribute("pi", pi);
		
		return "store/storeList";
		
	}
	
	// 맛집 등록 view
	@GetMapping("/storeIn")
	public String storeIn(HttpServletRequest request) throws Exception {

		return "store/storeIn";
	}
	
	@PostMapping("/storeProcIn")
	public String storeProcIn(Model model, HttpServletRequest request, @RequestPart("si_img1") Part siImg1,
	        @RequestPart("si_img2") Part siImg2, @RequestPart("si_img3") Part siImg3, @RequestParam("si_week") List<String> selectedDays, @RequestParam("si_parking") List<String> selectedOptions) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		   
		String day = String.join(",", selectedDays);	// 요일 사이 ,로 묶음
		String option = String.join(",", selectedOptions);
	   	
		
		StoreInfo si = new StoreInfo();
		String uploadFiles = "";
		
		si.setSi_id(request.getParameter("si_id"));
		si.setSc_id(request.getParameter("sc_id"));
		si.setSi_name(request.getParameter("si_name"));
		si.setSi_img1(getUploadFileName(siImg1.getHeader("content-disposition")));
		si.setSi_img2(getUploadFileName(siImg1.getHeader("content-disposition")));
		si.setSi_img3(getUploadFileName(siImg1.getHeader("content-disposition")));
		si.setSi_open(request.getParameter("si_open"));
		si.setSi_close(request.getParameter("si_close"));
		si.setSi_week(day);
		si.setSi_parking(option);
		si.setSi_addr1(request.getParameter("si_addr1"));
		si.setSi_addr2(request.getParameter("si_addr2"));
		si.setSi_number(request.getParameter("si_number"));
		si.setSi_explan(request.getParameter("si_explan"));
		si.setSi_isview(request.getParameter("si_isview"));
		si.setAi_idx(1);
		
		// 상품 등록 이미지 저장
		for (Part part : request.getParts()) {	// 모든 part들을 가져옴
			if (part.getName().startsWith("si_img")) {	// 파트의 이름이 si_img"로 시작하는 경우에만 처리
				String cd =  part.getHeader("content-disposition");	// 파트의 content-disposition 헤더를 읽어 옴
				String uploadName = getUploadFileName(cd); // getUploadFileName(cd)를 호출하여 업로드된 파일의 이름을 추출 이 이름은 실제 파일의 이름
				if (!uploadName.equals("")) { // 업로드된 파일의 이름이 비어 있지 않은 경우, 즉 파일이 실제로 업로드되었다면, 해당 파일을 서버에 저장  part.write(uploadName)을 사용하여 파일을 저장	
					uploadFiles += ", " + uploadName;
					part.write(uploadName);
				}
				
			}
		}
		if (!uploadFiles.equals(""))	uploadFiles = uploadFiles.substring(2); // 만약 uploadFiles가 비어 있지 않다면, 즉 파일이 업로드되었다면 맨 앞의 ,를 제거하여 정리
		
		int result = storeSvc.storeInsert(si);
		
		return "redirect:/storeList";
	
	}
	
	private String getUploadFileName(String cd) {	// cd :: form-data; name="si_img1"; filename="이미지.jpg";
		String uploadName = null;
		String[] arrContent = cd.split(";");	// cd.split(";")를 사용하여 content-disposition 헤더를 세미콜론(;)을 기준으로 분리
		
		int fIdx = arrContent[2].indexOf("\"");
		int sIdx = arrContent[2].lastIndexOf("\"");
		
		uploadName = arrContent[2].substring(fIdx + 1, sIdx); // substring(fIdx + 1, sIdx)를 사용하여 이 부분을 추출 fIdx + 1은 큰따옴표 다음 문자부터 시작하게 하기 위한 것
		return uploadName;
	}
}
