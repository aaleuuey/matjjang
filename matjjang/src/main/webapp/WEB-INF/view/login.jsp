<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="inc/head.jsp" %>
<style>
	.login {width:500px; margin:80px auto 0;}
	.login h3 {text-align:center; font-weight:700; font-size:23px;}
	.simg {width:20px; margin-right:6px; vertical-align:text-bottom;}
	.mem_box {display:flex; justify-content:center; padding: 11px 0; margin-top: 19px; margin-bottom: 19px;}
	.mem_box ul {margin:0; padding:0;}
	.mem_box ul li {display: inline-block; padding: 0 12px 0 16px; position: relative;}
	.mem_box ul li:nth-child(2):before {content: ''; position: absolute; left: 0; top: 4px; width: 1px; height: 15px; background: #000;}
	.mem_box ul li a {font-size: 15px; letter-spacing: -.50px; color:#222;}
</style>
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between px-3 py-2 border-bottom">
	<div class="col-md-3 mb-2 mb-md-0">
		<a href="/matjjang" class="d-inline-flex link-body-emphasis text-decoration-none">
			<img class="bi" width="140" height="80" role="img" aria-label="Bootstrap" src="resources/img/matj-logo.png">
		 <!--  <svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg> -->
		</a>
	</div>
</header>
<div class="login">
	<form name="frmLogin" action="login" method="post">
		<h1 class="h3 mb-3 fw-normal">로그인</h1>
		<div class="form-floating mb-2">
			<input type="text" class="form-control" id="floatingInput" name="uid" value="" placeholder="아이디를 입력하세요" required>
			<label for="floatingInput">ID</label>
			<div class="valid-feedback">아이디를 입력해주세요</div>
		</div>
		
		<div class="form-floating">
			<input type="password" class="form-control" id="floatingPassword" name="pwd" value="" placeholder="비밀번호를 입력하세요" required>
			<label for="floatingPassword">Password</label>
			<div class="invalid-feedback">비밀번호를 입력해주세요</div>
		</div>
		
		<div class="mem_box">
			<ul>
				<li>
					<a href="/login/findPassword">아이디 찾기</a>
				</li>
				<li>
					<a href="/join/intro">비밀번호 찾기</a>
				</li>
			</ul>
		</div>
		
		<button class="btn btn-warning w-100 py-2 mb-2" type="submit">로그인</button>
		<a href="/matjjang/joinForm" class="btn btn-dark w-100 py-2 mb-4">회원가입</a>
		<a href="javascript:void(0);" class="btn btn-dark w-100 py-2" style="background:#fae100; border:1px solid #fae100; color:#000; font-size:15px;"><img src="/matjjang/resources/img/kakao_login.png" class="simg">카카오톡 로그인</a>
	</form>
</div>

