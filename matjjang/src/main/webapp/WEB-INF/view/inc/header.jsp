<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between px-3 py-2 border-bottom">
	<div class="col-md-3 mb-2 mb-md-0">
		<a href="/matjjang" class="d-inline-flex link-body-emphasis text-decoration-none">
			<img class="bi" width="140" height="80" role="img" aria-label="Bootstrap" src="resources/img/matj-logo.png">
		 <!--  <svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg> -->
		</a>
	</div>

	<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
		<!-- <li><a href="#" class="nav-link px-4 tx-main">맛집 등록</a></li> -->
		<li><a href="/matjjang/storeList" class="nav-link px-4 tx-main">맛집 추천</a></li>
		<li><a href="/matjjang/reviewList" class="nav-link px-4 tx-main">맛집 후기 게시판</a></li>
		<li><a href="#" class="nav-link px-4 tx-main">문의하기</a></li>
	</ul>

	<div class="col-md-3 text-end">
		<a href="/matjjang/login" class="btn btn-outline-warning me-2">로그인</a>
		<a href="/matjjang/joinForm" class="btn btn-warning">회원가입</a>
	</div>
</header>
