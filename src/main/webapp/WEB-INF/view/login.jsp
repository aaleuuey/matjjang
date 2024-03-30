<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="inc/head.jsp" %>
<style>
	.login {width:500px; margin:80px auto 0;}
	.login h3 {text-align:center; font-weight:700; font-size:23px;}
	.simg {width:20px; margin-right:6px;}
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
	<form>
		<h1 class="h3 mb-3 fw-normal">로그인</h1>
		<div class="form-floating mb-2">
			<input type="id" class="form-control" id="floatingInput" placeholder="아이디를 입력하세요" required>
			<label for="floatingInput">ID</label>
			<div class="valid-feedback">아이디를 입력해주세요</div>
		</div>
		
		<div class="form-floating">
			<input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호를 입력하세요" required>
			<label for="floatingPassword">Password</label>
			<div class="invalid-feedback">비밀번호를 입력해주세요</div>
		</div>
		
		<div class="form-check text-start my-3">
			<input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
			<label class="form-check-label" for="flexCheckDefault">Remember me</label>
		</div>
		
		<button class="btn btn-warning w-100 py-2 mb-2" type="submit">로그인</button>
		<a href="javascript:void(0);" class="btn btn-dark w-100 py-2 mb-4">회원가입</a>
		<a href="javascript:void(0);" class="btn btn-dark w-100 py-2" style="background:#fae100; border:1px solid #fae100;"><img src="/matjjang/resources/img/kakao_login.png" class="simg">카카오톡으로 시작하기</a>
	</form>
</div>

