<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	href="<c:url value='/_00_util/shoppingMallUtil/css/shoppingMallLayout.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/shoppingMallUtil/css/shoppingMallColor.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/shoppingMallUtil/css/shoppingMallFont.css'></c:url>">

<!-- --------------------------------------------------------------------------------------------------------->

<title>商品詳細</title>

<style>
.imageFrame {
	height: 400px; /*can be anything*/
	width: 400px; /*can be anything*/
	position: relative;
	overflow: hidden;
}

.imageFrame img {
	transform: scale(1, 1);
	transition: all 1s ease-out;
}

.imageFrame img:hover {
	transform: scale(1.2, 1.2);
}

#img {
	max-height: 100%;
	max-width: 100%;
	width: auto;
	height: auto;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
}

/* .imageFrame { */
/* 	width: 600px; */
/* 	height: 600px; */
/* 	overflow: hidden; */
/* } */
#container_MerchandiseDetail{
	max-width:1000px; 
}


</style>

</head>
<body>
	<!--header--------------------------------------------------------------------------->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<!-----------定位----------------------------------------------------------------------------->
	<div class="BodyPosition">
		<!-- 搜尋 ----------------------------------------------------------------------------->
		<jsp:include
			page="/WEB-INF/views/_00_util/shoppingMallUtil/jsp/search.jsp" />
		<!------------------------------------------------------------------------------------------->

		<div class="container" id="container_MerchandiseDetail">
			<!-- 上方 ------------------------------------------------------------------------------------>

			<form:form method='POST' modelAttribute='itemBean'
				action="${pageContext.request.contextPath}/shoppingCart/addQty/${itemBean.itemId}">
				<!-- 			增加陰影效果 -->
				<div class="shadow p-3 mb-5 bg-body rounded">
					<div class="row above">
						<div class="col-12 col-md-6">
							<div class="imageFrame">
								<img id="img" src="/upload/${itemBean.itemPic2}" class="w-100">
							</div>
						</div>
						<div class="col-12 col-md-6">
							<div style="line-height: 2.5;">
								<h2>${itemBean.itemHeader}</h2>
								商品描述 : ${itemBean.itemDes}<br> <br> 商品售價
								:${itemBean.itemPrice}元<br> 庫存數量 : ${itemBean.itemQty}<br>
								代購國家 : ${itemBean.countryBean.countryName}<br> 請選擇數量 : <select
									name="qty" class="form-select"
									aria-label="Default select example">
									<!-- 							<option  selected="selected" value="-1">請選擇數量</option> -->
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">6</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select> <br> <br>

								<%-- 						<c:if test="${mPid==2||mPid==1}"> --%>
								<%-- 							<form action="${pageContext.request.contextPath}/shoppingCart/add/${item.itemId}" method="post"> --%>
								<button type="submit" id="like" class="btn btn-primary btn-lg">
									加入購物車</button>
								<%-- 								onchange="newQtyChange(${cart.sc_Id},${vs.index},${cart.itemBean.itemId},${cart.memberBean.mId})"/> --%>
								<%-- 								onchange="this.form.submit()" --%>
								<!-- 						顯示:綁識別字串 -->
								<!-- 						數量修改靠js -->
								<%-- 						</form> --%>
								<%-- 						</c:if> --%>

								<button id="saleType" class="btn btn-secondary btn-lg" disabled>完售</button>
								<br> <br>
								<!-- 						<select> -->
								<!-- 							<option selected="selected" value="">請選擇付款方式</option> -->
								<!-- 							<option value="1">貨到付款</option> -->
								<!-- 							<option value="2">超商取貨付款</option> -->
								<!-- 							<option value="3">信用卡付款</option> -->
								<!-- 						</select> <br> -->
								<%-- 						<form:form method='POST' modelAttribute='ordBean'> --%>
								<%-- 							<form:select path="shipTypeTId" class="custom-select"> --%>
								<%-- 								<form:option value="-1" label="請選擇寄送方式" /> --%>
								<%-- 								<form:options items="${ship_TypeMap}" /> --%>
								<%-- 							</form:select> --%>
								<!-- 							<br> -->
								<%-- 							<form:select path="receiptTypeTId" class="custom-select"> --%>
								<%-- 								<form:option value="-1" label="請選擇發票型式" /> --%>
								<%-- 								<form:options items="${receipt_TypeMap}" /> --%>
								<%-- 							</form:select> --%>
								<%-- 						</form:form> --%>
							</div>
						</div>
					</div>
				</div>
			</form:form>
			<!-- 下方 ----------------------------------------------------------------------------------->
			<%-- 購買資訊分頁的按鈕-------------------------------------------------------------------  --%>
			<div style="height: 50px"></div>
			<div class="row">
				<!-- 			<div class="col-2"></div> -->
				<div class="col-12">
					<div class="shadow p-3 mb-5 bg-body rounded">
						<nav id="navbar-example2"
							class="navbar navbar-light bg-light px-3">
							<a class="navbar-brand" href="#"></a>
							<ul class="nav nav-pills">
								<li class="nav-item"><a class="nav-link"
									href="<c:url value="/aboutMerchandise"/>">關於商品資訊</a></li>
								<li class="nav-item"><a class="nav-link" href="#des">商品描述</a></li>
								<li class="nav-item"><a class="nav-link" href="#fb">查看商品留言</a></li>
								<li class="nav-item"><a class="nav-link" href="#addFb">新增商品留言</a></li>
							</ul>
						</nav>
						<%-- 商品資訊------------------------------------------------------- -----------------------%>
						<div data-bs-spy="scroll" data-bs-target="#navbar-example2"
							data-bs-offset="0" tabindex="0">
							<div class="ItemInformationContent">
								<span class="title"> ${itemBean.itemHeader} </span>
								<!-- 商品圖片-------------------------------------------------------- -->
								<!-- 						<img src="https://fakeimg.pl/350x350/?text=World&font=lobster" -->
								<!-- 							class="w-100"> -->


								<!-- 							圖片輪播 -->
								<div id="carouselExampleIndicators" class="carousel slide"
									data-bs-ride="carousel">
									<div class="carousel-indicators">
										<button type="button"
											data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="0" class="active" aria-current="true"
											aria-label="Slide 1"></button>
										<button type="button"
											data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="1" aria-label="Slide 2"></button>
										<button type="button"
											data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="2" aria-label="Slide 3"></button>
									</div>
									<div class="carousel-inner">
										<div class="carousel-item active">
											<img src="/upload/${itemBean.itemPic1}" class="d-block w-100"
												alt="...">
										</div>
										<div class="carousel-item">
											<img src="/upload/${itemBean.itemPic2}" class="d-block w-100"
												alt="...">
										</div>
										<div class="carousel-item">
											<img src="/upload/${itemBean.itemPic3}" class="d-block w-100"
												alt="...">
										</div>
									</div>
									<button class="carousel-control-prev" type="button"
										data-bs-target="#carouselExampleIndicators"
										data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button"
										data-bs-target="#carouselExampleIndicators"
										data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</button>
								</div>
								<div id="des" style="height: 50px"></div>
								<h3>商品敘述</h3>
								<!-- 商品敘述-------------------------------------------------------- -->
								<div>${itemBean.itemDes}</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 加入購物車 --------------------------------------------------------------------------------->
				<!-- 				<div class="row"> -->
				<!-- 					<div class="col-12"> -->
				<!-- 						<select class="form-select" -->
				<!-- 							aria-label="Example select with button addon"> -->
				<!-- 							<option selected>請選擇商品數量</option> -->
				<!-- 							<option value="1">1</option> -->
				<!-- 							<option value="2">2</option> -->
				<!-- 							<option value="3">3</option> -->
				<!-- 						</select> -->
				<!-- 						<button class="btn btn-outline-secondary" type="button" -->
				<!-- 							onclick="window.open('ShoppingCart')">加入購物車</button> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
			</div>
			<!-- 			<div class="col-2"></div> -->
			<br>
			<div id="fb" style="height: 30px"></div>
			<div class="shadow p-3 mb-5 bg-body rounded">
				<h3>${itemBean.itemHeader}商品留言 :</h3>

				<div style="text-align: right;">
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<span>現在時間 : <fmt:formatDate type="both" dateStyle="long"
							timeStyle="long" value="${now}" /></span>
				</div>
				<br>
				<div class="overflow-auto"
					style="height: 500px; line-height: 2.5;">
					<c:forEach var='feedback' items='${feedbacks}'>
						<div class="container-fluid">
							<div class="row R_SpCre">
								<div class="col col-2-1 C_SpCre">
									<div class="shadow-sm p-3 mb-5 bg-body rounded">
										<c:set var="fbCreateTime" value="${feedback.f_createTime}" />
										<fmt:formatDate type="both" dateStyle="long"
											timeStyle="medium" value="${fbCreateTime}" />
										<br> 商品留言 : ${feedback.feedbackText}<br>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<div id="addFb" style="height: 50px"></div>
			<div class="shadow p-3 mb-5 bg-body rounded">
				<c:if test="${ mPid != 2 && mPid != 1 }">
					<div>
						<button type="submit" id="login" class="btn btn-primary btn-lg"
							onclick="location.href='${pageContext.request.contextPath}/login'">登入即可留言</button>
					</div>
				</c:if>


				<c:if test="${ mPid == 2 || mPid == 1 }">
					<h3>${itemBean.itemHeader}新增商品留言 :</h3>
					<form:form method='POST' modelAttribute='feedbackBean'>
						<div class="form-group row">
							<label for="feedbackText" class="col-sm-2 col-form-label"></label>
							<div class="col-sm-10">
								<form:textarea type="text" path="feedbackText"
									class="form-control" style="padding-bottom: 40px;"
									id="feedbackText" />
							</div>
						</div>
						<div class="form-group row  d-flex justify-content-end mt-5">
							<div style="text-align: center;">
								<button type="submit" id="editM" class="btn btn-primary btn-lg"
									onclick="location.href='/merchandiseDetail/Id=${item.itemId}'">新增留言</button>
							</div>
						</div>
					</form:form>
				</c:if>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>
</html>
