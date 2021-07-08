<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>작년오늘 - 관광지 정보 페이지</title>

  <!-- Bootstrap core CSS -->
  <link href="${path}/index/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${path}/index/css/modern-business.css" rel="stylesheet">
<link href="${path}/tourSpot/css/tourSpot-article.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- hover event -->
<script type="text/javascript">
$(document).ready(function(){
	$('.arrowpic').hide();
	$('.infor-element').animate({height: '180px'});
	$(".infor-element").hover(function(){
		$('.arrowpic').show();
		$('.infor-element').animate({height: '180px'});
	}, function() {
		$('.arrowpic').hide();
	});
});
</script>
</head>
<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.html">작년오늘</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <c:if test="${kakao_userId==null}">
          <li class="nav-item">
            <a class="nav-link" href="${path }/login">로그인</a>
          </li>
          </c:if>
          <c:if test="${kakao_userId==null}">
          <li class="nav-item">
            <a class="nav-link" href="${path }/join">회원가입</a>
          </li>
          </c:if>
          <li class="nav-item">
            <a class="nav-link" href="${path }/tourSpot">관광지정보</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Portfolio
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="portfolio-1-col.html">1 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-2-col.html">2 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-3-col.html">3 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-4-col.html">4 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-item.html">Single Portfolio Item</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Blog
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
              <a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
              <a class="dropdown-item" href="blog-post.html">Blog Post</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Other Pages
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPages">
              <a class="dropdown-item" href="full-width.html">Full Width Page</a>
              <a class="dropdown-item" href="sidebar.html">Sidebar Page</a>
              <a class="dropdown-item" href="faq.html">FAQ</a>
              <a class="dropdown-item" href="404.html">404</a>
              <a class="dropdown-item" href="pricing.html">Pricing Table</a>
            </div>
          </li>
           <c:if test="${kakao_userId!=null}">
           <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              ${kakao_nickname}님, 안녕하세요!
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="${path}/mypage">마이페이지</a>
              <a class="dropdown-item" href="${path}/logout/kakao">로그아웃</a>
            </div>
          </c:if>
        </ul>
      </div>
    </div>
  </nav>

  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('http://placehold.it/1900x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h3>First Slide</h3>
            <p>This is a description for the first slide.</p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Second Slide</h3>
            <p>This is a description for the second slide.</p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Third Slide</h3>
            <p>This is a description for the third slide.</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>
  
  <!-- main -->
  <div style="height: 1000px; width: 70%; position: relative; left: 15%;">
  		<!-- 검색조건 form -->
	<form id="postSearchFrm" name="postSearchFrm" method="get" action="/nature">
		<input type="hidden" name="srchType" id="srchType" value="">
		<input type="hidden" name="srchOptnCode" id="srchOptnCode" value=""/>
		<input type="hidden" name="srchCtgry" id="srchCtgry" value=""/>
		<input type="hidden" name="sortOrder" id="sortOrder" value=""/>

		<section class="article-list-element">

			<div class="tag-element tag-title">
					<a class="active" title="목록 항목 선택됨" href="#" onclick="ctrySumit('');return false;" >전체</a>
					<a  href="#" onclick="ctrySumit('80');return false;" >산</a>
					<a  href="#" onclick="ctrySumit('81');return false;" >강&계곡</a>
					<a  href="#" onclick="ctrySumit('82');return false;" >섬</a>
					<a  href="#" onclick="ctrySumit('83');return false;" >공원&정원</a>
					<a  href="#" onclick="ctrySumit('84');return false;" >식물원</a>
					</div>
			<div class="tag-element" style="position:relative; left: 75%;">
					<a href="#" onclick="sortOrderSumit(2); return false;" title="목록 항목 선택됨">추천순</a>
					<a href="#" onclick="sortOrderSumit(1); return false;" >업데이트순</a></li>
					<a href="#" onclick="sortOrderSumit(3); return false;" >가나다순</a></li>
			</div>
		<div class="article-list-slide">
				<ul class="article-list">
					<li class="item">
							<!-- 2020 웹접근성 -->
							<a href="${path }/tourSpot/detail" target="_self"  title="페이지 이동">
							
								<div class="thumb" style="width: 100%; height: 210px; background-image: url(../tourSpot/img/산방산유채꽃.png)";>
									</div>
								<div class="infor-element">
									<div class="infor-element-inner">
										<span class="title">산방산
											<img class="arrowpic" style="float:right;" src="../tourSpot/img/nextbutton.png">
										</span>
										<span class="small-text text-dot-d">
											하늘을 깎아세운 만길 봉우리도봉(道峰)산은 이름 그대로 봉우리가 길인 산</span>
										<span class="trip-ico">
											<img src="https://www.tripadvisor.co.kr/img/cdsi/img2/ratings/traveler/5.0-20215-5.svg" alt="평점:5.0">
											<span class="trip-text">21 reviews</span>
										</span>
										<span class="view"></span>
										
									</div>
								</div>
							</a>
						</li>
					<li class="item">
							<!-- 2020 웹접근성 -->
							<a href="/nature/청계천_/34" target="_self"  title="페이지 이동">
							
								<div class="thumb" style="width: 100%; height: 210px; background-image: url(../tourSpot/img/산방산유채꽃.png)">
									</div>
								<div class="infor-element">
									<div class="infor-element-inner">
										<span class="title">유채꽃</span>
										<span class="small-text text-dot-d">
											600년 서울의 역사가 하천의 물길 속으로 종로구와 중구 사이를 가르는 10.84km의 하천. 600년 수도 서울이 가지는 역사이기도 하고, 서울 시민 개개인이 가진 소소한 추억이기도 하다.</span>
										<span class="trip-ico">
											<img src="https://www.tripadvisor.co.kr/img/cdsi/img2/ratings/traveler/4.5-20215-5.svg" alt="평점:4.5">
											<span class="trip-text">3948 reviews</span>
										</span>
										<span class="view"></span>
									</div>
								</div>
							</a>
						</li>
					<li class="item">
							<!-- 2020 웹접근성 -->
							<a href="/nature/남산공원_/3633" target="_self"  title="페이지 이동">
							
								<div class="thumb" style="background-image:url(../tourSpot/img/산방산유채꽃.png)">
									</div>
								<div class="infor-element">
									<div class="infor-element-inner">
										<span class="title">남산공원</span>
										<span class="small-text text-dot-d">
											남산공원은 서울에 있는 공원 중에서 가장 넓은 시민공원이다. 크게 장충지구와 예장지구, 회현지구, 한남지구로 나눌 수 있다.</span>
										<span class="trip-ico">
											<img src="https://www.tripadvisor.co.kr/img/cdsi/img2/ratings/traveler/4.5-20215-5.svg" alt="평점:4.5">
											<span class="trip-text">2211 reviews</span>
										</span>
										<span class="view"></span>
									</div>
								</div>
							</a>
						</li>
					<li class="item">
							<!-- 2020 웹접근성 -->
							<a href="/nature/한강_/15060" target="_self"  title="페이지 이동">
							
								<div class="thumb" style="background-image:url(../tourSpot/img/산방산유채꽃.png)">
									</div>
								<div class="infor-element">
									<div class="infor-element-inner">
										<span class="title">한강</span>
										<span class="small-text text-dot-d">
											한강은 서울에서 가장 중요한 지표로 도시를 남과 북으로 나눈다. 강변 양쪽으로 공원이나 다른 휴양시설이 다양해 자전거를 즐기거나, 크루즈를 타거나, 조류 관찰을 하기에도 알맞다.</span>
										<span class="trip-ico">
											<img src="https://www.tripadvisor.co.kr/img/cdsi/img2/ratings/traveler/4.5-20215-5.svg" alt="평점:4.5">
											<span class="trip-text">1568 reviews</span>
										</span>
										<span class="view"></span>
									</div>
								</div>
							</a>
						</li>
					<li class="item">
							<!-- 2020 웹접근성 -->
							<a href="/nature/북한산국립공원_/369" target="_self"  title="페이지 이동">
							
								<div class="thumb" style="background-image:url(../tourSpot/img/산방산유채꽃.png)">
									</div>
								<div class="infor-element">
									<div class="infor-element-inner">
										<span class="title">북한산국립공원</span>
										<span class="small-text text-dot-d">
											1년 내내 새 코스를 발견하는 재미북한산국립공원은 산성 주능선, 우이능선, 비봉능선, 형제능선, 의상능선, 진달래능선 등 수많은 능선과 계곡이 펼쳐져 있어 1년 내내 오르내려도 늘 새롭다. </span>
										<span class="trip-ico">
											<img src="https://www.tripadvisor.co.kr/img/cdsi/img2/ratings/traveler/4.5-20215-5.svg" alt="평점:4.5">
											<span class="trip-text">1094 reviews</span>
										</span>
										<span class="view"></span>
									</div>
								</div>
							</a>
						</li>
					<li class="item">
							<!-- 2020 웹접근성 -->
							<a href="/nature/여의도-공원_/2161" target="_self"  title="페이지 이동">
							
								<div class="thumb" style="background-image:url(../tourSpot/img/산방산유채꽃.png)">
									</div>
								<div class="infor-element">
									<div class="infor-element-inner">
										<span class="title">여의도 공원 </span>
										<span class="small-text text-dot-d">
											여의도 공원은 서울 영등포구 여의도동에 위치한 시민공원이다. </span>
										<span class="trip-ico">
											<img src="https://www.tripadvisor.co.kr/img/cdsi/img2/ratings/traveler/4.5-20215-5.svg" alt="평점:4.5">
											<span class="trip-text">706 reviews</span>
										</span>
										<span class="view"></span>
									</div>
								</div>
							</a>
						</li>
					<li class="item">
							<!-- 2020 웹접근성 -->
							<a href="/nature/올림픽공원_/2139" target="_self"  title="페이지 이동">
							
								<div class="thumb" style="background-image:url(../tourSpot/img/산방산유채꽃.png)">
									</div>
								<div class="infor-element">
									<div class="infor-element-inner">
										<span class="title">올림픽공원</span>
										<span class="small-text text-dot-d">
											서울올림픽을 기념하며 올림픽공원은 서울올림픽을 기념해 조성한 공원이다. 1984년에 2년 후의 아시안게임과 4년 후의 올림픽을 앞두고 공사를 시작했다. </span>
										<span class="trip-ico">
											<img src="https://www.tripadvisor.co.kr/img/cdsi/img2/ratings/traveler/4.5-20215-5.svg" alt="평점:4.5">
											<span class="trip-text">706 reviews</span>
										</span>
										<span class="view"></span>
									</div>
								</div>
							</a>
						</li>
					<li class="item">
							<!-- 2020 웹접근성 -->
							<a href="/nature/여의도-한강공원소녀시대숲_/12993" target="_self"  title="페이지 이동">
							
								<div class="thumb" style="background-image:url(../tourSpot/img/산방산유채꽃.png)">
									</div>
								<div class="infor-element">
									<div class="infor-element-inner">
										<span class="title">여의도 한강공원(소녀시대숲)</span>
										<span class="small-text text-dot-d">
											여의도 한강공원에는 다양한 k-pop 아이돌 그룹들의 이름을 따 팬들이 기부한 돈으로 조성된 숲들이 있다. </span>
										<span class="trip-ico">
											<img src="https://www.tripadvisor.co.kr/img/cdsi/img2/ratings/traveler/4.5-20215-5.svg" alt="평점:4.5">
											<span class="trip-text">643 reviews</span>
										</span>
										<span class="view"></span>
									</div>
								</div>
							</a>
						</li>
					</ul>
			</div>
			<!-- paging -->
			<nav aria-label="Page navigation example" style="left: 45%; position:relative;">
			  <ul class="pagination">
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li class="page-item"><a class="page-link" href="#">1</a></li>
			    <li class="page-item"><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
			
</section>
	</form>
</div>
  
  </div>
    <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="${path}/index/vendor/jquery/jquery.min.js"></script>
  <script src="${path}/index/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
</body>
</html>