<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<%@ include file="../inc/header.jsp" %>

<form name="info" action="infoChange" method="post">
<div class="info">
	<div class="profile_tabs">
		<ul class="authcd_y">
			<li class="on"><a href="/matjjang/info">회원정보변경</a></li>
			<li class="false"><a href="/matjjang/changePw">비밀번호변경</a></li>
			<li class="false"><a href="/matjjang/leave">회원탈퇴</a></li>
		</ul>
	</div>
	<div class="mp_profile_write">
		<div class="write_info">
			<ul>
				<li>
					<span class="tit">이름</span>
					<div class="cnt">
						<div>
							<ul class="overflow">
								<li>
									<div class="input01">
										<div>
											<input type="text" name="mi_name" value="${mi_name}" class="focusIn" placeholder="이름을 입력해주세요.">
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</li>
				<li>
					<span class="tit">이메일</span>
					<div class="cnt">
						<div>
							<ul class="overflow">
								<li>
									<div class="input01">
										<div>
											<input type="email" name="mi_email" value="${mi_email}" class="focusIn" placeholder="이메일을 입력해주세요.">
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</li>
				<li><span class="tit">휴대폰번호</span>
					<div class="cnt">
						<ul class="overflow">
							<li>
								<div class="input01">
									<div>
										<input type="text" name="mi_phone" value="${mi_phone}" class="focusIn" placeholder="휴대폰 번호를 입력해주세요.">
									</div>
								</div>
							</li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<div class="btn_box">
			<ul>
				<li><input type="submit" class="btnTy15" value="저장" /></li>
			</ul>
		</div>
	</div>
</div>
</form>
<%@ include file="../inc/foot.jsp" %>