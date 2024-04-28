<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<%@ include file="../inc/header.jsp" %>
<style>
	.imgbox {display:flex; justify-content:center;}
</style>
<script>
window.onload = function () { 	
	// 리뷰 작성 클릭 시
	new Vue({
	    el: '#app',
	    data: {
	        show: false,
	        siid: '${siid}', // 서버에서 받은 siid 값 할당
	        rcontent: '',
	        rstar: null,
	        images: [],
	    },
	    methods: {
	        toggleShow() {
	            this.show = !this.show;
	        },
	        rInsert() {
	            if (this.rcontent.trim() !== "") { // 댓글 내용이 비어있지 않은지 확인
	                const formData = new FormData(); // FormData 객체 생성
	                formData.append('siid', this.siid);	// siid 값을 FormData에 추가
	                formData.append('rcon', this.rcontent);
	                formData.append('rstar', this.rstar);
	                
	             	// 이미지를 보내는 경우에만 FormData에 추가
                    if (this.images.length > 0) {
                        for (let i = 0; i < this.images.length; i++) {
                            formData.append('imageNames[]', this.images[i].name);
                        }
                        for (let i = 0; i < this.images.length; i++) {
                            formData.append('imageFiles', this.images[i].file);
                        }
                    } else {
                        // 이미지를 보내지 않은 경우에도 imageNames[] 파라미터를 빈 배열로 추가
                        formData.append('imageNames[]', []);
                    }

	                
	                $.ajax({
	                    type: "POST",
	                    url: "/matjjang/storeReplyIn",
	                    data: formData, // 전송할 데이터
	                    contentType: false, // 데이터 타입을 설정하지 않음
	                    processData: false, // 데이터를 처리하지 않음
	                    success: (result) => { // 요청이 성공했을 때의 콜백 함수
	                    	if (result == 0) {
	            				alert("댓글 등록에 실패했습니다.\n다시 시도해 보세요.");
	            			} else {
	            				alert("댓글이 등록되었습니다.");
	            				location.reload();
	            			}
	                    }
	                });
	            } else {
	                alert("내용을 입력해주세요.");
	            }
	        },
	        
	    	// 댓글에 이미지 추가하는 메서드
	        onFileChange(event) {
	            const files = event.target.files; // 파일 객체들을 가져옴
	            for (let i = 0; i < files.length; i++) {
	                const file = files[i]; // 각 파일 객체	
	                const imageUrl = URL.createObjectURL(file); // 파일을 URL로 변환
	                
	                // 이미지 객체를 images 배열에 추가
	                this.images.push({ url: imageUrl ,name: file.name, file: file });
	    
	            }
	        },
	        
	     	// 댓글에 첨부된 이미지 삭제하는 메서드
	        deleteImage(index) {
	            URL.revokeObjectURL(this.images[index].url); // URL 해제
	            this.images.splice(index, 1); // 배열에서 이미지 삭제
	        }
	    }
	});
	
	// 지도 
	var HOME_PATH = window.HOME_PATH || '.';
	var position = new naver.maps.LatLng(${si_lat} , ${si_lng});

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
									<select v-model="rstar">
										<option value="1">1</option>
									    <option value="1.5">1.5</option>
									    <option value="2">2</option>
									    <option value="2.5">2.5</option>
									    <option value="3">3</option>
									    <option value="3.5">3.5</option>
									    <option value="4">4</option>
									    <option value="4.5">4.5</option>
									    <option value="5">5</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="txtbox">
					<div>
						<textarea name="storeContents" class="focusIn" v-model="rcontent" placeholder="매장에 대한 리뷰를 작성해보세요.(필수)"></textarea>
					</div>
				</div>
				<div class="file_list">
					<div class="photo_review">
						<ul>
							<li class="file_wrap">
								<input type="file" name="imgFile" class="file_add" @change="onFileChange" accept="image/*" multiple>
							</li>
							<!-- v-for 디렉티브를 사용하여 images 배열의 각 이미지에 대해 반복하며 이미지를 표시 -->
							<li v-for="(image, index) in images" :key="index">
								<!-- :src 속성에는 현재 반복 중인 이미지의 URL이 바인딩  -->
								<img :src="image.url" alt="Image" width="100">
								<a href="javascript:void(0);" class="btn_del" @click="deleteImage(index)">
									<img src="resources/img/btn_file_del01.png" alt="삭제">
								</a>
							</li>
						</ul>
					</div>
					<input type="submit" id="btn" class="btn" @click="rInsert();" value="등록" />
				</div>
			</div>
		</div>
		<c:forEach items="${storeReplyList}" var="storeReply">
		<div class="place_review_list">
			<div class="name">${storeReply.mi_name}
				<img src="resources/img/star.png" alt="별점" width="15" style="vertical-align:baseline;">
				<span class="score">${storeReply.sr_star}</span>
			</div>
			<div class="review_text">
				${storeReply.sr_content}
			</div>
			<div class="img_list">
				<c:if test="${not empty storeReply.sr_img1}">
				<a href="#layer_review_photo">
					<img src="resources/img/storeReply/${storeReply.sr_img1}" alt="새벽집 청담동점 매장 방문 후 남겨주신 고객 리뷰 사진입니다.">
				</a>
				</c:if>
				<c:if test="${not empty storeReply.sr_img2}">
				<a href="#layer_review_photo">
					<img src="resources/img/storeReply/${storeReply.sr_img2}" alt="새벽집 청담동점 매장 방문 후 남겨주신 고객 리뷰 사진입니다.">
				</a>
				</c:if>
				<c:if test="${not empty storeReply.sr_img3}">
				<a href="#layer_review_photo">
					<img src="resources/img/storeReply/${storeReply.sr_img3}" alt="새벽집 청담동점 매장 방문 후 남겨주신 고객 리뷰 사진입니다.">
				</a>
				</c:if>
				
			</div>
			<div class="review_status">
				<button class="like-cnt">
					<span class="icon black">
						<svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" height="1.3em" width="1.3em" xmlns="http://www.w3.org/2000/svg" data-reactid="113">
							<path d="M462.3 62.6C407.5 15.9 326 24.3 275.7 76.2L256 96.5l-19.7-20.3C186.1 24.3 104.5 15.9 49.7 62.6c-62.8 53.6-66.1 149.8-9.9 207.9l193.5 199.8c12.5 12.9 32.8 12.9 45.3 0l193.5-199.8c56.3-58.1 53-154.3-9.8-207.9z"></path>
						</svg>
					</span>
					<span class="count">좋아요${storeReply.sr_good}</span>
				</button>
			</div>
		</div>
		<a href="#" class="more_list" data-reactid="202"><span data-reactid="203">리뷰 더보기 +</span></a>
		</c:forEach>
		
	</div>

</section>

<%@ include file="../inc/foot.jsp" %>