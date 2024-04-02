<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
<%@ include file="../inc/header.jsp" %>

<section id="content" style="width:1000px; margin:0 auto;">
	<div id="slideWrap" class="carousel" data-ride="carousel">
	  	<div id="myCarousel" class="carousel slide mb-6 pointer-event" style="width:45%; margin-top:60px;">
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
</section>

<%@ include file="../inc/foot.jsp" %>