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
	#app input {display:none;}
	#app2 input {display:none;}
	.timebtn { cursor:pointer;}
	.time {float:left; margin-left:10px;}
	.time input {height:37px; border:var(--bs-border-width) solid var(--bs-border-color); border-radius:5px;}
	.btnBox {float:right; margin-right: 139px;}
	.btnBox a {width:100px;}
	.btnBox input {width:100px;}
	.is-active {background: #ffc107 !important; color:#fff !important;}
	.timebtn, .parkingbtn {text-align:center; float:left; padding-top:5px; margin-right:5px; border:1px solid #ffc107; width:40px; height:40px; border-radius:5px; background:transparent; color:#ffc107;}
	.parkingbtn {width:50px;}
</style>
<script>
window.onload = function () { 
	new Vue({
		el: '#app', // Vue 인스턴스가 연결될 HTML 요소를 지정
		data: { // Vue 인스턴스의 데이터를 정의
		  activeButtons: [] // 선택된 버튼들의 상태를 저장할 배열
		},
		methods: { // Vue 인스턴스의 메소드를 정의
			isActive: function(day) { // 주어진 요일이 선택된 상태인지 확인하는 메소드
			  return this.activeButtons.includes(day); // activeButtons 배열에 요일이 포함되어 있는지 확인하여 그 결과를 반환
			},
			toggleActive: function(day) { // 요일의 선택 상태를 토글하는 메소드
				if (this.isActive(day)) { // 만약 주어진 요일이 이미 선택된 상태이면,
				  const index = this.activeButtons.indexOf(day); // 해당 요일이 activeButtons 배열에서의 인덱스를 찾음
				  if (index !== -1) { // 만약 요일이 배열에 존재하면,
				    this.activeButtons.splice(index, 1); // 해당 요일을 배열에서 제거
				  }
				} else { // 주어진 요일이 선택되지 않은 상태이면,
			    	this.activeButtons.push(day); // 해당 요일을 배열에 추가하여 선택됨을 나타냄
			  	}
			}	
		}
	});
	
	new Vue({
		el: '#app2',
		data: {
		  activeAnotherOptions: []
		},
		methods: {
			isActiveAnother: function(option) {
			  return this.activeAnotherOptions.includes(option);
			},
			toggleActiveAnother: function(option) {
				if (this.isActiveAnother(option)) {
				  const index = this.activeAnotherOptions.indexOf(option);
				  if (index !== -1) {
				    this.activeAnotherOptions.splice(index, 1);
				  }
				} else {
			    	this.activeAnotherOptions.push(option);
			  	}
			}	
		}
	});
}
</script>
<div class="commend">
	<h3>맛집 등록</h3>
	<form name="frm" action="storeProcIn" method="post"  enctype="multipart/form-data" onsubmit="posArr();">
	<!-- <input type="hidden" name="si_week" id="si_week"> -->
	<table>
		<tbody>
			<tr>
				<th class="title">맛집 상태</th>
				<td>
					<input type="radio" name="si_isview" value="y" id="ping" checked="checked">
					<label for="ping">활성화</label>
					<input type="radio" name="si_isview" value="n" id="pstop">
					<label for="pstop">비활성화</label>
				</td>
			</tr>
			<tr>
				<th class="title">맛집 분류</th>
				<td>
					<select name="sc_id" onchange="setCategory(this.value, this.form.pcs_id);" style="width:170px; height:40px; margin-right:20px; border:var(--bs-border-width) solid var(--bs-border-color); border-radius:var(--bs-border-radius);">
						<option value="">선택</option>
						<option value="AA">한식</option>				
						<option value="BB">양식</option>	
						<option value="CC">중식</option>	
						<option value="DD">일식</option>	
						<option value="EE">디저트</option>	
					</select>
					
				</td>
			</tr>
			<tr>
				<th class="title">맛집 이미지</th>	
				<td style=" width:300px; margin-top:10px;">
					<div style="display: flex; align-items: center; justify-content: center; width:276px; height: 100%;">
						<input type="file" class="form-control" id="customFile" name="si_img1" value="si_img1"><br>
					</div>
				</td>
				<td style="width:300px; margin-top:10px;">
					<div style="display: flex; align-items: center; justify-content: center;width:276px; height: 100%;">
						<input type="file" class="form-control" id="customFile" name="si_img2" value="si_img2"><br>
					</div>
				</td>
				<td style="width:300px; margin-top:10px;">
					<div style="display: flex; align-items: center; justify-content: center; width:276px; height: 100%;">
						<input type="file" class="form-control" id="customFile" name="si_img3" value="si_img3"><br>
					</div>
				</td>
			</tr>
			<tr>
				<th class="title">가게명</th>
				<td>
					<input type="text" name="si_name" style="width:253px; margin-top:10px; padding:10px; margin-right:10px; border:1px solid #dee2e6; border-radius:0.375rem; " placeholder="가게명을 입력해주세요."><br>
				</td>
			</tr>	
			<tr>
				<th class="title">영업시간</th>
				<td colspan="3">
					<div id="app">
						<input type="checkbox" id="mon" name="si_week" value="월" ><label class="timebtn" for="mon" @click="toggleActive('월')" v-bind:class="{ 'is-active': isActive('월') }">월</label>
						<input type="checkbox" id="tue" name="si_week" value="화"><label class="timebtn" for="tue" @click="toggleActive('화')" v-bind:class="{ 'is-active': isActive('화') }">화</label>
						<input type="checkbox" id="wed" name="si_week" value="수"><label class="timebtn" for="wed" @click="toggleActive('수')" v-bind:class="{ 'is-active': isActive('수') }">수</label>
						<input type="checkbox" id="thu" name="si_week" value="목"><label class="timebtn" for="thu" @click="toggleActive('목')" v-bind:class="{ 'is-active': isActive('목') }">목</label>
						<input type="checkbox" id="fri" name="si_week" value="금"><label class="timebtn" for="fri" @click="toggleActive('금')" v-bind:class="{ 'is-active': isActive('금') }">금</label>
						<input type="checkbox" id="sat" name="si_week" value="토"><label class="timebtn" for="sat" @click="toggleActive('토')" v-bind:class="{ 'is-active': isActive('토') }">토</label>
						<input type="checkbox" id="sun" name="si_week" value="일"><label class="timebtn" for="sun" @click="toggleActive('일')" v-bind:class="{ 'is-active': isActive('일') }">일</label>
					</div>
					<p class="time">
						<input type="time" name="si_open" value="si_open"> ~ <input type="time" name="si_close" value="si_close">
					</p>
				</td>
			</tr>
			<tr>
				<th class="title">주차가능 여부</th>
				<td>
					<div id="app2">
					    <input type="checkbox" id="parking" name="si_parking" value="주차"><label class="parkingbtn" for="parking" @click="toggleActiveAnother('주차')" v-bind:class="{ 'is-active': isActiveAnother('주차') }">주차</label>
					    <input type="checkbox" id="valet" name="si_parking" value="발렛"><label class="parkingbtn" for="valet" @click="toggleActiveAnother('발렛')" v-bind:class="{ 'is-active': isActiveAnother('발렛') }">발렛</label>
					    <input type="checkbox" id="nothing" name="si_parking" value="없음"><label class="parkingbtn" for="nothing" @click="toggleActiveAnother('없음')" v-bind:class="{ 'is-active': isActiveAnother('없음') }">없음</label>
					</div>
				</td>
			</tr>
			<tr>
				<th class="title">주소</th>
				<td colspan="2" style="display:flex;">
					<input type="text" id="sample4_postcode" placeholder="우편번호" style="display:none;">
					<input type="text" id="sample4_jibunAddress" name="si_addr2" placeholder="지번주소" style="display:none;">
					<input type="text" id="sample4_extraAddress" placeholder="참고항목" style="display:none;">
					<input type="text" class="form-control mb-2" id="sample4_roadAddress" name="si_addr1" style="width:253px; padding:10px; margin-right:10px; border:1px solid #dee2e6; border-radius:0.375rem;" placeholder="주소를 입력해주세요." required>
					<span class="text-muted">
						<input id="addrFind" type="button" value="찾기" onclick="sample4_execDaumPostcode()" style="height:45px; border-radius:4px; border:1.5px solid #ced4da;" /><br /><span id="guide" style="color:#999;display:none; position:absolute; top:-500px; left:-500px;"></span>
					</span>
				</td>
			</tr>
			<tr>
				<th class="title">가게 전화번호</th>
				<td>
					<input type="text" name="si_number" style="width:253px; padding:10px; margin-right:10px; border:1px solid #dee2e6; border-radius:0.375rem;" placeholder="전화번호를 입력해주세요.">
				</td>
			</tr>
			<tr>
				<th class="title">매장소개</th>
				<td colspan="3">
					<textarea class="form-control" id="exampleFormControlTextarea1" name="si_explan" rows="10"></textarea>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="btnBox">
		<input type="submit" class="btn btn-outline-warning" value="맛집 등록" />
		<a href="storeList" class="btn btn-outline-dark">취소</a>
	</div>
	</form>
</div>
<%@ include file="../inc/foot.jsp" %>