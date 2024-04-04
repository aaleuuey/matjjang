<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<%@ include file="../inc/header.jsp" %>
<style>
	.ttop {display:flex; margin-left:20px; margin-bottom:20px;}
	.ttop h3 {font-weight:bold;}
	.ttop img {margin:6px 0 0 5px;}
	.ttop span {height:30px; margin:-2px 0 0 5px; font-size:25px; font-weight:bold; color:#eca600;}
	.tbom {margin-left:20px;}
	.tbom .info_text .inline-div {display: inline-block; margin-right: 5px; vertical-align: top;}
	.tbom .info_text table tr {display:block; margin-bottom:20px;}
	.tbom .info_text table th {width: 130px; vertical-align: top; line-height: 2.5; text-align: left;}
	.tbom .info_text table th h3 {margin-bottom:0; font-size: 18px; font-weight: 400; color: #999;}
	.tbom .info_text table td p {font-size: 14px; font-weight: 400; color: #666; line-height: 1;}
	.tbom .info_text table td p span {display: inline-block; width: 40px; line-height: 20px; border-radius: 5px; font-size: 14px; color: #999; border: 1px solid #ddd; text-align: center; margin-right: 5px;}
	.tbom .info_text table td .label {display: inline-block; vertical-align: middle; line-height: 16px; border-radius: 5px; font-size: 12px; font-weight: 600; color: #ff7400; border: 1px solid #ff7400; text-align: center; margin-top:4px; margin-left: 10px; padding: 0 5px;}
	.store_fonction {width: 100%; margin: 73px 0 0 20px; background-color: transparent; padding: 8px 0; display: flex; justify-content: space-between; cursor:pointer; cursor:pointer;}
	.store_fonction input[type=checkbox] {display:none;}
	.store_fonction label {cursor:pointer;}
	.store_fonction a {color:#000;}
	.store_fonction label img, .store_fonction a img {display:inline-block; height:20px;}
	.store_fonction label img, .store_fonction span {vertical-align:middle;}
	.store_info3 {position: relative; padding: 15px 20px; border: 1px solid #ddd; box-sizing: border-box; border-radius: 10px; margin-bottom: 12px; margin-top: 20px;}
	.store_info3 .store_info3_title {font-size: 20px; font-weight: bold; color: #000; text-align: left; margin-bottom: 20px;}
	.store_info3 .text {font-size: 16px; color: #000; line-height: 1.6;}
	.map {margin:30px 0;}
	.store_review {position: relative; border: 1px solid #ddd; border-radius: 10px; box-sizing: border-box; margin-top: 20px; padding: 0 20px 40px;}
	.store_review .review_title {position: relative; font-size: 18px; color: #000; text-align: left; padding: 15px 0; border-bottom: 1px solid #ddd;}
	.store_review .review_title h3 {display:contents; font-size:18px;}
	.store_review .review_title input {display:none;}
	.store_review .review_title input + label {position: absolute; top: 50%; transform: translateY(-50%); right: 0; font-size: 16px; font-weight: bold; color: #ff7400; padding-right: 18px; background-image: url(resources/img/bg_arrow.png); background-position: top 8px right; background-repeat: no-repeat; background-size: 12px; cursor: pointer;}
	.store_review .review_write {padding:40px 0 50px;}
	.store_review .review_write .review_write_title {font-size:25px; font-weight:500; color:#000; text-align:center;}
	.store_review .review_write .scoreBox {margin:60px 0; text-align:center;}
	.store_review .review_write .scoreBox img {display:inline-block; width:36px; margin-right:5px; vertical-align:top;}
	.store_review .review_write .scoreBox select {width:80px; height:35px; border: var(--bs-border-width) solid var(--bs-border-color); border-radius: var(--bs-border-radius);}
	.txtbox {border: 1px solid #d7d7d7; position: relative; overflow: hidden; background: #fff; padding: 0 0 0 15px;}
	.txtbox label.label {position: absolute; left: 0; top: 0; width: 100%; padding: 14px 0 0 16px; color: #999; font-size: 1.250em; cursor: text;}
	.txtbox textarea {width: 100%; height: 10rem; resize: none; background: #fff; border: none; outline: none; padding-top: 16px; margin-top: 1px; font-size: 1.250em;}
	.store_review .review_write .file_list {position: relative; margin-top: 20px;}
	.store_review .review_write .file_list ul {text-align: left; padding-right: 50px; padding-left:0;}
	.store_review .review_write .file_list ul li {position: relative; display: inline-block; vertical-align: middle; width: 80px; height: 80px; background-image: url(resources/img/bg_photo_file03.gif); background-position: center; background-repeat: no-repeat; background-size: contain; margin-right: 5px;}
	.store_review .review_write .file_list ul li input[type=file] {width: 80px; height: 80px; opacity: 0;}
	.store_review .review_write .file_list .btn {position: absolute; right: 0; top: 50%; transform: translateY(-50%); font-size: 20px; font-weight: 600; color: #ffc107; cursor: pointer;}
	.store_review .place_review_list {position: relative; display: table-cell; width: 100%; padding: 10px 10px; box-sizing: border-box; vertical-align: top; border-top: 1px solid lightgray; overflow-x: auto;}
	.store_review .place_review_list .name {font-size: 18px; color: #000; display: inline-block;}
	.store_review .place_review_list .name .score {font-size: 18px; font-weight: bold; color: #ffc107; margin-left: 10px;}
	.store_review .place_review_list .action {display: inline-block; float: right;}
	.store_review .place_review_list .review_action {font-size: 12px; color: #999; text-decoration: underline; background: none !important; margin-left: 5px; padding: 0px !important;}
	.store_review .place_review_list .review_text {font-size: 14px; color: #666; margin-top: 10px; line-height: 1.4; overflow-y: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;}
	.store_review .place_review_list .img_list a {display: inline-block; vertical-align: middle; width: 80px; height: 70px; margin-top: 5px; margin-right: 5px;}
	.store_review .place_review_list .img_list a img {display: block; width: 100%; height: 100%; object-fit: cover; object-position: center;}
	.store_review .place_review_list .review_status {width: 100%; height: 1.5rem; color: gray; font-size: 0.7rem; padding-top: 10px;}
	.store_review .place_review_list .review_status button {border: none; background: none; padding: 0;}
	.store_review .place_review_list .review_status button span {font-size:13px;}
	.store_review .place_review_list .review_status button span.black {color: gray;}
	.store_review .place_review_list .review_status button span svg {vertical-align: top; margin-top:3px; overflow: hidden;}
</style>

<section id="content" style="width:1000px; margin:0 auto;">
	<div class="comBox" style="display:flex; margin-top:60px;">
		<div id="slideWrap" class="carousel" data-ride="carousel" style="width:45%;">
		  	<div id="myCarousel" class="carousel slide mb-6 pointer-event">
				<div class="carousel-indicators">
				  <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-label="Slide 1" aria-current="true"></button>
				  <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
				  <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
				</div>
				<div class="carousel-inner">
				    <div class="carousel-item active">
						<div class="imgbox"><img src="resources/img/matj-banner.jpg"></div>
				    </div>
				    <div class="carousel-item">
				     	<div class="imgbox"><img src="resources/img/matj-banner02.jpg"></div>
				    </div>
				    <div class="carousel-item">
						<div class="imgbox"><img src="resources/img/matj-banner03.jpg"></div>
				    </div>
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
				<h3>새벽집 청담동점</h3>
				<img width="22" height="22" style="vertical-align:baseline;" src="resources/img/star.png">
				<span>4.5</span>
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
									<div class="inline-div">매일</div>
									<div class="inline-div">
										<label>00:00 ~ 00:00</label>
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
							<td>주차,발렛</td>
						</tr>
						<tr>
							<th>
								<h3>주소</h3>
							</th>
							<td>
								<div class="inline-div">
									<div class="inline-div">서울특별시 강남구 도산대로78길 25 1층</div>
									<p><span>지번</span>서울특별시 강남구 청담동 11-12 1층</p>
								</div>
							</td>
						</tr>
						<tr>
							<th>
								<h3>전화번호</h3>
							</th>
							<td itemprop="telephone">
								<div>0503-5798-4120</div>
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
			청담동 조용한 골목가에 위치한 스테이크 하우스입니다. 
			제주도에서 매장을 운영하다 맛으로 유명세를 얻은 뒤 서울로 자리를 옮겼습니다. 
			실내는 고기 굽는 과정을 지켜볼 수 있는 바테이블과 프라이빗한 식사가 가능한 룸으로 이루어져 있는 구조입니다. 
			맞춤형 그릴에서 저온으로 고기를 굽는데, 구웠다 식히는 과정만 수십 분 넘게 반복하는 것이 특징으로 최고의 맛을 위해 숯까지 직접 제작하는 정성이 맛에서 오롯이 드러납니다. 
			이렇게 구워낸 스테이크는 일반적인 조리법에 비해 마치 수비드한 것과 같이 부드러운 식감과 육즙이 살아있습니다.
		</div>
	</div>
	<div id="map" class="map" style="width:100%;height:400px;"></div>
	
	<div class="store_review">
		<div class="review_title">
			<h3>식신 리뷰</h3><span>(172)</span>
			<input type="checkbox" id="writeToggle" value="on">
			<label for="writeToggle">리뷰 작성</label>
		</div>
		<div class="review_write" style="display: block;">
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
		<div class="place_review_list">
			<div class="name">이한나
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
	</div>
</section>

<script>
	var mapOptions = {
	    center: new naver.maps.LatLng(37.3595704, 127.105399),
	    zoom: 10
	};
	
	var map = new naver.maps.Map('map', mapOptions);
</script>

<%@ include file="../inc/foot.jsp" %>