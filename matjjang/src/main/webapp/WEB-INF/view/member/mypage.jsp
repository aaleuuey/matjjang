<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<%@ include file="../inc/header.jsp" %>

<div class="mypage">
	<div class="mp_profile_info">
		<div class="info">
			<dl>
				<dt>이한나</dt>
			</dl>
		</div>
		<a class="btn_profile_modify" href="/users/604940/private/info">프로필 수정</a>
	</div>
	<div class="mp_conts">
		<div class="mp_tab">
			<ul>
				<li class="tab_item active">
					<a href="#tab1">즐겨찾기<span>(${bkcnt})</span></a>
				</li>
				<li class="tab_item">
					<a href="#tab2">리뷰<span>(${rvcnt})</span></a>
				</li>
				<li class="tab_item">
					<a href="#tab3">좋아요<span>(${htcnt})</span></a>
				</li>
			</ul>
		</div>
		<div id="tab1" class="tab_content mp_favorit_list active">
			<div>
				<div class="folder_add_box">
					<a href="javascript:folderShow();" class="btn_folder_add"><span>폴더추가</span></a>
				</div>
				<div class="layer_mp_folder layer_wrap" id="layer_mp_folder_add">
	                <div class="bgModal" id="bgModal"></div>
	                <div class="layer_mp_folder_add" id="folderModal">
	                    <div class="layer_header">
	                        <h3>폴더 추가</h3>
	                    </div>
	                    <div class="mp_folder_add">
	                        <p class="txt_ment">맛집을 저장하고 싶은 폴더의 이름을 입력하세요.</p>
	                        <div class="txtbox">
	                            <div><label class="label"></label><textarea name="title" id="txArea" class="focusIn"></textarea></div>
	                        </div>
	                        <div class="btn_box">
	                            <ul>
	                                <li><a href="javascript:folderHide();" class="btnTy10">취소</a></li>
	                                <li><a href="javascript:setFolder('${miid}');" id="submitBtn" class="btnTy11">저장</a></li>
	                            </ul>
	                        </div>
	                    </div>
	                    <a href="javascript:folderHide();" class="btn_layer_close"></a>
	                </div>
	            </div>
				<div>
					<c:forEach items="${bookmarkView}" var="bookmark">
					<div class="folder_box">
						<div class="floder_store">
							<h3>
								<span>${bookmark.bf_title}<strong>(${bookmark.bf_cnt})</strong></span>
								<a href="javascript:modifyFolder();" id="btn_foloder_setup" class="btn_foloder_setup"><img src="/matjjang/resources/img/btn_folder_setup.png" alt="설정"></a>
							</h3>
							<ul>
								<c:forEach items="${bookmarkImages}" var="bkImgs">
									<c:if test="${bookmark.bf_idx == bkImgs.bf_idx}">
										<li>
											<a href="/matjjang/storeView?siid=${bkImgs.si_id}">
												<img src="/ad_matjjang/resources/img/store/${bkImgs.bfi_img}">
											</a>
										</li>
									</c:if>
								</c:forEach>
							</ul>
							
						</div>
					</div>	
					<div class="layer_mp_folder layer_wrap" id="layer_mp_folder_modify">
		                <div class="layer_mp_folder_add folderModify" id="folderModify">
		                    <div class="layer_header">
		                        <h3>폴더 수정/삭제</h3>
		                    </div>
		                    <div class="mp_folder_add">
		                        <p class="txt_ment">폴더명을 입력하세요.</p>
		                        <div class="txtbox">
		                            <div><label class="label"></label><textarea name="title" id="txArea2" class="focusIn"></textarea></div>
		                        </div>
		                        <div class="btn_box">
		                        	<ul>
		                        		<li>
		                        			<a href="javascript:folderHide();" class="btnTy10">취소</a>
		                        		</li>
		                        		<li>
		                        			<a href="javascript:updateFolder('${miid}', ${bookmark.bf_idx});" class="btnTy11">저장</a>
		                        		</li>
		                        		<li>
		                        			<a href="javascript:deleteFolder('${miid}', ${bookmark.bf_idx});" class="btnTy12">폴더삭제</a>
		                        		</li>
		                        	</ul>
		                        </div>
		                    </div>
		                    <a href="javascript:folderHide();" class="btn_layer_close"></a>
		                </div>
		            </div>
					</c:forEach>			
				</div>
			</div>
		</div>
		<div id="tab2" class="tab_content">
		</div>
		<div id="tab3" class="tab_content">
			<div class="mp_like_place">
				<div class="listTy1">
					<ul>
						<li>
							<div class="cont">
								<a target="_self" href="/P/320351">
									<span class="img">
										<img src="https://img.siksinhot.com/place/1554870952814204.jpg?w=408&amp;h=328&amp;c=Y" width="408" height="328">
										<strong class="ico_best"><img src="/static2/images/common/ico_best_2.png" alt="best"></strong>
									</span>
									<div class="cnt">
										<em class="score">3.9</em>
										<div class="box_tit">
											<strong class="store">삼성원조양곱창</strong>
											<div class="ico_right"></div>
										</div>
										<ul style="padding:0;">
											<li>청담동</li>
										</ul>
									</div>
								</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	// tab
	const tabItem = document.querySelectorAll(".tab_item");
	const tabContent = document.querySelectorAll(".tab_content");
	
	tabItem.forEach((item, index) => {
		item.addEventListener("click", (e) => {
			// 버튼을 a 태그에 만들었기 때문에, 태그의 기본 동작(링크 연결) 방지
			e.preventDefault(); // a 
			
			// "탭 내용" 부분들을 forEach 문을 통해 한번씩 순회
			tabContent.forEach((content) => {
			  // "탭 내용" 부분들 전부 active 클래스를 제거
			  content.classList.remove("active");
			});
			
			// "탭 버튼"들을 forEach 문을 통해 한번씩 순회
			tabItem.forEach((content) => {
			  // "탭 버튼"들 전부 active 클래스를 제거한다.
			  content.classList.remove("active");
			});
			
			// 탭 버튼과 탭 내용 영역의 index에 해당하는 부분에 active 클래스를 추가
			// ex) 만약 첫번째 탭(index 0)을 클릭했다면, 같은 인덱스에 있는 첫번째 탭 내용 영역에 active 클래스가 추가됨
			tabItem[index].classList.add("active");
			tabContent[index].classList.add("active");
		});
	});
	
	function folderShow() {
		$(function(){
			$("#folderModal").show();
			$("#bgModal").show();
		});
	}
	
	$(function(){
		$('.btn_foloder_setup').click(function() {
			$(this).parents(".folder_box").next(".layer_mp_folder").children(".folderModify").show();
			$("#bgModal").show();
		});
	});
	
	function folderHide() {
		$(function(){
			$("#folderModal").hide();
			$(".folderModify").hide();
			$("#bgModal").hide();
		});
	}
	
	
	// 폴더 추가
	function setFolder(miid) {
		var txCont = document.getElementById('txArea').value;
		
		$.ajax({
	        type: "POST",
	        url: "/matjjang/folderAddProc",
	        data: { "miid" : miid, "txCont" : txCont},
	        success: function(result) {
	        	location.reload();
            },
            error: function(xhr, status, error) {
                alert('오류 발생: ' + error);
            }
	    });
	}
	
	// 폴더 수정
	function updateFolder(miid, bfidx) {
		var txCont = document.getElementById('txArea2').value;
		
		$.ajax({
	        type: "POST",
	        url: "/matjjang/folderUpdate",
	        data: { "miid" : miid, "bfidx" : bfidx ,"txCont" : txCont},
	        success: function(result) {
	        	alert("변경 되었습니다.");
	        	location.reload();
            },
            error: function(xhr, status, error) {
                alert('오류 발생: ' + error);
            }
	    });
	}
	
	// 폴더 삭제
	function deleteFolder(miid, bfidx) {
		$.ajax({
	        type: "POST",
	        url: "/matjjang/folderDelete",
	        data: { "miid" : miid, "bfidx" : bfidx },
	        success: function(result) {	
	        	alert("삭제 되었습니다.");
	        	location.reload();
            },
            error: function(xhr, status, error) {
                alert('오류 발생: ' + error);
            }
	    });
	}
</script>
<%@ include file="../inc/foot.jsp" %>