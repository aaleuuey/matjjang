<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<style>
	.findId {width:350px;}
	.findId h3 {text-align:center; font-weight:700; font-size:23px;}
	.findId h1 {text-align:center; font-size:1.2em; color:#ffc107;}
	.findId span {display:block; margin-bottom:30px; font-size:21px; text-align:center; color:#666;}
	.findId ul li a {width: 150px; display: block; line-height: 46px; border-radius: 4px; text-align: center; background:#ffc720; color:#fff;}
	.findId ul li:last-child a {width:180px; background:silver;}
</style>
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between px-3 py-2 border-bottom">
	<div class="col-md-3 mb-2 mb-md-0">
		<a href="/matjjang" class="d-inline-flex link-body-emphasis text-decoration-none">
			<img class="bi" width="140" height="80" role="img" aria-label="Bootstrap" src="resources/img/matj-logo.png">
		</a>
	</div>
</header>
<div class="findId">
	<form name="frmLogin" action="findIdCheck" method="post">
		<h1 class="h3 mb-5 fw-bold">회원님의 아이디를 확인해주세요.</h1>
		<c:choose>
			<c:when test="${empty memberInfo}">
			<span>조회결과가 없습니다.</span>
			</c:when>
	        <c:otherwise>
	            <span>${memberInfo.mi_id}</span>
	        </c:otherwise>
		</c:choose>
		<div class="mem_box">
			<ul>
				<li>
					<a href="/matjjang/login">로그인 하기</a>
				</li>
				<li>
					<a href="/matjjang/findPw">비밀번호 찾기</a>
				</li>
			</ul>
		</div>
	</form>
</div>
