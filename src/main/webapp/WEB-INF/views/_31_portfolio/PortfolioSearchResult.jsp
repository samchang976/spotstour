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
  

  #search:hover{
  color: orange;
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
				<div class="col-3"></div>
				<!--按鈕  -->
				<div class="col">
					<select class="form-select" aria-label="Default select example" onChange="location = this.options[this.selectedIndex].value;" >
						<option selected>選擇排序方式</option>
						<option value="${pageContext.request.contextPath}/SearchResult?searchWord=${searchWord}&param=1">依新到舊時間排序</option>
						<option value="${pageContext.request.contextPath}/SearchResult?searchWord=${searchWord}&param=2">依舊到新時間排序</option>
						<option value="${pageContext.request.contextPath}/SearchResult?searchWord=${searchWord}&param=3">依觀看數次數排序</option>
						<option value="${pageContext.request.contextPath}/SearchResult?searchWord=${searchWord}&param=4">依按讚數排序</option>
					</select>
				</div>
				<!-- 搜尋--------------------------------------------------------------- -->
				<div class="col ">
					<form class="d-flex" action="SearchResult" method="get">
						<input class="form-control me-2" type="text" name="searchWord"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">
							<i class="fas fa-search "></i>
						</button>
					</form>
				</div>
				
			</div>
		</div>
		
		<div class="container">

			<!--顯示影片清單 ---------------------------------------------------------------- -->
				<div class="shadow p-3 mb-5 bg-body rounded">
			<div class="row row-cols-1 row-cols-md-3 row-cols-lg-4">
					<c:forEach items="${resultList}" var="row">
						<div class="col">
							<!-- 發布時間 -->
							<div>
							<!-- 地區 -->
								<div class="float-start">
									<form  action="portfolioPlay" method="get">
											<input class="form-control me-2" type="hidden" name="portfolioId"
												value="${row.portfolioId}">
											<input class="form-control me-2" type="hidden" name="countryId"
												value="${row.countryId}">
											<button class="btn fs-6" id="search" type="submit" style="box-shadow:none;">
<!-- 												<i class="fas fa-search"></i> -->
													<!-- 名稱 -->${row.portfolioName}
											</button>
									</form>	
								</div>
								<div class="float-end p-3">${row.continentName}-${row.countryName}-${row.cityName}</div>
								<div class="float-none"></div>
<!-- 								<div class="clearfix"></div>	 -->
							</div>
							
							
							<!-- 影片-->
							<video controls poster="/upload${row.videoPic}" class="w-100">
								<source src="/uploadv${row.videoFile}" type="video/mp4">
							</video>
							
							<!--按讚次數-->
							<div id="great" class="float-start">
								<a href="#"> <i class="far fa-thumbs-up"></i></a> 
								<span><c:if test="${row.gcount==null}">0</c:if><c:if test="${row.gcount!=null}">${row.gcount}</c:if></span> 
								
								<a href="#"> <i class="far fa-thumbs-down"></i></a> 
								<span><c:if test="${row.bcount==null}">0</c:if><c:if test="${row.bcount!=null}">${row.bcount}</c:if></span>
							</div>
							
							<!-- 觀看次數 -->
							<div class="float-end">觀看次數: <c:if test="${row.vcount==null}">0</c:if><c:if test="${row.vcount!=null}">${row.vcount}</c:if>次</div>
							<div class="float-none"></div>
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