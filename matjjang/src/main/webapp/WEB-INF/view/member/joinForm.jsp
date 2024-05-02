<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<style>
	.selc {width:116px; height:37px; margin-right:10px; border:var(--bs-border-width) solid var(--bs-border-color); border-radius:var(--bs-border-radius);}
</style>
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between px-3 py-2 border-bottom">
	<div class="col-md-3 mb-2 mb-md-0">
		<a href="/matjjang" class="d-inline-flex link-body-emphasis text-decoration-none">
			<img class="bi" width="140" height="80" role="img" aria-label="Bootstrap" src="resources/img/matj-logo.png">
		</a>
	</div>
</header>
<section id="content" style="width:430px; margin:0 auto;">
	<form name="frmJoin" action="memberJoin" method="post" onsubmit="return chkVal(this);" >
	<input type="hidden" name="idChk" id="idChk" value="n" />
	<input type="hidden" name="pwChk" id="pwChk" value="n" />
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">
			<h4 class="mt-4">회원가입</h4>
			<div id="app">
				<div class="row mt-3">
					<label for="memberId" class="mb-2 p-0">아이디</label> 
					<input type="text" class="form-control" name="mi_id" v-model="memberId" @keyup="chkId" placeholder="아이디를 입력해주세요" maxlength="20" required>
					<span id="uidMsg" class="idchk" style="padding-left:2px; font-size:14px;">아이디는 4~20자로 입력해주세요.</span>
				</div>
				<div class="row mt-3">
					<label for="memberPw" class="mb-2 p-0">비밀번호</label> 
					<input type="password" class="form-control" name="mi_pw" id="memberPw" v-model="memberPw" @keyup="chkPw"  placeholder="비밀번호를 입력해주세요" value="" autocomplete="new-password" required /> 
					<span class="pwchk1"></span>
				</div>
				
				<div class="row mt-3">
					<label for="memberPwCheck" class="mb-2 p-0">비밀번호 확인</label> 
					<input type="password" class="form-control" id="memberPwCheck" v-model="memberPwCheck" @keyup="chkPw" placeholder="비밀번호를 다시 한번 입력해주세요" value="" required>
					<span id="pwMsg" class="pwchk2 p-0" style="padding-left:2px; font-size:14px;"></span>
				</div>
			
				<div class="row mt-3">
					<label for="memberName" class="mb-2 p-0">이름</label> 
					<input type="text" class="form-control" name="mi_name" id="memberName" placeholder="이름을 입력해주세요" required /> 
					<span class="memberNamechk"></span>
				</div>
				<div class="row mt-3">
					<label for="email" class="mb-2 p-0">이메일</label>
					<div style="display:flex; justify-content:space-between; padding:0;">
						<input type="text" class="form-control" id="e1" name="e1" style="width:150px; margin-right:10px;" placeholder="이메일 아이디" required="required" required><span style="margin-top:5px;">@</span>
						<input type="text" class="form-control" id="e3" name="e3" ref="focuse3" v-model="inputValue" style="width:150px; margin-left:10px; margin-right:10px;" id="email" placeholder="이메일 도메인" required="required" required> 
						<select id="e2" name="e2" v-model="selectedValue" @change="emailChange"style="width:180px; margin-right:10px; border:var(--bs-border-width) solid var(--bs-border-color); border-radius:var(--bs-border-radius);">
							<option value="">도메인 선택</option>
							<option>naver.com</option>
							<option>gmail.com</option>
							<option>nate.com</option>
							<option value="direct">직접 입력</option>
						</select>
						<span class="emailchk"></span>
					</div>
				</div>
			</div>
			<div class="row mt-3">
				<label for="phoneNumber" class="mb-2 p-0">휴대폰 번호</label> 
				<div class="p-0" style="display:flex;">
					<select class="selc" name="p1">
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
					</select>
					<input type="text" name="p2" class="form-control" id="phoneNumber" style="width:160px; margin-right:10px;" required>
					<input type="text" name="p3" class="form-control" id="phoneNumber" style="width:160px;" required>  
					<span class="phchk"></span>
				</div>
			</div>
			
			<div class="row mt-3">
				<label for="email" class="mb-2 p-0">생년월일</label>
				<div class="p-0" style="display:flex;">
					<select id="yearSelect" class="selc" name="year" onchange="">
					</select><span style="margin:5px 10px 0 0;">년</span>
					<select id="monthSelect" class="selc" name="month" onchange="">
					</select><span style="margin:5px 10px 0 0;">월</span>
					<select id="daySelect" class="selc"name="day">
					</select><span style="margin:5px 10px 0 0;">일</span>
				</div>
			</div>
			
			<div class="row mt-3 mb-3 p-0">
				<label for="email" class="mb-2 p-0">성별</label>
				<div class="p-0" style="display:flex;">
					<label>
						 <input type="radio" id="male" name="mi_gender" checked="checked" value="남" /> 남
					</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<label> <input type="radio" name="mi_gender" value="여" id="female" /> 여</label>
					<span class="emailchk"></span>
				</div>
			</div>
		
		<!-- <div class="mb-3">
				<label for="address" class="mb-2">우편번호
					<span class="text-muted">
						<input id="addrFind" type="button" value="찾기" onclick="sample4_execDaumPostcode()" style="border-radius:4px; border:1.5px solid #ced4da;" /><br /><span id="guide" style="color:#999;display:none; position:absolute; top:-500px; left:-500px;"></span>
					</span>
				</label> 
				<input type="text" class="form-control" id="sample4_postcode" placeholder="찾기를 눌러 주소를 입력하세요" required>
			</div>

			<div class="mb-3">
				<label for="address2" class="mb-2">주소</label>
				<input type="text" id="sample4_jibunAddress" placeholder="지번주소" style="display:none;">
				<input type="text" id="sample4_extraAddress" placeholder="참고항목" style="display:none;">
				<input type="text" class="form-control mb-2" id="sample4_roadAddress" placeholder="주소를 입력해주세요." required>
				<input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소를 입력해주세요." required>
			</div> -->
	
			<button class="btn btn-warning py-2 mb-3" type="submit" style="position: relative; width: 454px; margin-left: -12px;">가입 완료</button>
		</div>
	</div>
	</form>
	<footer class="my-3 text-center text-small">
		<p class="mb-1">&copy; 2024 YD</p>
	</footer>
</section>

<script>

// 아이디  중복 확인, 비밀번호 확인
new Vue({
	el: '#app',
	data: {
	  memberId: '',
	  memberPw: '',
	  memberPwCheck: '',
	  message: '',
	  selectedValue: '', // 기본 선택값 설정
      inputValue: ''

	},
	methods: {
		chkId() {
			if (this.memberId.length >= 4) {
				$.ajax({
				  type: "POST",
				  url: "./chkId",
				  data: { "uid": this.memberId },
				  success: (chkRs) => {
				    if (chkRs == 0) {
				      this.message = "<span style='color:blue;'>아이디가 확인되었습니다.</span>";
				      $("#idChk").val("y");
				    } else {
				      this.message = "<span style='color:red;'>※이미 사용중인 아이디입니다.</span>";
				      $("#idChk").val("n");
				    }
				    $("#uidMsg").html(this.message);
				  }
				});
			} else {
			  this.message = "<span style='color:red;'>※아이디는 4~20자로 입력해주세요.</span>";
			  $("#idChk").val("n");
			}
		 },
		 
		 chkPw() {
			 console.log("chkPw 메서드 실행됨");
			    console.log("memberPw:", this.memberPw);
			    console.log("memberPwCheck:", this.memberPwCheck);
			if (this.memberPw.length >= 4 && this.memberPwCheck.length >= 4) {
				console.log("1234");
			 $.ajax({
				  type: "POST",
				  url: "./chkPw",
				  data: { "pw": this.memberPw, "pwCheck": this.memberPwCheck },
				  success: (chkRs) => {
						if (this.memberPw !== this.memberPwCheck) {
							this.message = "<span style='color:red;'>※비밀번호가 일치하지 않습니다.</span>";
							$("#pwChk").val("n");
						} else {
							this.message = "<span style='color:blue;'>비밀번호가 확인되었습니다.</span>";
							$("#pwChk").val("y");
						} 
						$("#pwMsg").html(this.message);
					} 
				});
			 
			} else {
					this.message = "<span style='color:red;'>※비밀번호는 4자 이상으로 입력해주세요.</span>";
					$("#pwChk").val("n");
			}

		 },
		 
		 // 이메일 
		 emailChange() {
			 if (this.selectedValue === "") {
                 this.inputValue = "";
             } else if (this.selectedValue === "direct") {
                 this.inputValue = "";
                 this.$nextTick(() => {
                     if (this.$refs.e3) {
                         this.$refs.e3.focus();
                     }
                 });
             } else {
                 this.inputValue = this.selectedValue;
             }
         }
	}
});

//현재 날짜를 얻음
var currentDate = new Date();
var cyear = currentDate.getFullYear();
var cmonth = currentDate.getMonth() + 1; // JavaScript의 월은 0부터 시작하므로 1을 더해준다.
var cday = currentDate.getDate();

// 년도 선택 리스트 생성
var yearSelect = document.getElementById("yearSelect");
for (var i = 1950; i <= cyear; i++) {
    var option = document.createElement("option");
    option.text = i;
    if (i === cyear) {
        option.selected = true;
    }
    yearSelect.add(option);
}

// 월 선택 리스트 생성
var monthSelect = document.getElementById("monthSelect");
for (var i = 1; i <= 12; i++) {
    var option = document.createElement("option");
    var tmp = (i < 10 ? "0" + i : i);
    option.text = tmp;
    if (i === cmonth) {
        option.selected = true;
    }
    monthSelect.add(option);
}

// 일 선택 리스트 생성 (기본적으로 31일까지 생성)
var daySelect = document.getElementById("daySelect");
for (var i = 1; i <= 31; i++) {
    var option = document.createElement("option");
    var tmp = (i < 10 ? "0" + i : i);
    option.text = tmp;
    if (i === cday) {
        option.selected = true;
    }
    daySelect.add(option);
}

// 월이 변경될 때 일 선택 리스트를 업데이트하는 함수
function updateDaySelect() {
    var year = parseInt(yearSelect.value);
    var month = parseInt(monthSelect.value);
    var daysInMonth = new Date(year, month, 0).getDate(); // 해당 월의 일 수 계산

    // 기존 일 선택 리스트를 비운다.
    while (daySelect.options.length > 0) {
        daySelect.remove(0);
    }

    // 일 선택 리스트를 다시 생성
    for (var i = 1; i <= daysInMonth; i++) {
        var option = document.createElement("option");
        var tmp = (i < 10 ? "0" + i : i);
        option.text = tmp;
        daySelect.add(option);
    }
}

// 월이 변경될 때 일 선택 리스트를 업데이트
monthSelect.addEventListener("change", updateDaySelect);



</script>