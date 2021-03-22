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
	href="<c:url value='/_00_util/allUtil/css/utilFont.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/utilColor.css'></c:url>">


<link rel="stylesheet"
	href="<c:url value='/_00_util/portfolioUtil/css/portfolioLayout.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/portfolioUtil/css/portfolioFont.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/portfolioUtil/css/portfolioColor.css'></c:url>">

<!-- --------------------------------------------------------------------------------------------------------->

<title>影片搜尋結果</title>
<!--     <style> 
/*       video{ */
/*           width: 100%; */
/*       } */
/*       a{ */
/*         text-decoration:none; */
/*       } */

  </style> -->
  <style type="text/css">
  .rightStyle{
   float: right; 
/*   margin-top: 0px; */
/*   position: absolute; */
/*    text-align: right;    */
/*  border: 1px solid grey;  */
/* width:100%; */
  }
  

  
  
  </style> 
</head>
<body>
	<!--header=================================================================================  -->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<!-----------定位----------------------------------------------------------------------------->
	<div class="BodyPosition">
		<!------------------------------------------------------------------------------------------->
		<div class="container">
			<!--上方-->
			<div class="row">
				<!--搜尋結果-->
				<div class="col-2"></div>
				<!--按鈕  -->
				<div class="col">
					<select class="form-select" aria-label="Default select example">
						<option selected>選擇排序方式</option>
						<option value="time">依時間</option>
						<option value="look">依觀看數次數</option>
						<option value="good">依按讚數</option>
					</select>
				</div>
				<!-- 搜尋--------------------------------------------------------------- -->
				<div class="col">
					<form class="d-flex" action="SearchResult" method="get">
						<input class="form-control me-2" type="text" name="searchWord"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</form>
				</div>
				
			</div>
		</div>
		<p></p>
		
		<div class="container">

			<!--顯示影片清單 ---------------------------------------------------------------- -->
			<div class="row row-cols-1 row-cols-md-3 row-cols-lg-4">
				<!--第一個-->
				<div class="shadow p-3 mb-5 bg-body rounded">
					<c:forEach items="${resultList}" var="row">
						<div class="col">
							<!-- 發布時間 -->
							<div>
<!-- 								地區 -->
								<div>${row.continentName}-${row.countryName}-${row.cityName}</div>
								<form class="d-flex rightStyle" action="PortfolioPlay" method="get">
									<div class="">
										<input class="form-control me-2" type="hidden" name="portfolioId"
										value="${row.portfolioId}">
										<button class="btn btn-outline-secondary" id="search" type="submit">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</form>	
<!-- 								<div class="clearfix"></div>	 -->
							</div>
<!-- 							名稱 -->
							<div>${row.portfolioName}</div>
							<!-- 影片-->
							<video controls poster="/upload${row.videoPic}"
								style="width: 100%; height: auto">
								<source src="/uploadv${row.videoFile}" type="video/mp4">
							</video>
							<!--按讚次數-->
							<div id="great">
								<a href="#"> <i class="far fa-thumbs-up"></i>
								</a> <span>103</span> <a href="#"> <i class="far fa-thumbs-down"></i>
								</a> <span>1</span>
							</div>
							<!-- 觀看次數 -->
							<div>觀看次數: 123456次</div>
						</div>
					</c:forEach>
				</div>
			</div>

		</div>



		<!-----------定位----------------------------------------------------------------------------->
	</div>
	<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
	<!-- --------------------------------------------------------------------------------------->
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<!-- 	<script -->
	<!-- 		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" -->
	<!-- 		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" -->
	<!-- 		crossorigin="anonymous"></script> -->




</body>
</html>