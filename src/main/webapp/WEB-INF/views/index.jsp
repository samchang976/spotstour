<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="SYSTEM" class="_00_init.util.GlobalService" scope="application"/> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:set var="AppName" value="${SYSTEM.systemName}" scope="application" />
<title>${AppName}</title>


<!-- css連結-------------------------------------------------------------------------------- -->
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/utilLayout.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/utilFont.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/utilColor.css'></c:url>">


<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<%--   <link href="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet"> --%>

<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">

<!-- -------------------------------------------------------------------------------------- -->
<style>
.jarallax {
	position: relative;
	z-index: 0;
	height: 800px;
	margin: none;
}

.jarallax>.jarallax-img {
	position: absolute;
	object-fit: cover;
	/* support for plugin https://github.com/bfred-it/object-fit-images */
	font-family: 'object-fit: cover;';
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: -1;
}

html, body {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}

/* 	#video2 { */
/* 	width: 1300px; */
/* } */
/* 搜尋框=============================== */
input[type="text"] {
	background: rgba(0, 0, 0, 0.1);
	width: 400px;
	position: relative;
	margin: auto;
	font-size: 25px;
	border: 1px solid grey;
}

input[type="text"]:hover {
	border: 2px solid white;
	background: white;
}

input[type="text"]::Placeholder {
	color: grey;
}

#search {
	border: 1.5px solid grey;
}

#gotop {
	position: fixed;
	z-index: 90;
	right: 30px;
	bottom: 31px;
	display: none;
	width: 50px;
	height: 50px;
	color: #fff;
	opacity: 0.4;
	background: #333333;
	line-height: 50px;
	border-radius: 50%;
	cursor: pointer;
	text-align: center;
	transition: all 0.5s;
	-webkit-transition: all .5s;
	-moz-transition: all .5s;
	/* 	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 */
	/* 		rgba(0, 0, 0, 0.12); */
}

#gotop :hover {
	opacity: 1; /* 透明度 */
	/* 	background: #3641C1; */
	/* 	background: #888888; */
}

#Top {
	padding: 0px 5px;
	background: grey;
	color: white;
	border-radius: 10%;
	box-sizing: content-box;
}

h4 {
	color: white;
}

.IntroductionLink {
	display: flex;
	flex-direction: column;
	justify-content: space-around;
}

.IntroductionLink .cta-btn {
	display: block;
	text-align: center;
	text-decoration: none;
}

#underline {
	width: 200px;
	/* height: 50px;  */
	/* background: #ddd;  */
	/* margin: 20px;  */
	position: relative;
	cursor: crosshair;
}

#underline:after {
	content: "";
	width: 0;
	height: 3px;
	background: orange;
	position: absolute;
	top: 100%;
	left: 50%;
	transition: all .8s;
}

#underline:hover:after {
	left: 0%;
	width: 100%;
}
.seeVedio{
z-index: 50;
border:none;
}

</style>
</head>
<body>
	<!--header=================================================================================  -->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<!-------------------------------------------------------------------------------------------->

	<c:set var="funcName" value="IND" scope="session" />

	<%-- 影片輪播============================================================================== --%>
	<!-- 	<div class="o"></div> -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel" style="width: 100%;">
		<!-- 選擇影片的框框 -->
		<ol class=" carousel-indicators">
			<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
				class="active"></li>
			<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
			<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
		</ol>
		<!--影片-->
		<div class="carousel-inner">
			<div id="first" class="carousel-item active">
				<video
					src="${pageContext.request.contextPath}/videos/Birmingham.mp4"
					class="d-block w-100" autoplay loop muted></video>
			</div>
			<div class="carousel-item">
				<video src="${pageContext.request.contextPath}/videos/Bristol.mp4"
					class="d-block w-100" autoplay loop muted></video>
			</div>
			<div class="carousel-item">
				<video src="${pageContext.request.contextPath}/videos/Calgary.mp4"
					class="d-block w-100" autoplay loop muted></video>
			</div>
		</div>
		<!--左右切換的按鈕------------------------------------------------------------------  -->
		<!-- 		<a class="carousel-control-prev" href="#carouselExampleIndicators" -->
		<!-- 			role="button" data-bs-slide="prev"> <span -->
		<!-- 			class="carousel-control-prev-icon" aria-hidden="true"></span> <span -->
		<!-- 			class="visually-hidden">Previous</span> -->
		<!-- 		</a> 
			<a class="carousel-control-next" href="#carouselExampleIndicators" -->
		<!-- 			role="button" data-bs-slide="next"> <span -->
		<!-- 			class="carousel-control-next-icon" aria-hidden="true"></span> <span -->
		<!-- 			class="visually-hidden">Next</span> -->
		<!-- 		</a> -->
	</div>
	<%-- ============================================================================================================== --%>
	<div class="overlay">
		<p>SPOTS-TOUR</p>

		<!-- 						servlet讀取前端畫面資料寫法 -->
		<!-- 						<form class="d-flex" action="PortfolioSearchServlet" method="get"> -->
		<!-- 							<input class="form-control me-2" type="text" name="searchword"  -->
		<!-- 								placeholder="Search" aria-label="Search"> -->
		<!-- 							<button class="btn btn-outline-success" type="submit"> -->
		<!-- 								<i class="fas fa-search"></i> -->
		<!-- 							</button> -->
		<!-- 						</form> --
						<!-- 							spring MVC讀取前端畫面資料寫法 -->
		<%-- 						<form:form method="GET"  --%>
		<%-- 							class="d-flex" action="/SearchResult" modelAttribute="ContinentBean"> --%>
		<%-- 							<form:input class="form-control me-2" type="text" path="searchWord" --%>
		<%-- 								placeholder="Search" aria-label="Search" /> --%>
		<!-- 							<button class="btn btn-outline-success" type="submit"> -->
		<!-- 								<i class="fas fa-search"></i> -->
		<!-- 							</button> -->
		<%-- 						</form:form> --%>
		<%-- 搜尋欄	=================================================================================================================	 --%>
		<form class="d-flex" action="SearchResult" method="get">
			<input class="form-control me-2" type="text" name="searchWord"
				placeholder="Spots Go" aria-label="Search">
			<button class="btn btn-outline-secondary" id="search" type="submit">
				<!-- 				<i class="fas fa-search"></i> -->
				GO
			</button>
		</form>
	</div>

	<!-- Background Self-Hosted Video Parallax -->
	<div class="jarallax" id="video2" data-speed="1.2"
		data-type="scroll-opacity"
		data-jarallax-video="mp4:${pageContext.request.contextPath}/videos/taipei.mp4">
	</div>

	<!-- ======= Why Us Section ======= -->
	<section id="why-us" class="why-us">
		<div class="container">
			<div class="my-3">
				<h2 id="Top" class="d-inline-block fw-bold">TOP</h2>
				<h2 class="d-inline-block">熱門影片</h2>
			</div>
			<div class="row">
			<c:forEach items="${hotList}" var="row">
				<div class="col-lg-4 my-3" data-aos="fade-up">
					<div class="box">
							<form class=" position-absolute start-1 seeVedio" action="portfolioPlay" method="get">
								<input class="form-control me-2" type="hidden" name="portfolioId"
									value="${row.portfolioId}">
								<button class="btn" id="search" type="submit" style="border: none;box-shadow:none;
								">
<!-- 									<i class="fas fa-search"></i> -->
									<span>${row.portfolioName}</span>	
								</button>
							</form>	
<%-- 						<form class="d-flex rightStyle" action="portfolioPlay" method="get"> --%>
<!-- 							<input class="form-control me-2" type="hidden" name="portfolioId" -->
<%-- 							value="${row.portfolioId}"> --%>
<!-- 							<button class="btn btn-outline-secondary" id="search" type="submit"> -->
<!-- 							<i class="fas fa-search"></i> -->
<!-- 							</button> -->
<%-- 						</form>	 --%>
						<video poster="/upload${row.videoPic}" class="w-100" autoplay>
								<source src="/uploadv${row.videoFile}" type="video/mp4">
						</video>
<%-- 						<div style="text-align: right;">觀看次數:${row.iccount}次</div> --%>
					</div>
				</div>
			</c:forEach>
<!-- 				<div class="col-lg-4 mt-4 mt-lg-0" data-aos="fade-up" -->
<!-- 					data-aos-delay="150"> -->
<!-- 					<div class="box"> -->
<!-- 						<span>02</span> -->
<!-- 						<h4>Repellat Nihil</h4> -->
<!-- 						<p>Dolorem est fugiat occaecati voluptate velit esse. Dicta -->
<!-- 							veritatis dolor quod et vel dire leno para dest</p> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="col-lg-4 mt-4 mt-lg-0" data-aos="fade-up" -->
<!-- 					data-aos-delay="300"> -->
<!-- 					<div class="box"> -->
<!-- 						<span>03</span> -->
<!-- 						<h4>Ad ad velit qui</h4> -->
<!-- 						<p>Molestiae officiis omnis illo asperiores. Aut doloribus -->
<!-- 							vitae sunt debitis quo vel nam quis</p> -->
<!-- 					</div> -->
<!-- 				</div> -->

			</div>
		</div>
	</section>
	<!-- End Why Us Section -->

	<!-- Background Self-Hosted Video Parallax -->
	<div class="jarallax" id="video3" data-speed="1.2"
		data-type="scroll-opacity" style="text-align: right;"
		data-jarallax-video="mp4:${pageContext.request.contextPath}/videos/Morelia.mp4">
	</div>

	<!-- ======= Cta Section ======= -->
	<section id="cta" class="cta">
		<div class="container" data-aos="zoom-in">

			<div class="row">
				<div class="col-12 ">
					<h3 class="text-center">關於我們</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-10">
					<div>
						<h4 id="underline">
							<i class="fab fa-youtube mx-3"></i> 觀賞影片
						</h4>
						<p>spots-tourer們可以即時分享各個景點資訊， 記錄自己的拍攝影作品，也可以評論或收藏 別人的分享的景點資訊。
							方便的搜尋方式讓tourer們可以快速 找到想瀏覽的景點影片、 資訊以及景點瀏覽紀錄。</p>
						<h4 id="underline">
							<i class="fas fa-shopping-cart mx-3"></i> 代購商城
						</h4>
						<p>想買購買國內買不到其他國家的特色商品嗎? 我們提供代購的服務， 收集來自世界各地的食品、生活家居、
							美妝保養、家電3C以及服飾配件等商品 來滿足大家旺盛的購物需求!</p>
					</div>

				</div>
				<!--         	onclick="location.href='merchandiseSearchResult/Id=2'" -->
				<div class="col-2 IntroductionLink">
					<a class="cta-btn" href="<c:url value="/"/>">觀賞影片</a> <a
						class="cta-btn" href="<c:url value="/merchandiseIndex"/>">購物商城</a>
					<a class="cta-btn" href="<c:url value="/aboutUs"/>">關於我們</a>
				</div>
			</div>

		</div>
	</section>
	<!-- End Cta Section -->

	<!-- Background YouTube Parallax -->
	<div class="jarallax" id="video4" data-speed="1.2"
		data-type="scroll-opacity"
		data-jarallax-video="https://www.youtube.com/watch?v=Sm17ps5kXJs">
	</div>


	<!-- 	<!-- Background Vimeo Parallax -->
	<!-- 	<div class="jarallax" id="video5" data-speed="0.2" -->
	<!-- 		data-type="scroll-opacity" -->
	<!-- 		data-jarallax-video="https://vimeo.com/110138539"></div> -->



	<%-- =================下面有佔空間，白色的區塊======================================================================== --%>
	${registerOK} ${Login} ${FlashMSG_farewell} ${SUCCESS}
	${param.message}${MsgOK.InsertOK}

	<%
		session.removeAttribute("MsgOK");
	session.removeAttribute("registerOK");
	session.removeAttribute("Login");
	session.removeAttribute("SUCCESS");
	%>

	<!-- ======= About Section ======= -->
	<section id="about" class="about">
		<div class="container">

			<div class="row">
				<div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left">
					<img src="assets/img/about.jpg" class="img-fluid" alt="">
				</div>
				<div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content"
					data-aos="fade-right">
					<h3>參考的網站及資料來源</h3>
					<p class="font-italic"></p>
					<ul>
						<li><i class="bi bi-check-circle"></i> Bootstrap</li>
						<li><i class="bi bi-check-circle"></i> Unsplash</li>
						<li><i class="bi bi-check-circle"></i> Font Awesome</li>
						<li><i class="bi bi-check-circle"></i> PowerDirector</li>
<!-- 						<li><i class="bi bi-check-circle"></i> Font Awesome</li> -->
					</ul>
					<p></p>
				</div>
			</div>

		</div>
	</section>
	<!-- End About Section -->

	<div id="gotop">
		<i class="fa fa-angle-up"></i>
	</div>


	<!--   <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a> -->
	<!--   <div id="preloader"></div> -->



	<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
	<!-- Jarallax -->
	<script src="https://unpkg.com/jarallax@1/dist/jarallax.min.js"></script>

	<!-- Include it if you want to use Video parallax -->
	<script src="https://unpkg.com/jarallax@1/dist/jarallax-video.min.js"></script>
	<!-- --------------------------------------------------------------------------------------->



	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$.extend($.easing, {
				easeOutExpo : function(x, t, b, c, d) {
					return (t == d) ? b + c : c
							* (-Math.pow(2, -10 * t / d) + 1) + b;
				}
			});
			/* 按下GoTop按鈕時的事件 */
			$('#gotop').click(function() {
				$('html,body').animate({
					scrollTop : 0
				}, 'easeOutExpo'); /* 返回到最頂上 */
				return false;
			});

			/* 偵測卷軸滑動時，往下滑超過400px就讓GoTop按鈕出現 */
			$(window).scroll(function() {
				if ($(this).scrollTop() > 400) {
					$('#gotop').fadeIn();
				} else {
					$('#gotop').fadeOut();
				}
			});
		});
	</script>

	<!-- Vendor JS Files -->
	<script
		src="${pageContext.request.contextPath}/assets/vendor/aos/aos.js"></script>
	<%--   <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> --%>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/php-email-form/validate.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.js"></script>

	<!-- Template Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


</body>
</html>
