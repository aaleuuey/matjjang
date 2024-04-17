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
        el: '#app',
        data: {
            selectedDays: [] // 선택된 요일을 저장할 배열
        },
        methods: {
        	isActive: function(day) { // 주어진 요일이 선택된 상태인지 확인하는 메소드
                return this.selectedDays.includes(day); // selectedDays 배열에 요일이 포함되어 있는지 확인하여 그 결과를 반환
            },
            toggleActive: function(day) { // 요일의 선택 상태를 토글하는 메소드
                if (this.isActive(day)) { // 이미 선택된 요일인 경우
                    const index = this.selectedDays.indexOf(day);
                    if (index !== -1) { // 인덱스가 유효한 경우에만 선택 해제
                        this.selectedDays.splice(index, 1); // 선택 해제
                    }
                } else { // 선택되지 않은 요일인 경우
                    this.selectedDays.push(day); // 선택
                }
            }
        }
    });
	
	new Vue({
		el: '#app2',
		data: {
			selectedOptions: []
		},
		methods: {
			isActiveAnother: function(option) {
			  return this.selectedOptions.includes(option);
			},
			toggleActiveAnother: function(option) {
				if (this.isActiveAnother(option)) {
				  const index = this.selectedOptions.indexOf(option);
				  if (index !== -1) {
				    this.selectedOptions.splice(index, 1);
				  }
				} else {
			    	this.selectedOptions.push(option);
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
					<select name="sc_id" style="width:170px; height:40px; margin-right:20px; border:var(--bs-border-width) solid var(--bs-border-color); border-radius:var(--bs-border-radius);">
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
				<th class="title">별점</th>
				<td>
					<div style="width:100%">
						<select name="si_star" style="width: 80px; height: 35px; border: var(--bs-border-width) solid var(--bs-border-color); border-radius: var(--bs-border-radius);">
							<option>1</option>
							<option>1.5</option>
							<option>2</option>
							<option>2.5</option>
							<option>3</option>
							<option>3.5</option>
							<option>4</option>
							<option>4.5</option>
							<option>5</option>
						</select>
					</div>
				</td>
			</tr> 
			<tr>
				<th class="title">영업시간</th>
				<td colspan="3">
					<div id="app">
					    <input type="checkbox" id="mon" name="si_week" value="월" v-model="selectedDays" @click="toggleActive('월')" />
					    <label class="timebtn" for="mon" :class="{ 'is-active': isActive('월') }">월</label>
					    <input type="checkbox" id="tue" name="si_week" value="화" v-model="selectedDays" @click="toggleActive('화')" />
					    <label class="timebtn" for="tue" :class="{ 'is-active': isActive('화') }">화</label>
					    <input type="checkbox" id="wed" name="si_week" value="수" v-model="selectedDays" @click="toggleActive('수')" />
					    <label class="timebtn" for="wed" :class="{ 'is-active': isActive('수') }">수</label>
					    <input type="checkbox" id="thu" name="si_week" value="목" v-model="selectedDays" @click="toggleActive('목')" />
					    <label class="timebtn" for="thu" :class="{ 'is-active': isActive('목') }">목</label>
					    <input type="checkbox" id="fri" name="si_week" value="금" v-model="selectedDays" @click="toggleActive('금')" />
					    <label class="timebtn" for="fri" :class="{ 'is-active': isActive('금') }">금</label>
					    <input type="checkbox" id="sat" name="si_week" value="토" v-model="selectedDays" @click="toggleActive('토')" />
					    <label class="timebtn" for="sat" :class="{ 'is-active': isActive('토') }">토</label>
					    <input type="checkbox" id="sun" name="si_week" value="일" v-model="selectedDays" @click="toggleActive('일')" />
					    <label class="timebtn" for="sun" :class="{ 'is-active': isActive('일') }">일</label>
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
					    <input type="checkbox" id="parking" name="si_parking" value="주차" v-model="selectedOptions" @click="toggleActiveAnother('주차')" />
					    	<label class="parkingbtn" for="parking" :class="{ 'is-active': isActiveAnother('주차') }">주차</label>
					    <input type="checkbox" id="valet" name="si_parking" value="발렛" v-model="selectedOptions" @click="toggleActiveAnother('발렛')" />
					    	<label class="parkingbtn" for="valet" :class="{ 'is-active': isActiveAnother('발렛') }">발렛</label>
					    <input type="checkbox" id="nothing" name="si_parking" value="없음" v-model="selectedOptions" @click="toggleActiveAnother('없음')" />
					    	<label class="parkingbtn" for="nothing" :class="{ 'is-active': isActiveAnother('없음') }">없음</label>
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