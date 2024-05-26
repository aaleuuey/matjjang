<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<%@ include file="../inc/header.jsp" %>

<div class="mypage">
	<div class="mp_profile_info">
		<div class="info">
			<dl>
				<dt>이한나</dt>
				<dd>안녕하세요. 이한나 입니다.</dd>
			</dl>
		</div>
		<a class="btn_profile_modify" href="/users/604940/private/info">프로필 수정</a>
	</div>
	<div class="mp_conts">
		<div class="mp_tab">
			<ul>
				<li>
					<a href="javascript:loadpage(1);">즐겨찾기<span>(2)</span></a>
				</li>
				<li>
					<a href="javascript:loadpage(2);">리뷰<span>(0)</span></a>
				</li>
				<li>
					<a href="javascript:loadpage(3);">좋아요<span>(1)</span></a>
				</li>
			</ul>
		</div>
		<div class="mp_favorit_list">
			<div>
				<div class="txt_save_info"><strong>2</strong>개의 장소를 저장했습니다.</div>
				<a href="#" class="btn_folder_add"><span>폴더추가</span></a>
				<div>
					<div class="folder_box">
						<div class="floder_store">
							<h3>
								<a href="/users/604940/list/bookmark/637497">
									<span data-reactid="144">ㄹㅇ</span>
									<strong data-reactid="145">(0)</strong>
								</a>
							</h3>
							<ul>
								<li>
									<a href="https://www.siksinhot.com/P/323">
										<img src="https://img.siksinhot.com/place/1530597402238010.jpg">
									</a>
								</li>
								<!-- <li>
									<a href="https://www.siksinhot.com/P/320351">
										<img src="https://img.siksinhot.com/place/1554870952814204.jpg">
									</a>
								</li> -->
							</ul>
							<a href="#" class="btn_foloder_setup"><img src="/static2/images/common/btn_folder_setup.png" alt="설정"></a>
						</div>
					</div>				
				</div>
			</div>
		</div>
		<iframe id="showpage" src="bookmark" ></iframe>
	</div>
</div>
<script>
function loadpage(num) {
    var src;
    switch(num) {
        case 1:
            src = "bookmark";
            break;
        case 2:
            src = "review";
            break;
        case 3:
            src = "good";
            break;
        case 4:
            src = "setbanner";
            break;
        case 5:
            src = "orderList";
            break;
        case 6:
            src = "auctionOrderList";
            break;
        default:
            src = "";
    }
    document.getElementById("showpage").src = src;
    window.history.pushState({}, '', src);
}
</script>
<%@ include file="../inc/foot.jsp" %>