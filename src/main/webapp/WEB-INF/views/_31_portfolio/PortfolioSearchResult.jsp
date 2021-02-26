<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags------------------------------------------------------------------------------------- -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS ----------------------------------------------------------------------------------------- -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- icon cdn----------------------------------------------------------------------------------------------- -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- css連結------------------------------------------------------------------------------------------------ -->
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/utilLayout.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/shoppingMallUtil/css/portfolioLayout.css'></c:url>">
<title>影片搜尋結果</title>
<!--     <style> 
/*       video{ */
/*           width: 100%; */
/*       } */
/*       a{ */
/*         text-decoration:none; */
/*       } */

  </style> -->
</head>
<body>
	<!--內嵌header  -->
	<div
		style="position: fixed; width: 100%; background-color: rgba(155, 146, 146, 0.705); top: 0px; z-index: 5;">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<!-- serch -->
	<jsp:include
		page="/WEB-INF/views/_00_util/portfolioUtil/PortfolioSearchResult_serch.jsp" />
	<!--     <iframe src="VideoSearchResult_serch.html" frameborder="0" width="100%" height="67px" scrolling ="no" sandbox="allow-top-navigation-by-user-activation"></iframe> -->
	<p></p>

	<div class="container">

		<!--顯示影片清單  -->
		<div class="row row-cols-1 row-cols-md-3 row-cols-lg-4">
			<!--第一個-->
			<div class="col">
				<!-- 發布時間 -->
				<div>${Country1}-${City1}</div>
				<!-- 影片-->
				<video src="/images/a.mp4" controls></video>

				<!--按讚次數-->
				<div id="great">
					<a href="#"> <i class="far fa-thumbs-up"></i>
					</a> <span>103</span> <a href="#"> <i class="far fa-thumbs-down"></i>
					</a> <span>1</span>
				</div>
				<!-- 觀看次數 -->
				<div>觀看次數: 123456次</div>
			</div>
			<!--第二個-->
			<div class="col">
				<!-- 發布時間 -->
				<div>${Country2}-${City2}</div>
				<!-- 影片-->
				<video src="/images/a.mp4" controls></video>
				<!--按讚次數-->
				<div id="great">
					<a href="#"> <i class="far fa-thumbs-up"></i>
					</a> <span>103</span> <a href="#"> <i class="far fa-thumbs-down"></i>
					</a> <span>1</span>
				</div>
				<!-- 觀看次數 -->
				<div>觀看次數: 123456次</div>
			</div>
			<!--第三個-->
			<div class="col">
				<!-- 發布時間 -->
				<div>${Country3}-${City3}</div>
				<!-- 影片-->
				<video src="/images/a.mp4" controls></video>
				<!--按讚次數-->
				<div id="great">
					<a href="#"> <i class="far fa-thumbs-up"></i>
					</a> <span>103</span> <a href="#"> <i class="far fa-thumbs-down"></i>
					</a> <span>1</span>
				</div>
				<!-- 觀看次數 -->
				<div>觀看次數: 123456次</div>
			</div>
			<!--第四個-->
			<div class="col">
				<!-- 發布時間 -->
				<div>${Country4}-${City4}</div>
				<!-- 影片-->
				<video src="/images/a.mp4" controls></video>
				<!--按讚次數-->
				<div id="great">
					<a href="#"> <i class="far fa-thumbs-up"></i>
					</a> <span>103</span> <a href="#"> <i class="far fa-thumbs-down"></i>
					</a> <span>1</span>
				</div>
				<!-- 觀看次數 -->
				<div>觀看次數: 123456次</div>
			</div>
			<!--第五個-->
			<div class="col">
				<!-- 發布時間 -->
				<div>${Country5}-${City5}</div>
				<!-- 影片-->
				<video src="/images/a.mp4" controls></video>
				<!--按讚次數-->
				<div id="great">
					<a href="#"> <i class="far fa-thumbs-up"></i>
					</a> <span>103</span> <a href="#"> <i class="far fa-thumbs-down"></i>
					</a> <span>1</span>
				</div>
				<!-- 觀看次數 -->
				<div>觀看次數: 123456次</div>
			</div>
			<!--第六個-->
			<div class="col">
				<!-- 發布時間 -->
				<div>${Country6}-${City6}</div>
				<!-- 影片-->
				<video src="/images/a.mp4" controls></video>
				<!--按讚次數-->
				<div id="great">
					<a href="#"> <i class="far fa-thumbs-up"></i>
					</a> <span>103</span> <a href="#"> <i class="far fa-thumbs-down"></i>
					</a> <span>1</span>
				</div>
				<!-- 觀看次數 -->
				<div>觀看次數: 123456次</div>
			</div>

		</div>



	</div>



	<!--內嵌footer  -->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>




</body>
</html>