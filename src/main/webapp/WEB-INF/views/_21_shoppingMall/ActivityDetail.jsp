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
	href="<c:url value='/_00_util/shoppingMallUtil/css/shoppingMallLayout.css'></c:url>">


<title>商城活動快訊詳細</title>
</head>
<body>
	<!--內嵌header  -->
	<div
		style="position: fixed; width: 100%; background-color: rgba(155, 146, 146, 0.705); top: 0px; z-index: 5;">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>

	<!-- 搜尋 ----------------------------------------------------------------------------->
	<div class="BodyPosition">
		<jsp:include
			page="/WEB-INF/views/_00_util/shoppingMallUtil/jsp/search.jsp" />

		<!-- 優惠標題 -->
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="title">
						<!-- 日期 -->
						<div class="float-left">
							<div class="date">2021/01/01</div>
						</div>
						<!-- 優惠內容 -->
						<div class="float-left ">
							<div>新春特惠，全館免運!</div>
						</div>
						<div class="clear-block"></div>
					</div>

				</div>
			</div>
			<!--內容-->

			<div class="row">
				<div class="col-12">
					<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
						class="w-100">
					<div>
						一年復始，萬象更新!<br> 歡慶新的一年~ <br> 本商城全館免運~<br>
						請大家把握機會，趕快下訂喔 ^^<br>
					</div>
				</div>
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