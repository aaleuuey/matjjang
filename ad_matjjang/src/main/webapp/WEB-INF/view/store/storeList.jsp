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
				<td>번호</td>
				<td>가게명</td>
				<td>등록일</td>
				<td>조회수</td>
			</tr>
			<tr align="center" onmouseover="this.bgColor='#efefef';" onmouseout="this.bgColor='';" bgcolor="">
				<td>1</td>
				<td width="50%">
					<a href="productUp?piid=AAaa834">
						<img src="/ad_potted/resources/images/product/무늬 담쟁이1.jpg" width="100" height="100" border="0" align="left">
						<input type="hidden" name="piid" value="AAaa834">
						<div style="float:left; margin-left:15px;">test</div>
					</a>
				</td>
				<td>2024-02-13 16:26:04</td>
				<td>9</td>
			</tr>
	
	
		</tbody>
	</table>
	<div class="bd-example-snippet bd-code-snippet" style="position:relative; display:flex; justify-content:center;">
		<div class="bd-example m-0 border-0">
			<nav aria-label="Standard pagination example">
				<ul class="pagination">
					<li class="page-item">
					  <a class="page-link text-dark" href="#" aria-label="Previous">
					    <span aria-hidden="true">«</span>
					  </a>
					</li>
					<li class="page-item">
					  <a class="page-link text-dark" href="#" aria-label="Previous">
					    <span aria-hidden="true">‹</span>
					  </a>
					</li>
				  	<li class="page-item"><a class="page-link text-dark" href="#">1</a></li>
				  	<li class="page-item"><a class="page-link text-dark" href="#">2</a></li>
				  	<li class="page-item active"><a class="page-link text-dark" href="#">3</a></li>
				  	<li class="page-item">
					    <a class="page-link text-dark" href="#" aria-label="Next">
					      <span aria-hidden="true">›</span>
					    </a>
				  	</li>
				  	<li class="page-item">
					    <a class="page-link text-dark" href="#" aria-label="Next">
					      <span aria-hidden="true">»</span>
					    </a>
				  	</li>
				</ul>
			</nav>
		</div>
		<a href="/ad_matjjang/storeIn" class="btn btn-outline-warning" style="position:absolute; right:0;">맛집 등록</a>
	</div>
</div>
<%@ include file="../inc/foot.jsp" %>