<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<%@ include file="../inc/header.jsp" %>
<section id="content" style="width:1000px; margin:0 auto;">
	<article class="my-3" id="tables">
		<div class="bd-example-snippet bd-code-snippet">
			<form class="d-flex" role="search" style="justify-content:flex-end; margin-bottom:25px;">
				<select name="schtype" style="margin-right:10px; border:var(--bs-border-width) solid var(--bs-border-color); border-radius:var(--bs-border-radius);">
					<option value="title">제목</option>
					<option value="writer">작성자</option>
					<option value="writer">지역</option>
					<option value="content">내용</option>
					<option value="tc">제목 + 내용</option>
				</select>
			   	<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" style="width:300px;">
			  	<button class="btn btn-outline-dark" type="submit">Search</button>
			</form>
			<div class="bd-example m-0 border-0">
				<table class="table table-striped" style="text-align:center;">
					<thead>
						<tr>
							<th scope="col" width="5%">번호</th>
							<th scope="col" width="*">제목</th>
							<th scope="col" width="20%">작성자</th>
							<th scope="col" width="15%">지역</th>
							<th scope="col" width="10%">별점</th>
							<th scope="col" width="10%">좋아요</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>@mdo</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
							<td>@mdo</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>Larry the Bird</td>
							<td>@twitter</td>
							<td>@mdo</td>
							<td>@mdo</td>
							<td>@mdo</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</article>
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
		<button type="button" class="btn btn-outline-warning" style="position:absolute; right:0;">글 등록</button>
	</div>
</section>
        
<%@ include file="../inc/foot.jsp" %>