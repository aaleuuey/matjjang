<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<style>
	.butBox {margin:30px 0;}
	.comBtn {padding:5px 0; color:#ffc107; border:1px solid #ffc107; background:transparent; margin-right:5px;}
	.comBtn img {width:20px; height:20px; margin-right:3px; vertical-align:sub;}
	.comBtn.active {background:#ffc107; color:#fff;}
	.comtx {margin-bottom:5px;}
	.comtx h2 {font-size:14px; font-weight:bold;}
	.card-body h4 {font-size:20px; font-weight:bold;}
	.card-body p {margin-top:5px;}
</style>
<section id="content" style="width:1000px; margin:0 auto;">
	<div class="butBox">
		<button class="comBtn btn-outline-warning rounded-pill px-3" type="button">전체</button>
		<button class="comBtn btn-outline-warning rounded-pill px-3" type="button"><img class="bd-placeholder-img rounded-circle" src="resources/img/korean.png">한식</button>
		<button class="comBtn btn-outline-warning rounded-pill px-3" type="button"><img class="bd-placeholder-img rounded-circle" src="resources/img/western.png">양식</button>
		<button class="comBtn btn-outline-warning rounded-pill px-3" type="button"><img class="bd-placeholder-img rounded-circle" src="resources/img/chinese.png">중식</button>
		<button class="comBtn btn-outline-warning rounded-pill px-3" type="button"><img class="bd-placeholder-img rounded-circle" src="resources/img/japanese.png">일식</button>
		<button class="comBtn btn-outline-warning rounded-pill px-3" type="button"><img class="bd-placeholder-img" src="resources/img/cafe.png">디저트</button>
	</div>
	<form class="d-flex" role="search" style="justify-content:flex-end; margin-bottom:25px;">
	  	<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" style="width:300px;">
	  	<button class="btn btn-outline-dark" type="submit">Search</button>
	</form>
	<div class="comtx">
		<h2>추천 맛집(36)</h2>
	</div>
	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
		<div class="col">
			<a href="javascript:void(0);" class="card shadow-sm">
				<img class="bd-placeholder-img" width="100%" height="225" src="resources/img/food.png">
		  		<div class="card-body">
		  			<span class="text-body-secondary"><img width="12" height="12" style="vertical-align:baseline;" src="resources/img/star.png"> 4.5</span>
			    	<h4>정식당</h4>
			    	<span>청담동</span>
			    	<p class="card-text">포장용인절미, 유자빙수, 인절미, 증편, 주악, 약과</p>
			  	</div>
			</a>
		</div>
	</div>
</section>
<script>
$('.comBtn').click(function(){
	$(this).toggleClass('active');
});
</script>
<%@ include file="../inc/foot.jsp" %>