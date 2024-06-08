<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<%@ include file="../inc/header.jsp" %>
<div class="leave">
	<div class="profile_tabs">
		<ul class="authcd_y">
			<li class="false"><a href="/matjjang/info">회원정보변경</a></li>
			<li class="false"><a href="/matjjang/changePw">비밀번호변경</a></li>
			<li class="on"><a href="/matjjang/leave">회원탈퇴</a></li>
		</ul>
	</div>
	<div class="mp_profile_write">
		<div class="mp_member_out">
			<p>회원 탈퇴 신청 시 아래 사항을 반드시 확인해주세요.</p>
			<ol>
				<li>해당 아이디로 재가입 불가능<span>회원탈퇴를 신청하시면 해당 닉네임은 즉시 탈퇴 처리되며 기존에 사용하던 아이디로는 재가입이 불가합니다.</span></li>
				<li>회원정보 및 게시물 삭제<span>회원탈퇴 즉시 아래에 해당하는 개인정보가 삭제됩니다.<br>개인정보 : 이메일 계정, 비밀번호, 휴대폰번호, 생일, 성별 정보 삭제</span>
				</li>
			</ol>
		</div>
		<div class="btn_box">
			<ul>
				<li><a class="btnTy14" href="/users/604940/list">취소</a></li>
				<li><a href="javascript:isLeave();" class="btnTy15">탈퇴하기</a></li>
			</ul>
		</div>
	</div>
</div>
<script>
function isLeave() {
	if(confirm("정말 탈퇴하시겠습니까?")) {
		location.href="memberLeave";
	}
}
</script>
<%@ include file="../inc/foot.jsp" %>