<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<style>

</style>
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between px-3 py-2 border-bottom">
	<div class="col-md-3 mb-2 mb-md-0">
		<a href="/matjjang" class="d-inline-flex link-body-emphasis text-decoration-none">
			<img class="bi" width="140" height="80" role="img" aria-label="Bootstrap" src="resources/img/matj-logo.png">
		</a>
	</div>
</header>
<section id="content" style="width:600px; margin:0 auto;">
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">
			<h4 class="mt-4">회원가입</h4>
			<form method="post" action="joinPro" name="userInfo" onsubmit="return checkValue()">
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="memberId" class="mb-2">아이디</label> 
						<input type="text" class="form-control" id="memberId" name="memberId" maxlength="30" placeholder="아이디를 입력해주세요" required> 
						<span class="idchk"></span>
					</div>
					<div class="col-md-6 mb-3">
						<label for="memberName" class="mb-2">이름</label> 
						<input type="text" class="form-control" id="memberName" placeholder="이름을 입력해주세요" value="" required> 
						<span class="memberNamechk"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="memberPw" class="mb-2">비밀번호</label> 
						<input type="text" class="form-control" id="memberPw" placeholder="비밀번호를 입력해주세요" value="" required> 
						<span class="pwchk1"></span>
					</div>
				
					<div class="col-md-6 mb-3">
						<label for="memberPwCheck" class="mb-2">비밀번호 확인</label> 
						<input type="text" class="form-control" id="memberPwCheck" placeholder="비밀번호를 다시 한번 입력해주세요" value="" required>
						<span class="pwchk"></span>
					</div>
				</div>
				<div class="mb-3">
					<label for="email" class="mb-2">이메일</label>
					<input type="text" class="form-control" id="email" placeholder="metadog@example.com" required="required" required> 
					<span class="emailchk"></span>
				</div>
	
				<div class="mb-3">
					<label for="phoneNumber" class="mb-2">휴대폰 번호</label> 
					<input type="text" class="form-control" id="phoneNumber" required> 
					<span class="phchk"></span>
				</div>
			
				<div class="mb-3">
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
				</div>
		
				<button class="btn btn-warning w-100 py-2 mb-3" type="submit">가입 완료</button>
			</form>
		</div>
	</div>
	<footer class="my-3 text-center text-small">
		<p class="mb-1">&copy; 2024 YD</p>
	</footer>
</section>