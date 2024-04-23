<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<%@ include file="../inc/header.jsp" %>
<style>
	.imgbox {display:flex; justify-content:center;}
	/* .review_write {display:none;} */
	
</style>
<script>
window.onload = function () { 	
	
	// 리뷰 작성 클릭 시
	new Vue ({
	    el: '#app',
	    data :{
	        show: false
	    },
	    methods:{
	        toggleShow(){
	            this.show = !this.show;
	        }
	    }
	});
	
	// 지도 
	var HOME_PATH = window.HOME_PATH || '.';
	var position = new naver.maps.LatLng(${si_lat}, ${si_lng});

	var mapOptions = {
	    center: position,
	    zoom: 15,
	    zoomControl: true,
	    zoomControlOptions: {
	        style: naver.maps.ZoomControlStyle.SMALL,
	        position: naver.maps.Position.TOP_RIGHT
	    }
	};

	var map = new naver.maps.Map('map', mapOptions);

	var markerOptions = {
	    position: position,
	    map: map,
	    icon: {
	        url: HOME_PATH +'/img/example/pin_default.png',
	        size: new naver.maps.Size(22, 35),
	        origin: new naver.maps.Point(0, 0),
	        anchor: new naver.maps.Point(11, 35)
	    },
	    shape: {
	        coords: [11, 0, 9, 0, 6, 1, 4, 2, 2, 4,
	                0, 8, 0, 12, 1, 14, 2, 16, 5, 19,
	                5, 20, 6, 23, 8, 26, 9, 30, 9, 34,
	                13, 34, 13, 30, 14, 26, 16, 23, 17, 20,
	                17, 19, 20, 16, 21, 14, 22, 12, 22, 12,
	                22, 8, 20, 4, 18, 2, 16, 1, 13, 0],
	        type: 'poly'
	    }
	};

	var marker = new naver.maps.Marker(markerOptions);
}
</script>

<section id="content" style="width:1000px; margin:0 auto;">
	<div class="comBox" style="display:flex; margin-top:60px;">
		<div id="slideWrap" class="carousel" data-ride="carousel" style="width:45%;">
		  	<div id="myCarousel" class="carousel slide mb-6 pointer-event">
				<div class="carousel-indicators">
				<c:forEach items="${storeView}" var="store">
					<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-label="Slide 1" aria-current="true"></button>
					<c:if test="${not empty store.si_img2}">
				  	<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
				  	</c:if>
				  	<c:if test="${not empty store.si_img3}">
				  	<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
				  	</c:if>
				</div>
				<div class="carousel-inner">
					<c:if test="${not empty store.si_img1}">
					    <div class="carousel-item active">
					        <div class="imgbox"><img src="/ad_matjjang/resources/img/store/${store.si_img1}"></div>
					    </div>
					</c:if>
					<c:if test="${not empty store.si_img2}">
					    <div class="carousel-item">
					        <div class="imgbox"><img src="/ad_matjjang/resources/img/store/${store.si_img2}"></div>
					    </div>
					</c:if>
					<c:if test="${not empty store.si_img3}">
					    <div class="carousel-item">
					        <div class="imgbox"><img src="/ad_matjjang/resources/img/store/${store.si_img3}"></div>
					    </div>
					</c:if>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<div class="textBox">
			<div class="ttop">
				<h3>${store.si_name}</h3>
				<img width="22" height="22" style="vertical-align:baseline;" src="resources/img/star.png">
				<span>${store.si_star}</span>
			</div>
			<div class="tbom">
				<div class="info_text">
					<table>
						<tr>
							<th>
								<h3>영업시간</h3>
							</th>
							<td>
								<div class="inline-div">
									<div class="inline-div">${store.si_week}</div>
									<div class="inline-div">
										<label>${store.si_open} ~ ${store.si_close}</label>
									</div>
								</div>
								<div class="inline-div">
									<span class="label">OPEN</span>
								</div>
							</td>
						</tr>
						<tr>
							<th>
								<h3>주차</h3>
							</th>
							<td>${store.si_parking}</td>
						</tr>
						<tr>
							<th>
								<h3>주소</h3>
							</th>
							<td>
								<div class="inline-div">
									<div class="inline-div">${store.si_addr1}</div>
									<p><span>지번</span>${store.si_addr2}</p>
								</div>
							</td>
						</tr>
						<tr>
							<th>
								<h3>전화번호</h3>
							</th>
							<td itemprop="telephone">
								<div>${store.si_number}</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="store_fonction">
				<input type="checkbox" id="toggle_good" value="on">
				<label for="toggle_good">
					<span>좋아요</span>
					<img src="resources/img/bg_icon_good.png" alt="좋아요 버튼">
				</label>
				<input type="checkbox" id="toggle_bookmark" value="on">
				<label for="toggle_bookmark"><span>즐겨찾기</span>
					<img src="resources/img/bg_icon_bookmark2.png" alt="즐겨찾기 버튼">
				</label>
				<a href="#review_bow" data-target="location_review">
					<span>리뷰쓰기</span>
					<img src="resources/img/bg_icon_reviewWrite.png" alt="리뷰쓰기 버튼">
				</a>
				<a href="#layer_sns_share">
					<span>공유하기</span>
					<img src="resources/img/bg_icon_share2.png" alt="공유하기 버튼">
				</a>
				<div class="toast good_on">
					<span>
						<img src="resources/img/bg_icon_good_red.png" alt="좋아요 활성">
						</span>
				</div>
				<div class="toast good_off">
					<span>좋아요를 취소하셨습니다.</span>
				</div>
				<div class="toast bookmark_on">
					<span><img src="resources/img/bg_icon_bookmark_orange.png" alt="즐겨찾기 활성">즐겨찾기에 추가하였습니다.</span>
				</div>
				<div class="toast bookmark_off">
					<span>즐겨찾기를 취소하였습니다.</span>
				</div>
			</div>
		</div>
	</div>
	<div class="store_info3">
		<div class="store_info3_title">매장소개</div>
		<div class="text">
			${store.si_explan}
		</div>
	</div>
	<div id="map" class="map" style="width:100%;height:400px;"></div>
	</c:forEach>
	<div class="store_review" style="margin-bottom:20px;">
	 	<div id="app">
			<div class="review_title">
				<h3>식신 리뷰</h3><span>(172)</span>
				<input type="checkbox" id="writeToggle" value="on">
				<label for="writeToggle" @click="toggleShow">리뷰 작성</label>
			</div>
			<div class="review_write" v-if="show">
				<div class="review_write_title">리뷰를 작성해주세요.</div>
				<div class="review_write" style="display: block; padding:0 0 50px;">
					<div class="scoreBox star_box">
						<div class="star_score">
							<div class="rating-star-7">
							<div style="width:100%">
								<img src="resources/img/star.png" alt="별점을 선택해 평가해보세요.">
								<select>
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
							</div>
						</div>
					</div>
				</div>
				<div class="txtbox">
					<div>
						<textarea name="storyContents" class="focusIn" placeholder="매장에 대한 리뷰를 작성해보세요.(필수)"></textarea>
					</div>
				</div>
				<div class="file_list">
					<div class="photo_review">
						<ul>
							<li class="file_wrap">
								<input type="file" name="imgFile" class="file_add" multiple="">
							</li>
						</ul>
					</div>
					<a class="btn">등록</a>
				</div>
			</div>
		</div>
		<div class="place_review_list">
			<div class="name">이한나
				<img src="resources/img/star.png" alt="별점" width="15" style="vertical-align:baseline;">
				<span class="score">5</span>
			</div>
			<div class="action">
				<a href="javascript:void(0);" class="btn_report review_action">신고</a>
			</div>
			<div class="review_text">
				우선 육회비빔밥을 시키면 선지국을 함께 주기 때문에 밸런스가 매우 적절하다. 
				비빔밥의 육회도 신선하고, 선지는 안먹는 사람도 국물 정도는 함께 먹으면 맛있다. 
				어쩐지 청담 근처에 가면 계속 떠오르는 스테디 맛집!
			</div>
			<div class="img_list">
				<a href="#layer_review_photo">
				<img src="https://img.siksinhot.com/story/1514655456825339.JPG?w=307&amp;h=300&amp;c=Y" alt="새벽집 청담동점 매장 방문 후 남겨주신 고객 리뷰 사진입니다."></a>
			</div>
			<div class="review_status">
				<button class="like-cnt">
					<span class="icon black">
						<svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" height="1.3em" width="1.3em" xmlns="http://www.w3.org/2000/svg" data-reactid="113">
							<path d="M462.3 62.6C407.5 15.9 326 24.3 275.7 76.2L256 96.5l-19.7-20.3C186.1 24.3 104.5 15.9 49.7 62.6c-62.8 53.6-66.1 149.8-9.9 207.9l193.5 199.8c12.5 12.9 32.8 12.9 45.3 0l193.5-199.8c56.3-58.1 53-154.3-9.8-207.9z"></path>
						</svg>
					</span>
					<span class="count">좋아요11</span>
				</button>
				<button class="reply-cnt">
					<span class="icon black">
						<svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" height="1.3em" width="1.3em" xmlns="http://www.w3.org/2000/svg">
							<path d="M256 32C114.6 32 0 125.1 0 240c0 49.6 21.4 95 57 130.7C44.5 421.1 2.7 466 2.2 466.5c-2.2 2.3-2.8 5.7-1.5 8.7S4.8 480 8 480c66.3 0 116-31.8 140.6-51.4 32.7 12.3 69 19.4 107.4 19.4 141.4 0 256-93.1 256-208S397.4 32 256 32zM128 272c-17.7 0-32-14.3-32-32s14.3-32 32-32 32 14.3 32 32-14.3 32-32 32zm128 0c-17.7 0-32-14.3-32-32s14.3-32 32-32 32 14.3 32 32-14.3 32-32 32zm128 0c-17.7 0-32-14.3-32-32s14.3-32 32-32 32 14.3 32 32-14.3 32-32 32z"></path>
						</svg>
					</span>
					<span class="count" data-reactid="122">댓글1</span>
				</button>
			</div>
		</div>
		<a href="#" class="more_list" data-reactid="202"><span data-reactid="203">리뷰 더보기 +</span></a>
	</div>

</section>

<script>

</script>

<script>

</script>

<%@ include file="../inc/foot.jsp" %>