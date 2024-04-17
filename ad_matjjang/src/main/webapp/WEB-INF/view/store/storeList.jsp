<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<%@ include file="../inc/header.jsp" %>
<style>
	.commend table {margin:20px 0; border:1px solid #dee2e6; color:#828282;}
	.commend table a {color:#828282;}
	.commend table a:hover {color:#dc3545;}
	.commend table td {border:1px solid #dee2e6;}
</style>
<div class="commend" style="width:1000px;">
	<h3>맛집 관리</h3>
	
	<table width="100%" cellpadding="15" cellspacing="0">
		<tbody>
			<tr align="center">
				<th>가게명</th>
				<th>영업날</th>
				<th>등록일</th>
				<th>게시여부</th>
			</tr>
			<c:forEach items="${storeList}" var="store">
			<tr align="center" onmouseover="this.bgColor='#efefef';" onmouseout="this.bgColor='';" bgcolor="">
				<td width="50%">
					<a href="productUp?piid=AAaa834">
						<img src="/ad_matjjang/resources/img/store/${store.si_img1}" width="100" height="100" border="0" align="left">
						<input type="hidden" name="piid" value="AAaa834">
						<div style="float:left; margin-left:15px;">${store.si_name}</div>
					</a>
				</td>
				<td>${store.si_week}</td>
				<td>${store.si_date}</td>
				<td>${store.si_isview}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="bd-example-snippet bd-code-snippet" style="position:relative; display:flex; justify-content:center;">
		<div class="bd-example m-0 border-0">
			<!-- 페이징 시작 -->
			<nav aria-label="Standard pagination example">
				<ul class="pagination">
					<c:if test="${pi.getRcnt() > 0}">
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
				  	</c:if>
				</ul>
			</nav>
			<!-- 페이징 끝 -->
		</div>
		<a href="/ad_matjjang/storeIn" class="btn btn-outline-warning" style="position:absolute; right:0;">맛집 등록</a>
	</div>
</div>
<%@ include file="../inc/foot.jsp" %>