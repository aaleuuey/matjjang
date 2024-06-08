<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<%@ include file="../inc/header.jsp" %>

<form name="info" action="pwChg" method="post">
<input type="hidden" name="pwChk" id="pwChk" value="n" />
<div class="info">
	<div class="profile_tabs">
		<ul class="authcd_y">
			<li class="false"><a href="/matjjang/info">회원정보변경</a></li>
			<li class="on"><a href="/matjjang/changePw">비밀번호변경</a></li>
			<li class="false"><a href="/matjjang/leave">회원탈퇴</a></li>
		</ul>
	</div>
	<div class="mp_profile_write">
		<div class="write_info">
			<div id="app">
			<ul>
				<li>
					<span class="tit">현재 비밀번호</span>
					<div class="cnt">
						<div>
							<ul class="overflow">
								<li>
									<div class="input01">
										<div>
											<input type="password" name="td_pw" value="" class="focusIn" placeholder="현재 비밀번호를 입력해주세요." required />
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</li>
				<li>
					<span class="tit">비밀번호</span>
					<div class="cnt">
						<div>
							<ul class="overflow">
								<li>
									<div class="input01">
										<div>
											<input type="password" name="mi_pw" id="memberPw" v-model="memberPw" @keyup="chkPw" value="" class="focusIn" placeholder="새로운 비밀번호를 입력해주세요." required />
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</li>
				<li>
					<span class="tit">비밀번호 확인</span>
					<div class="cnt">
						<div>
							<ul class="overflow">
								<li>
									<div class="input01">
										<div>
											<input type="password" id="memberPwCheck" v-model="memberPwCheck" @keyup="chkPw" value="" class="focusIn" placeholder="비밀번호 다시 한 번 입력해주세요." required />
										</div>
									</div>
									<span id="pwMsg" class="pwchk2 p-0" style="padding-left:2px; font-size:14px;"></span>
								</li>
								
							</ul>
						</div>
					</div>
				</li>
			</ul>
			</div>
		</div>
		<div class="btn_box">
			<ul>
				<li><input type="submit" class="btnTy15" value="저장" /></li>
			</ul>
		</div>
	</div>
</div>
</form>
<script>
//아이디  중복 확인, 비밀번호 확인
new Vue({
	el: '#app',
	data: {
	  memberPw: '',
	  memberPwCheck: '',
	  message: '',

	},
	methods: {
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

		 }
	}
});
</script>
<%@ include file="../inc/foot.jsp" %>