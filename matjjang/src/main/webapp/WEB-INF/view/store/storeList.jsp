<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<%@ include file="../inc/header.jsp" %>
<style>
	.butBox {margin:30px 0;}
	.comBtn {padding:5px 0; color:#ffc107; border:1px solid #ffc107; background:transparent; margin-right:5px;}
	.comBtn img {width:20px; height:20px; margin-right:3px; vertical-align:sub;}
	.comBtn.active {background:#ffc107; color:#fff;}
	.comtx {margin-bottom:5px;}
	.comtx h2 {font-size:14px; font-weight:bold;}
	.card-body h4 {font-size:20px; font-weight:bold;}
	.card-body p {margin-top:5px;}
	.inline-div {display: inline-block; margin:5px 5px 0 0; font-size:14px; vertical-align: top;}
	.inline-div p {font-size: 14px; font-weight: 400; color: #666; line-height: 1;}
	.inline-div p span {display: inline-block; width: 40px; line-height: 20px; border-radius: 5px; font-size: 14px; color: #999; border: 1px solid #ddd; text-align: center; margin-right: 5px;}
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
		<select name="schtype" style="margin-right:10px; border:var(--bs-border-width) solid var(--bs-border-color); border-radius:var(--bs-border-radius);">
			<option value="title">최신 순</option>
			<option value="writer">인기 순</option>
			<option value="writer">이름 순</option>
		</select>
	  	<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" style="width:300px;">
	  	<button class="btn btn-outline-dark" type="submit">Search</button>
	</form>
	
	<div class="comtx">
		<h2>추천 맛집(55)</h2>
	</div>
	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
	<c:forEach items="${storeList}" var="store">
		<div class="col">
			<a href="/matjjang/storeView" class="card shadow-sm">
				<img class="bd-placeholder-img" width="100%" height="225" src="/ad_matjjang/resources/img/store/${store.si_img1}">
				<div class="card-body">
					<span class="text-body-secondary"><img width="12" height="12" style="margin-right:4px; vertical-align:baseline;" src="resources/img/star.png">${store.si_star}</span>
				  	<h4>${store.si_name}</h4>
				  	<div class="inline-div">매일</div>
					<div class="inline-div">
						<label>${store.si_open} ~ ${store.si_close}</label>
					</div>
					<div class="inline-div">
						<div class="inline-div">${store.si_addr1}</div>
						<p><span>지번</span>${store.si_addr2}</p>
					</div>
				</div>
			</a>
		</div>
	</c:forEach>
	</div>

</section>
<script>
$('.comBtn').click(function(){
	$(this).toggleClass('active');
});
</script>
<%@ include file="../inc/foot.jsp" %>