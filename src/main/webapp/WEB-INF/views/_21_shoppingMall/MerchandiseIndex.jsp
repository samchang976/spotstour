<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="SYSTEM" class="_00_init.util.GlobalService" scope="application"/> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- icon cdn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<title>商城首頁</title>

<link rel="stylesheet" href="./01_.css">

</head>

<body>
	<!--內嵌header  -->
<%-- 	<iframe src="${pageContext.request.contextPath}/fragment/header.jsp" --%>
<!-- 		frameborder="0" width="100%" height="67px" scrolling="no" -->
<!-- 		sandbox="allow-top-navigation-by-user-activation"></iframe> -->

	<!-- 搜尋 -->
<%-- 	<iframe src="${pageContext.request.contextPath}/fragment/search.jsp" --%>
<!-- 		frameborder="0" width="100%" height="67px" scrolling="no" -->
<!-- 		sandbox="allow-top-navigation-by-user-activation"></iframe> -->
		
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/header.jsp" />
	
<jsp:include page="/WEB-INF/views/_00_util/shoppingMallUtil/jsp/search.jsp" />

	<!-- 活動快訊 -->
	<div class="container" id="news_container">
		<div class="row">
			<div class="col-12">
				<div id="news-text">活動快訊</div>
				<!-- ------------------------------------------------------- -->
				<div class="block"
					onclick="location.href=
                        '02_ActivityDetail.html'">
					<!-- 日期 -->
					<div class="float-left">
						<div class="date">2021/01/01</div>
					</div>
					<!-- 優惠內容 -->
					<div class="float-left ">
						<div class="discount">新春特惠，全館免運!</div>
					</div>
					<div class="clear-block"></div>
				</div>
				<!--------------------------------------------------------------->
				<div class="block">
					<!-- 日期 -->
					<div class="float-left">
						<div class="date">2021/01/10</div>
					</div>
					<!-- 優惠內容 -->
					<div class="float-left ">
						<div class="discount">新春特惠，全館免運!</div>
					</div>
					<div class="clear-block"></div>
				</div>
				<!--------------------------------------------------------------->

				<div class="block">
					<!-- 日期 -->
					<div class="float-left">
						<div class="date">2021/01/10</div>
					</div>
					<!-- 優惠內容 -->
					<div class="float-left ">
						<div class="discount">新春特惠，全館免運!</div>
					</div>
					<div class="clear-block"></div>
				</div>
				<!--------------------------------------------------------------->

				<div class="block">
					<!-- 日期 -->
					<div class="float-left">
						<div class="date">2021/01/10</div>
					</div>
					<!-- 優惠內容 -->
					<div class="float-left">
						<div class="discount">新春特惠，全館免運!</div>
					</div>
					<div class="clear-block"></div>
				</div>
				<!--------------------------------------------------------------->

				<div class="block">
					<!-- 日期 -->
					<div class="float-left">
						<div class="date">2021/01/10</div>
					</div>
					<!-- 優惠內容 -->
					<div class="float-left ">
						<div class="discount">新春特惠，全館免運!</div>
					</div>
					<div class="clear-block"></div>
				</div>

				<!--------------------------------------------------------------->

				<div class="block">
					<!-- 日期 -->
					<div class="float-left">
						<div class="date">2021/01/10</div>
					</div>
					<!-- 優惠內容 -->
					<div class="float-left ">
						<div class="discount">新春特惠，全館免運!</div>
					</div>
					<div class="clear-block"></div>
				</div>

				<!--------------------------------------------------------------->

				<div class="block">
					<!-- 日期 -->
					<div class="float-left">
						<div class="date">2021/01/10</div>
					</div>
					<!-- 優惠內容 -->
					<div class="float-left ">
						<div class="discount">新春特惠，全館免運!</div>
					</div>
					<div class="clear-block"></div>
				</div>

				<div class="block">
					<!-- 日期 -->
					<div class="float-left">
						<div class="date">2021/01/10</div>
					</div>
					<!-- 優惠內容 -->
					<div class="float-left ">
						<div class="discount">新春特惠，全館免運!</div>
					</div>
					<div class="clear-block"></div>
				</div>
			</div>
		</div>
	</div>



	<!-- ============================================================= -->
	<!-- 地區搜尋 -->
	<div class="container" id="area_search">
		<div class="row g-5">
			<c:if test="${not empty itemHeader1}">
				<div class="col-12 col-md-3">
					<div>名稱 : ${itemHeader1}</div>
					<div>
						<a href="03_MerchandiseSearchResult.html"> <img
							src="https://fakeimg.pl/350x350/?text=World&font=lobster"
							class="w-100">
						</a>
					</div>
					<div>價錢 : ${itemPrice1}</div>
					<div>產地 : ${countryId1}</div>
					<div>剩餘數量 : ${itemQty1}</div>
					<div>剩餘數量 : ${count}</div>
				</div>
			</c:if>

			<c:if test="${not empty itemHeader2}">
				<div class="col-12 col-md-3">
					<div>名稱 : ${itemHeader2}</div>
					<div>
						<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
							class="w-100">
					</div>
					<div>價錢 : ${itemPrice2}</div>
					<div>產地 : ${countryId2}</div>
					<div>剩餘數量 : ${itemQty2}</div>
				</div>
			</c:if>

			<c:if test="${not empty itemHeader3}">
				<div class="col-12 col-md-3">
					<div>名稱 : ${itemHeader3}</div>
					<div>
						<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
							class="w-100">
					</div>
					<div>價錢 : ${itemPrice3}</div>
					<div>產地 : ${countryId3}</div>
					<div>剩餘數量 : ${itemQty3}</div>
				</div>
			</c:if>

			<c:if test="${not empty itemHeader4}">
				<div class="col-12 col-md-3">
					<div>名稱 : ${itemHeader4}</div>
					<div>
						<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
							class="w-100">
					</div>
					<div>價錢 : ${itemPrice4}</div>
					<div>產地 : ${countryId4}</div>
					<div>剩餘數量 : ${itemQty4}</div>
				</div>
			</c:if>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/footer.jsp" />

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>
</html>