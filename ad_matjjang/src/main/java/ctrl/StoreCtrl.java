package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
		
		return "store/storeList";
		
	}
	
	// 맛집 등록 view
	@GetMapping("/storeIn")
	public String storeIn(HttpServletRequest request) throws Exception {
		
		return "store/storeIn";
	}
	
	@PostMapping("/storeProcIn")
	public String storeProcIn(HttpServletRequest request, @RequestPart("si_img1") Part siImg1,
	        @RequestPart("si_img1") Part siImg2, @RequestPart("si_img1") Part siImg3) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		StoreInfo ci = new StoreInfo();
		String uploadFiles = "";
		
		ci.setSi_id(request.getParameter("si_id"));
		ci.setSc_id(request.getParameter("sc_id"));
		
		System.out.println(request.getParameter("sc_id"));
		System.out.println(request.getParameter("si_name"));
		System.out.println(getUploadFileName(siImg1.getHeader("content-disposition")));
		System.out.println(getUploadFileName(siImg2.getHeader("content-disposition")));
		System.out.println(getUploadFileName(siImg2.getHeader("content-disposition")));
		System.out.println(request.getParameter("si_open"));
		System.out.println(request.getParameter("si_close"));
		System.out.println(request.getParameter("si_week"));
		System.out.println(request.getParameter("si_parking"));
		System.out.println(request.getParameter("si_addr1"));
		System.out.println(request.getParameter("si_addr2"));
		System.out.println(request.getParameter("si_number"));
		System.out.println(request.getParameter("si_explan"));
		
		ci.setSi_id(request.getParameter("si_id"));
		
		// 상품 등록 이미지 저장
		for (Part part : request.getParts()) {	// 모든 part들을 가져옴
			if (part.getName().startsWith("si_img")) {	// 파트의 이름이 "pi_img"로 시작하거나 이름이 "pi_desc"인 경우에만 처리
				String cd =  part.getHeader("content-disposition");	// 파트의 content-disposition 헤더를 읽어 옴
				String uploadName = getUploadFileName(cd); // getUploadFileName(cd)를 호출하여 업로드된 파일의 이름을 추출 이 이름은 실제 파일의 이름
				if (!uploadName.equals("")) { // 업로드된 파일의 이름이 비어 있지 않은 경우, 즉 파일이 실제로 업로드되었다면, 해당 파일을 서버에 저장  part.write(uploadName)을 사용하여 파일을 저장	
					uploadFiles += ", " + uploadName;
					part.write(uploadName);
				}
				
			}
		}
		if (!uploadFiles.equals(""))	uploadFiles = uploadFiles.substring(2); // 만약 uploadFiles가 비어 있지 않다면, 즉 파일이 업로드되었다면 맨 앞의 ,를 제거하여 정리
		
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
