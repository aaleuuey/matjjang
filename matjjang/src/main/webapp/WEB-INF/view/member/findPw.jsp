<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<style>
	.findId h3 {text-align:center; font-weight:700; font-size:23px;}
	.findId h1 {text-align:center; font-weight:bold; color:#ffc107;}
</style>
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between px-3 py-2 border-bottom">
	<div class="col-md-3 mb-2 mb-md-0">
		<a href="/matjjang" class="d-inline-flex link-body-emphasis text-decoration-none">
			<img class="bi" width="140" height="80" role="img" aria-label="Bootstrap" src="resources/img/matj-logo.png">
		</a>
	</div>
</header>
<div class="findId">
	<form name="frmLogin" action="findIdCheck" method="post" onsubmit="return chkVal1(this);">
		<h1 class="h3 mb-5 fw-bold">비밀번호 찾기</h1>
		<div class="input01">
			<div>
				<input type="text" name="mi_name" value="" placeholder="아이디를 입력해주세요.">
			</div>
		</div>
		
		<div class="input01">
			<div>
				<input type="text" name="mi_email" value="" placeholder="이메일을 입력해주세요.">
			</div>
		</div>
		<button class="btn btn-warning w-100 py-2 mb-2" type="submit">비밀번호 찾기</button>
		<div class="mem_box">
			<ul>
				<li>
					<a href="/matjjang/joinForm">회원가입 하기</a>
				</li>
				<li>
					<a href="/matjjang/login">로그인 하기</a>
				</li>
			</ul>
		</div>
	</form>
</div>
<script>
function chkVal1(form){
	if (form.mi_name.value == "") {
		alert("이름을 입력해주세요.");
		form.mi_name.focus();
		return false;
	}
	
	if (form.mi_email.value == "") {
		alert("이메일을 입력해주세요.");
		form.mi_email.focus();
		return false;
	}
}
</script>
