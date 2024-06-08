<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<style>
	.findId {width:350px;}
	.findId h3 {text-align:center; font-weight:700; font-size:23px;}
	.findId h1 {text-align:center; font-size:1.2em; color:#ffc107;}
	.findId span {display:block; margin-bottom:5px; font-size:21px; text-align:center; color:#666;}
	.findId ul li a {width: 350px; display: block; line-height: 46px; border-radius: 4px; text-align: center; background:#ffc720; color:#fff;}
	.findId .warning {margin-bottom:30px; font-size:12px; color:red;}
</style>
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between px-3 py-2 border-bottom">
	<div class="col-md-3 mb-2 mb-md-0">
		<a href="/matjjang" class="d-inline-flex link-body-emphasis text-decoration-none">
			<img class="bi" width="140" height="80" role="img" aria-label="Bootstrap" src="resources/img/matj-logo.png">
		</a>
	</div>
</header>
<div class="findId">
	<h1 class="h3 mb-5 fw-bold">회원님의 임시 비밀번호 입니다.</h1>
	<span>${memberInfo.mi_pw}</span>
	<span class="warning">※ 안전을 위해 비밀번호를 변경해 주세요.</span>
	<div class="mem_box">
		<ul>
			<li>
				<a href="/matjjang/login">로그인 하기</a>
			</li>
		</ul>
	</div>
</div>
