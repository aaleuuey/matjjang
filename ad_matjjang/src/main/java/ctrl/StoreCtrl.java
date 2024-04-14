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
	
	// ���� ��� view
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
		
		// ��ǰ ��� �̹��� ����
		for (Part part : request.getParts()) {	// ��� part���� ������
			if (part.getName().startsWith("si_img")) {	// ��Ʈ�� �̸��� "pi_img"�� �����ϰų� �̸��� "pi_desc"�� ��쿡�� ó��
				String cd =  part.getHeader("content-disposition");	// ��Ʈ�� content-disposition ����� �о� ��
				String uploadName = getUploadFileName(cd); // getUploadFileName(cd)�� ȣ���Ͽ� ���ε�� ������ �̸��� ���� �� �̸��� ���� ������ �̸�
				if (!uploadName.equals("")) { // ���ε�� ������ �̸��� ��� ���� ���� ���, �� ������ ������ ���ε�Ǿ��ٸ�, �ش� ������ ������ ����  part.write(uploadName)�� ����Ͽ� ������ ����	
					uploadFiles += ", " + uploadName;
					part.write(uploadName);
				}
				
			}
		}
		if (!uploadFiles.equals(""))	uploadFiles = uploadFiles.substring(2); // ���� uploadFiles�� ��� ���� �ʴٸ�, �� ������ ���ε�Ǿ��ٸ� �� ���� ,�� �����Ͽ� ����
		
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
