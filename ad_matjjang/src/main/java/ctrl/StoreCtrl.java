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
		
		int cpage = 1, pcnt = 0, spage = 0, rcnt = 0, psize = 5, bsize = 5;
		// ��������ȣ,  ������ ũ��,  ���ũ��,  ���ڵ�(�Խñ�),  ���������� ���� ������ ����
		
		if (request.getParameter("cpage") != null)
			cpage = Integer.parseInt(request.getParameter("cpage"));
		
		rcnt = storeSvc.getStoreListCount();
		
		pcnt = rcnt / psize;	if(rcnt % psize > 0)	pcnt++;
		spage = (cpage - 1) / bsize * bsize + 1;
		
		PageInfo pi = new PageInfo();
		pi.setBsize(bsize);			pi.setCpage(cpage);
		pi.setPcnt(pcnt);			pi.setPsize(psize);
		pi.setRcnt(rcnt);			pi.setSpage(spage);
		
		List<StoreInfo> storeList = storeSvc.getStoreList(pi);
		
		model.addAttribute("storeList", storeList);
		model.addAttribute("pi", pi);
		
		return "store/storeList";
		
	}
	
	// ���� ��� view
	@GetMapping("/storeIn")
	public String storeIn(HttpServletRequest request) throws Exception {

		return "store/storeIn";
	}
	
	@PostMapping("/storeProcIn")
	public String storeProcIn(Model model, HttpServletRequest request, @RequestPart("si_img1") Part siImg1,
	        @RequestPart("si_img2") Part siImg2, @RequestPart("si_img3") Part siImg3, @RequestParam("si_week") List<String> selectedDays, @RequestParam("si_parking") List<String> selectedOptions) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		   
		String day = String.join(",", selectedDays);	// ���� ���� ,�� ����
		String option = String.join(",", selectedOptions);
	   	
		
		StoreInfo si = new StoreInfo();
		String uploadFiles = "";
		
		si.setSi_id(request.getParameter("si_id"));
		si.setSc_id(request.getParameter("sc_id"));
		si.setSi_name(request.getParameter("si_name"));
		si.setSi_star(request.getParameter("si_star"));
		si.setSi_img1(getUploadFileName(siImg1.getHeader("content-disposition")));
		si.setSi_img2(getUploadFileName(siImg2.getHeader("content-disposition")));
		si.setSi_img3(getUploadFileName(siImg3.getHeader("content-disposition")));
		si.setSi_open(request.getParameter("si_open"));
		si.setSi_close(request.getParameter("si_close"));
		si.setSi_week(day);
		si.setSi_parking(option);
		si.setSi_addr1(request.getParameter("si_addr1"));
		si.setSi_addr2(request.getParameter("si_addr2"));
		si.setSi_lat(request.getParameter("si_lat"));
		si.setSi_lng(request.getParameter("si_lng"));
		si.setSi_number(request.getParameter("si_number"));
		si.setSi_explan(request.getParameter("si_explan"));
		si.setSi_isview(request.getParameter("si_isview"));
		si.setAi_idx(1);
		
		// ��ǰ ��� �̹��� ����
		for (Part part : request.getParts()) {	// ��� part���� ������
			if (part.getName().startsWith("si_img")) {	// ��Ʈ�� �̸��� si_img"�� �����ϴ� ��쿡�� ó��
				String cd =  part.getHeader("content-disposition");	// ��Ʈ�� content-disposition ����� �о� ��
				String uploadName = getUploadFileName(cd); // getUploadFileName(cd)�� ȣ���Ͽ� ���ε�� ������ �̸��� ���� �� �̸��� ���� ������ �̸�
				if (!uploadName.equals("")) { // ���ε�� ������ �̸��� ��� ���� ���� ���, �� ������ ������ ���ε�Ǿ��ٸ�, �ش� ������ ������ ����  part.write(uploadName)�� ����Ͽ� ������ ����	
					uploadFiles += ", " + uploadName;
					part.write(uploadName);
				}
				
			}
		}
		if (!uploadFiles.equals(""))	uploadFiles = uploadFiles.substring(2); // ���� uploadFiles�� ��� ���� �ʴٸ�, �� ������ ���ε�Ǿ��ٸ� �� ���� ,�� �����Ͽ� ����
		
		int result = storeSvc.storeInsert(si);
		
		return "redirect:/storeList";
	
	}
	
	private String getUploadFileName(String cd) {	// cd :: form-data; name="si_img1"; filename="�̹���.jpg";
		String uploadName = null;
		String[] arrContent = cd.split(";");	// cd.split(";")�� ����Ͽ� content-disposition ����� �����ݷ�(;)�� �������� �и�
		
		int fIdx = arrContent[2].indexOf("\"");
		int sIdx = arrContent[2].lastIndexOf("\"");
		
		uploadName = arrContent[2].substring(fIdx + 1, sIdx); // substring(fIdx + 1, sIdx)�� ����Ͽ� �� �κ��� ���� fIdx + 1�� ū����ǥ ���� ���ں��� �����ϰ� �ϱ� ���� ��
		return uploadName;
	}
}
