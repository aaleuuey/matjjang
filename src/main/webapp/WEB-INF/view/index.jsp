<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="inc/head.jsp" %>
<style>
	.main {width:100px; height:100px; background:pink;}
	.tx-main {color:#f4b183;}
	.bg-main {background:#f4b183;}
	.nav {--bs-nav-link-hover-color:#dc3545;}
	.col-lg-4 {width:20%;}
	.marketing .btn {color:#fff;}
	.marketing .btn:hover {background:#fff; color:#f4b183; border:1px solid #f4b183;}
	.carousel-item {height:400px;}
</style>
</head>
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
			<li><a href="#" class="nav-link px-4 tx-main">맛집 추천</a></li>
			<li><a href="#" class="nav-link px-4 tx-main">맛집 후기 게시판</a></li>
			<li><a href="#" class="nav-link px-4 tx-main">문의하기</a></li>
		</ul>
	
		<div class="col-md-3 text-end">
			<button type="button" class="btn btn-outline-warning me-2">Login</button>
			<button type="button" class="btn btn-warning">Sign-up</button>
		</div>
	</header>
	<div id="myCarousel" class="carousel slide mb-6 pointer-event" data-bs-ride="carousel">
		<div class="carousel-indicators">
		  <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-label="Slide 1" aria-current="true"></button>
		  <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
		  <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
		</div>
		<div class="carousel-inner">
		    <div class="carousel-item active">
				<div class="imgbox"><img src="resources/img/matj-banner.jpg"></div>
				<div class="container">
					<div class="carousel-caption text-start">
					<h1>Another example headline.</h1>
						<p>Some representative placeholder content for the second slide of the carousel.</p>
						<p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
					</div>
				</div>
		    </div>
		    <div class="carousel-item">
		     	<div class="imgbox"><img src="resources/img/matj-banner02.jpg"></div>
				<div class="container">
					<div class="carousel-caption">
						<h1>Another example headline.</h1>
						<p>Some representative placeholder content for the second slide of the carousel.</p>
						<p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
					</div>
				</div>
		    </div>
		    <div class="carousel-item">
				<div class="imgbox"><img src="resources/img/matj-banner03.jpg"></div>
				<div class="container">
					<div class="carousel-caption text-end">
						<h1>One more for good measure.</h1>
						<p>Some representative placeholder content for the third slide of this carousel.</p>
						<p><a class="btn btn-lg btn-primary" href="#">Browse gallery</a></p>
					</div>
				</div>
		    </div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	 </div>
	<div class="container marketing">
		<div class="row">
			<div class="col-lg-4">
				<img class="bd-placeholder-img rounded-circle" width="140" height="140" src="resources/img/korean.png">
				<p><a class="btn bg-main mt-2" href="#">한식 »</a></p>
			</div><!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img class="bd-placeholder-img rounded-circle" width="140" height="140" src="resources/img/western.png">
				<p><a class="btn bg-main mt-2" href="#">양식 »</a></p>
			</div><!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img class="bd-placeholder-img rounded-circle" width="140" height="140" src="resources/img/chinese.png">
				<p><a class="btn bg-main mt-2" href="#">중식 »</a></p>
			</div><!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img class="bd-placeholder-img rounded-circle" width="140" height="140" src="resources/img/japanese.png">
				<p><a class="btn bg-main mt-2" href="#">일식 »</a></p>
			</div><!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img class="bd-placeholder-img" width="140" height="140" src="resources/img/cafe.png">
				<p><a class="btn bg-main mt-2" href="#">디저트 »</a></p>
			</div><!-- /.col-lg-4 -->
		</div><!-- /.row -->	
	</div>
	<div class="py-5">
		<div class="container">
			<h3 class="mb-3 fs-3 fw-bold">인기 맛집</h3>
		    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<div class="col">
					<div class="card shadow-sm">
						<img class="bd-placeholder-img" width="100%" height="225" src="resources/img/food.png">
					  	<div class="card-body">
					  		<span class="text-body-secondary"><img width="12" height="12" style="vertical-align:baseline;" src="resources/img/star.png"> 4.5</span>
					    	<p class="card-text">정말 맛있어요!</p>
					    	<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
					        		<button type="button" class="btn btn-sm btn-outline-secondary">View More</button>
					      		</div>
							</div>
					  	</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="py-5">
		<div class="container">
			<h3 class="mb-3 fs-3 fw-bold">후기 게시판</h3>
		    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<div class="col">
					<div class="card shadow-sm">
						<img class="bd-placeholder-img" width="100%" height="225" src="resources/img/food.png">
					  	<div class="card-body">
					  		<span class="text-body-secondary"><img width="12" height="12" style="vertical-align:baseline;" src="resources/img/star.png"> 4.5</span>
					    	<p class="card-text">정말 맛있어요!</p>
					    	<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
					        		<button type="button" class="btn btn-sm btn-outline-secondary">View More</button>
					      		</div>
							</div>
					  	</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="inc/foot.jsp" %>