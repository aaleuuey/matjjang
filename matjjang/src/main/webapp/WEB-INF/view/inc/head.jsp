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
<script src="${pageContext.request.contextPath}/resources/js/addr_api.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/1.0.18/vue.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=9fobun4st8"></script>
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

