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
	.store_info3 {position: relative; padding: 15px 20px; border: 1px solid #ddd; box-sizing: border-box; border-radius: 10px; margin-bottom: 12px; margin-top: 20px;}
	.store_info3 .store_info3_title {font-size: 20px; font-weight: bold; color: #000; text-align: left; margin-bottom: 20px;}
	.store_info3 .text {font-size: 16px; color: #000; line-height: 1.6;}
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
	<div class="store_info3 pc_only">
		<div class="store_info3_title">매장소개</div>
		<div class="text">
			청담동 조용한 골목가에 위치한 스테이크 하우스입니다. 
			제주도에서 매장을 운영하다 맛으로 유명세를 얻은 뒤 서울로 자리를 옮겼습니다. 
			실내는 고기 굽는 과정을 지켜볼 수 있는 바테이블과 프라이빗한 식사가 가능한 룸으로 이루어져 있는 구조입니다. 
			맞춤형 그릴에서 저온으로 고기를 굽는데, 구웠다 식히는 과정만 수십 분 넘게 반복하는 것이 특징으로 최고의 맛을 위해 숯까지 직접 제작하는 정성이 맛에서 오롯이 드러납니다. 
			이렇게 구워낸 스테이크는 일반적인 조리법에 비해 마치 수비드한 것과 같이 부드러운 식감과 육즙이 살아있습니다.
		</div>
	</div>
</section>

<%@ include file="../inc/foot.jsp" %>