<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.*" %>
<%@ page import="java.time.*" %>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap-grid.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap-reboot.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>Insert title here</title>
</head>
<style>
	.main {width:100px; height:100px; background:pink;}
	.tx-main {color:#f4b183;}
	.bg-main {background:#f4b183;}
	.nav {--bs-nav-link-hover-color:#dc3545;}
	.col-lg-4 {width:20%;}
	.marketing .btn {color:#fff;}
	.marketing .btn:hover {background:#fff; color:#f4b183; border:1px solid #f4b183;}
	.carousel-item {height:400px;}
	a {text-decoration:none;}
</style>
<body>

	<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between px-3 py-2 border-bottom">
		<div class="col-md-3 mb-2 mb-md-0">
			<a href="/matjjang" class="d-inline-flex link-body-emphasis text-decoration-none">
				<img class="bi" width="140" height="80" role="img" aria-label="Bootstrap" src="resources/img/matj-logo.png">
			 <!--  <svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg> -->
			</a>
		</div>
	
		<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
			<!-- <li><a href="#" class="nav-link px-4 tx-main">맛집 등록</a></li> -->
			<li><a href="/matjjang/commendList" class="nav-link px-4 tx-main">맛집 추천</a></li>
			<li><a href="/matjjang/reviewList" class="nav-link px-4 tx-main">맛집 후기 게시판</a></li>
			<li><a href="#" class="nav-link px-4 tx-main">문의하기</a></li>
		</ul>
	
		<div class="col-md-3 text-end">
			<button type="button" class="btn btn-outline-warning me-2">로그인</button>
			<button type="button" class="btn btn-warning">회원가입</button>
		</div>
	</header>
