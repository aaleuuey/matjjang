<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<%@ include file="../inc/header.jsp" %>
<style>
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
</style>
<div class="commend">
	<h3>맛집 등록</h3>
	<table>
		<tbody>
			<tr>
				<th class="title">상품 상태</th>
				<td>
					<input type="radio" name="pi_status" value="a" id="ping" checked="checked">
					<label for="ping">판매중</label>
					<input type="radio" name="pi_status" value="b" id="pstop">
					<label for="pstop">판매중지</label>
				</td>
			</tr>
			<tr>
				<th class="title">상품 목록</th>
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
				<th class="title">상품 이미지</th>	
				<td style="display:block; width:300px; margin-top:10px;">
					<div style="display: flex; align-items: center; justify-content: center; height: 100%;">
						<input type="file" class="form-control" id="customFile"><br>
					</div>
				</td>
				<td style="display:block; width:300px; margin-top:10px;">
					<div style="display: flex; align-items: center; justify-content: center; height: 100%;">
						<input type="file" class="form-control" id="customFile"><br>
					</div>
				</td>
				<td style="display:block; width:300px; margin-top:10px;">
					<div style="display: flex; align-items: center; justify-content: center; height: 100%;">
						<input type="file" class="form-control" id="customFile"><br>
					</div>
				</td>
			</tr>
			<tr>
				<th class="title">상품명</th>
				<td>
					<input type="text" name="pi_name" style="width:253px; margin-top:10px; padding:10px; margin-right:10px; border:1px solid #dee2e6; border-radius:0.375rem; " placeholder="상품명을 입력해주세요."><br>
				</td>
			</tr>	
			<tr>
				<th class="title">추가상품</th>
				<td>
					<input type="checkbox" name="pob_id" value="1.분갈이" id="division" onclick="showDiv(1);"> <label for="division">분갈이</label>
					<input type="checkbox" name="pob_id" value="2.화분" id="pot" onclick="showDiv(2);"> <label for="pot">화분</label>
					<input type="checkbox" name="pob_id" value="3.마감돌" id="stone" onclick="showDiv(3);"> <label for="stone">마감돌</label>
				</td>
			</tr>
			<tr>
				<th class="title">상품원가</th>
				<td>
					<input type="text" name="pi_cost" style="width:253px; padding:10px; margin-right:10px; border:1px solid #dee2e6; border-radius:0.375rem;" placeholder="상품원가를 입력해주세요.">원
				</td>
			</tr>
			<tr>
				<th class="title">상품판매가</th>
				<td>
					<input type="text" name="pi_price" style="width:253px; padding:10px; margin-right:10px; border:1px solid #dee2e6; border-radius:0.375rem;" placeholder="상품판매가를 입력해주세요.">원
				</td>
			</tr>
			<tr>
				<th class="title">상품할인</th>
				<td>
					<input type="text" name="pi_dc" style="width:253px; padding:10px; margin-right:10px; border:1px solid #dee2e6; border-radius:0.375rem;" placeholder="할인가를 입력해주세요.">%
				</td>
			</tr>
			<tr>
				<th class="title">상품수량</th>
				<td>
					<input type="text" name="pi_stock" style="width:253px; padding:10px; margin-right:10px; border:1px solid #dee2e6; border-radius:0.375rem;" placeholder="상품수량을 입력해주세요.">개
				</td>
			</tr>
			<tr style="vertical-align:text-top;">
				<th class="title">상품설명 이미지</th>
				<td style="display:block; width:300px; margin-top:10px;">
					<input type="file" class="form-control" id="customFile"><br>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<%@ include file="../inc/foot.jsp" %>