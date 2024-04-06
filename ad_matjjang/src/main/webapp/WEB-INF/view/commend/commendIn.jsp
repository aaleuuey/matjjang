<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<%@ include file="../inc/header.jsp" %>
<style>
	.commend {padding-bottom:60px;}
	table {border-collapse: separate; border-spacing: 0 10px;}
	.title {color:#dc3545;}
	h2 {font-size:24px;}
	tr {height:45px;}
	th, td {font-size:17px;}
	th {width:160px; text-align:left;}
	.pimg {padding:10px; margin-right:10px; border:1px solid #000;}
	.psub {display:inline-block; width:178px; padding:10px 7px; text-align:left; font-size:12px; border:1px solid #000;}
	.btnBox {margin-right:87px; float:right;}
	.insertBtn {width:100px; padding:5px 0;margin-bottom:30px; border:0; background:gray; color:#fff;}
	.cancelBtn {display:block; width:100px; padding:5px 0; float:right; text-align:center; border:1px solid #000; margin-left:10px; font-size:13px;}
	#sub1, #sub2, #sub3 { display:none; }
	.btn:hover {background:none; border:1px solid #ffc107; color:var(--bs-btn-color);}
	.timebtn {float:left; margin-right:5px;}
	.time {float:left; margin-left:10px;}
	.time input {height:37px; border:var(--bs-border-width) solid var(--bs-border-color); border-radius:5px;}
	.btnBox {float:right; margin-right: 139px;}
	.btnBox a {width:100px;}
	.btnBox input {width:100px;}
</style>
<div class="commend">
	<h3>맛집 등록</h3>
	<table>
		<tbody>
			<tr>
				<th class="title">맛집 상태</th>
				<td>
					<input type="radio" name="pi_status" value="a" id="ping" checked="checked">
					<label for="ping">활성화</label>
					<input type="radio" name="pi_status" value="b" id="pstop">
					<label for="pstop">비활성화</label>
				</td>
			</tr>
			<tr>
				<th class="title">맛집 분류</th>
				<td>
					<select name="pcb_id" onchange="setCategory(this.value, this.form.pcs_id);" style="width:170px; height:40px; margin-right:20px; border:var(--bs-border-width) solid var(--bs-border-color); border-radius:var(--bs-border-radius);">
						<option value="">선택</option>
						<option value="AA">한식</option>				
						<option value="AA">양식</option>	
						<option value="AA">중식</option>	
						<option value="AA">일식</option>	
						<option value="AA">디저트</option>	
					</select>
					
				</td>
			</tr>
			<tr>
				<th class="title">맛집 이미지</th>	
				<td style=" width:300px; margin-top:10px;">
					<div style="display: flex; align-items: center; justify-content: center; width:276px; height: 100%;">
						<input type="file" class="form-control" id="customFile"><br>
					</div>
				</td>
				<td style="width:300px; margin-top:10px;">
					<div style="display: flex; align-items: center; justify-content: center;width:276px; height: 100%;">
						<input type="file" class="form-control" id="customFile"><br>
					</div>
				</td>
				<td style="width:300px; margin-top:10px;">
					<div style="display: flex; align-items: center; justify-content: center; width:276px; height: 100%;">
						<input type="file" class="form-control" id="customFile"><br>
					</div>
				</td>
			</tr>
			<tr>
				<th class="title">가게명</th>
				<td>
					<input type="text" name="pi_name" style="width:253px; margin-top:10px; padding:10px; margin-right:10px; border:1px solid #dee2e6; border-radius:0.375rem; " placeholder="가게명을 입력해주세요."><br>
				</td>
			</tr>	
			<tr>
				<th class="title">영업시간</th>
				<td colspan="3">
					<button type="button" class="btn btn-outline-warning timebtn">월</button>
					<button type="button" class="btn btn-outline-warning timebtn">화</button>
					<button type="button" class="btn btn-outline-warning timebtn">수</button>
					<button type="button" class="btn btn-outline-warning timebtn">목</button>
					<button type="button" class="btn btn-outline-warning timebtn">금</button>
					<button type="button" class="btn btn-outline-warning timebtn">토</button>
					<button type="button" class="btn btn-outline-warning timebtn">일</button>
					<p class="time">
						<input type="time"> ~ <input type="time">
					</p>
				</td>
			</tr>
			<tr>
				<th class="title">주차가능 여부</th>
				<td>
					<button type="button" class="btn btn-outline-warning timebtn">주차</button>
					<button type="button" class="btn btn-outline-warning timebtn">발렛</button>
					<button type="button" class="btn btn-outline-warning timebtn">없음</button>
				</td>
			</tr>
			<tr>
				<th class="title">주소</th>
				<td>
					<input type="text" name="pi_price" style="width:253px; padding:10px; margin-right:10px; border:1px solid #dee2e6; border-radius:0.375rem;" placeholder="상품판매가를 입력해주세요.">원
				</td>
			</tr>
			<tr>
				<th class="title">가게 전화번호</th>
				<td>
					<input type="text" name="pi_dc" style="width:253px; padding:10px; margin-right:10px; border:1px solid #dee2e6; border-radius:0.375rem;" placeholder="전화번호를 입력해주세요.">
				</td>
			</tr>
			<tr>
				<th class="title">매장소개</th>
				<td colspan="3">
					<textarea class="form-control" id="exampleFormControlTextarea1" rows="10"></textarea>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="btnBox">
		<input type="submit" class="btn btn-outline-warning" value="맛집 등록"></input>
		<a href="productList" class="btn btn-outline-dark">취소</a>
	</div>
</div>
<%@ include file="../inc/foot.jsp" %>