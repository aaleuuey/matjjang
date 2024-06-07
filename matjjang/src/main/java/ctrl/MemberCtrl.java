package ctrl;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import svc.*;
import vo.*;

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
		
		List<BookmarkInfo> bookmarkView = memberSvc.getBookmarkView(miid);
		List<BookmarkImageInfo> bookmarkImages = memberSvc.getBookmarkImages(miid);
		List<StoreReplyList> replyList = memberSvc.getReplyList(miid);
		List<HeartInfo> heartInfo = memberSvc.getHeartInfo(miid);
		
		int bkcnt = memberSvc.getBookMarkCount(miid);
		int rvcnt = memberSvc.getReviewCount(miid);
		int htcnt = memberSvc.getHeartCount(miid);
		
		model.addAttribute("bookmarkView", bookmarkView);
		model.addAttribute("bookmarkImages", bookmarkImages);
		model.addAttribute("replyList", replyList);
		model.addAttribute("heartInfo", heartInfo);
		model.addAttribute("bkcnt", bkcnt);
		model.addAttribute("rvcnt", rvcnt);
		model.addAttribute("htcnt", htcnt);
		model.addAttribute("miid", miid);
		
		return "member/mypage";
	}
	
	@PostMapping("/folderAddProc")
	@ResponseBody
	public String folderAddProc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String miid = request.getParameter("miid");
		String txCont = request.getParameter("txCont");
		
		int result = memberSvc.folderAdd(miid, txCont);
		
		return result + "";
	}
	
	@PostMapping("/folderUpdate")
	@ResponseBody
	public String folderUpdateProc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String miid = request.getParameter("miid");
		int bfidx = Integer.parseInt(request.getParameter("bfidx"));
		String txCont = request.getParameter("txCont");
		
		System.out.println(request.getParameter("txCont"));
		
		int result = memberSvc.folderUpdate(miid, bfidx, txCont);
		
		return result + "";
	}
	
	@PostMapping("/folderDelete")
	@ResponseBody
	public String folderDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String miid = request.getParameter("miid");
		int bfidx = Integer.parseInt(request.getParameter("bfidx"));
		
		int result = memberSvc.folderDelete(miid, bfidx);
		
		return result + "";
	}
	
	
	@GetMapping("/info")
	public String info(Model model, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		MemberInfo loginInfo = (MemberInfo)session.getAttribute("loginInfo");
		
		List<MemberInfo> memberInfo = memberSvc.getMemberInfo(loginInfo.getMi_id());
		
		MemberInfo mi = memberInfo.get(0);
		
		String mi_name = mi.getMi_name();
		String mi_phone = mi.getMi_phone();
		String mi_email = mi.getMi_email();
		
		model.addAttribute("mi_name", mi_name);
		model.addAttribute("mi_phone", mi_phone);
		model.addAttribute("mi_email", mi_email);
		
		return "member/info";
	}
	
	@PostMapping("/infoChange")
	public String infoChange(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		MemberInfo loginInfo = (MemberInfo)session.getAttribute("loginInfo");
		
		String mi_name = request.getParameter("mi_name");
		String mi_email = request.getParameter("mi_email");
		String mi_phone = request.getParameter("mi_phone");
		
		int result = memberSvc.getInfoChange(mi_name, mi_email, mi_phone, loginInfo.getMi_id());
		
		if (result >= 1) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('���� �Ǿ����ϴ�.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		
		return "redirect:/member/info";
	}
	
	
	@GetMapping("/leave")
	public String leave(Model model, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		return "member/leave";
	}
	
	@GetMapping("/memberLeave")
	public String memberOut(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberInfo loginInfo = (MemberInfo)session.getAttribute("loginInfo");
		String miid = loginInfo.getMi_id();
		
		int result = memberSvc.memberLeave(miid);
		
		if (result > 0) {
			session.invalidate();
		}

		return "redirect:/";
	}
	
	@GetMapping("/findId")
	public String findIdProc() {
		return "member/findId";
	}
	
	@PostMapping("/findIdCheck")
	public String findIdCheck(Model model, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String mi_name = request.getParameter("mi_name");
		String mi_email = request.getParameter("mi_email");
		
		MemberInfo memberInfo = memberSvc.getFindIdCheck(mi_name, mi_email);
		
		model.addAttribute("memberInfo", memberInfo);
		
		
		return "member/findIdResult";
	}

	@GetMapping("/findPw")
	public String findPw() {
		return "member/findPw";
	}
}
