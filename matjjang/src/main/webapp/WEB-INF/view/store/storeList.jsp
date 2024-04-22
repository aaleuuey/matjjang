<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<%@ include file="../inc/header.jsp" %>
<style>
	.butBox {margin:30px 0;}
	.butBox .all {background:#ffc107; color:#fff;}
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
	#${sc} {background:#ffc107; color:#fff;}
</style>
<script>
window.onload = function () { 
	new Vue({
		
	});
};
</script>
<section id="content" style="width:1000px; margin:0 auto;">
	<div id="app" class="butBox">
		<a href="/matjjang/storeList" class="comBtn btn-outline-warning rounded-pill px-3 all" type="button">전체</a>
		<a href="/matjjang/storeList?sc=AA" id="AA" class="comBtn btn-outline-warning rounded-pill px-3" type="button"><img class="bd-placeholder-img rounded-circle" src="resources/img/korean.png">한식</a>
		<a href="/matjjang/storeList?sc=BB" id="BB" class="comBtn btn-outline-warning rounded-pill px-3" type="button"><img class="bd-placeholder-img rounded-circle" src="resources/img/western.png">양식</a>
		<a href="/matjjang/storeList?sc=CC" id="CC" class="comBtn btn-outline-warning rounded-pill px-3" type="button"><img class="bd-placeholder-img rounded-circle" src="resources/img/chinese.png">중식</a>
		<a href="/matjjang/storeList?sc=DD" id="DD" class="comBtn btn-outline-warning rounded-pill px-3" type="button"><img class="bd-placeholder-img rounded-circle" src="resources/img/japanese.png">일식</a>
		<a href="/matjjang/storeList?sc=EE" id="EE" class="comBtn btn-outline-warning rounded-pill px-3" type="button"><img class="bd-placeholder-img" src="resources/img/cafe.png">디저트</a>
	</div>
	<div class="d-flex" style="justify-content:flex-end; margin-bottom:25px;">
		<select name="ob" onchange="location.href='storeList?cpage=1&ob=' + this.value;"  style="margin-right:10px; border:var(--bs-border-width) solid var(--bs-border-color); border-radius:var(--bs-border-radius);">
			<c:choose>
			    <c:when test="${pi.ob eq 'a'}">
			        <option value="a" selected="selected">최신 순</option>
			    </c:when>
			    <c:otherwise>
			        <option value="a">최신 순</option>
			    </c:otherwise>
			</c:choose>
			<c:choose>
			    <c:when test="${pi.ob eq 'b'}">
			        <option value="b" selected="selected">인기 순</option>
			    </c:when>
			    <c:otherwise>
			        <option value="b">인기 순</option>
			    </c:otherwise>
			</c:choose>
			<c:choose>
			    <c:when test="${pi.ob eq 'c'}">
			        <option value="c" selected="selected">이름 순</option>
			    </c:when>
			    <c:otherwise>
			        <option value="c">이름 순</option>
			    </c:otherwise>
			</c:choose>
			
		</select>
		<form name="frm">
		  	<input class="form-control me-2" type="search" name="keyword" placeholder="Search" aria-label="Search" style="width:300px; float:left;">
		  	<button class="btn btn-outline-dark" type="submit">Search</button>
	  	</form>
	</div>
	
	<c:if test="${pi.getRcnt() > 0}">
	<div class="comtx">
		<h2>추천 맛집(${rcnt})</h2>
	</div>
	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
	<c:forEach items="${storeList}" var="store">
		<div class="col">
			<a href="/matjjang/storeView?siid=${store.si_id}" class="card shadow-sm">
				<img class="bd-placeholder-img" width="100%" height="225" src="/ad_matjjang/resources/img/store/${store.si_img1}">
				<div class="card-body">
					<span class="text-body-secondary"><img width="12" height="12" style="margin-right:4px; vertical-align:baseline;" src="resources/img/star.png">${store.si_star}</span>
				  	<h4>${store.si_name}</h4>
				  	<div class="inline-div">${store.si_week}</div>
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
	
	<div class="bd-example-snippet bd-code-snippet" style="position:relative; display:flex; justify-content:center; margin-top:30px;">
		<div class="bd-example m-0 border-0">
			<!-- 페이징 시작 -->
			<nav aria-label="Standard pagination example">
				<ul class="pagination">
					<c:if test="${pi.getCpage() == 1}">
					<a class="page-link text-dark" href="javascript:void(0);" aria-label="Previous">
							<span aria-hidden="true">‹</span>
						</a>
						<a class="page-link text-dark" href="javascript:void(0);" aria-label="Previous">
					    	<span aria-hidden="true">«</span>			   
					  	</a>
					</c:if>
					<li class="page-item">
						<c:if test="${pi.getCpage() > 1}">
					  	<a class="page-link text-dark" href="storeList?cpage=1${pi.getSchargs()}" aria-label="Previous">
					    	<span aria-hidden="true">«</span>			   
					  	</a>
					   </c:if>
					</li>
					<li class="page-item">
						<c:if test="${pi.getCpage() > 1}">
					  	<a class="page-link text-dark" href="storeList?cpage=${pi.getCpage() - 1}${pi.getSchargs()}" aria-label="Previous">
							<span aria-hidden="true">‹</span>
						</a>
						</c:if>
					</li>
				  	
					<c:forEach var="i" begin="${pi.getSpage()}" end="${pi.getSpage() + pi.getBsize() - 1 < pi.getPcnt() ? pi.getSpage() + pi.getBsize() - 1 : pi.getPcnt() }" >
						<c:if test="${i == pi.getCpage()}">
						<li class="page-item active">
				  			<a class="page-link text-dark" href="javascript:void(0);">${i}</a>
				  		</li>
						</c:if>
						<c:if test="${i != pi.getCpage()}">
							<li class="page-item">
				  				<a class="page-link text-dark" href="storeList?cpage=${i}${pi.getSchargs()}">${i}</a>
				  			</li>
						</c:if>
					</c:forEach>
					
				  	<li class="page-item">
				  		<c:if test="${pi.getCpage() < pi.getPcnt()}">
					    <a class="page-link text-dark" href="storeList?cpage=${pi.getCpage() + 1}${pi.getSchargs()}" aria-label="Next">
					      <span aria-hidden="true">›</span>
					    </a>
					    </c:if>
				  	</li>
				  	<li class="page-item">
				  		<c:if test="${pi.getCpage() < pi.getPcnt()}">
					    <a class="page-link text-dark" href="storeList?cpage=${pi.getPcnt()}${pi.getSchargs()}" aria-label="Next">
					      <span aria-hidden="true">»</span>
					    </a>
					    </c:if>
				  	</li>
				</ul>
			</nav>
			<!-- 페이징 끝 -->
		</div>
	</div>
	</c:if>
</section>
<%@ include file="../inc/foot.jsp" %>