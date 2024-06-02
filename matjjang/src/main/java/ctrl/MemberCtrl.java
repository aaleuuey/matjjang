package ctrl;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import svc.*;
import vo.MemberInfo;

@Controller
public class MemberCtrl {
	private MemberSvc memberSvc;

	public void setMemberSvc(MemberSvc memberSvc) {
		this.memberSvc = memberSvc;
	}
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "member/joinForm";
	}
	
	@PostMapping("/chkId")
	@ResponseBody
	public String chkId(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		String uid = request.getParameter("uid").trim().toLowerCase();
		System.out.println(uid);
		int result = memberSvc.chkId(uid);

		return result + "";
	}
	
	@PostMapping("/chkPw")
	@ResponseBody
	public String chkPw(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String pw = request.getParameter("pw").trim().toLowerCase();
		String pwCheck = request.getParameter("pwCheck").trim().toLowerCase();
		
		System.out.println(pw);
		System.out.println(pwCheck);
		
		int result = 0;
		
		if (!pw.equals(pwCheck))	result = 0;
		else						result = 1;

		return result + "";
	}
	
	@PostMapping("/memberJoin")
	public String memberJoin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		MemberInfo mi = new MemberInfo();
		mi.setMi_id(request.getParameter("mi_id"));
		mi.setMi_pw(request.getParameter("mi_pw"));
		mi.setMi_name(request.getParameter("mi_name"));
		mi.setMi_email(request.getParameter("e1") + "@" + request.getParameter("e3"));
		mi.setMi_phone(request.getParameter("p1") + "-" + request.getParameter("p2") + "-" + request.getParameter("p3"));
		mi.setMi_birth(request.getParameter("year") + "-" + request.getParameter("month") + "-" + request.getParameter("day"));
		mi.setMi_gender(request.getParameter("mi_gender"));
		
		int result = memberSvc.memberInsert(mi);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result != 1) {
			out.println("<script>");
			out.println("alert('ȸ�������� ���������� ó������ �ʾҽ��ϴ�. ȸ�������� �ٽ� ���ּ���.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		
		return "redirect:/login";
	}
	
	@GetMapping("/mypage")
	public String mypage(Model model, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		MemberInfo loginInfo = (MemberInfo)session.getAttribute("loginInfo");
		String miid = loginInfo.getMi_id();
		
		int bkcnt = memberSvc.getBookMarkCount(miid);
		int rvcnt = memberSvc.getReviewCount(miid);
		int htcnt = memberSvc.getHeartCount(miid);
		
		model.addAttribute("bkcnt", bkcnt);
		model.addAttribute("rvcnt", rvcnt);
		model.addAttribute("htcnt", htcnt);
		
		return "member/mypage";
	}

}
