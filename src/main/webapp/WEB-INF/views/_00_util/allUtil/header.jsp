<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>header</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
	crossorigin="anonymous" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">

<style>
/*         body{ */
/*         	height: 200px; */
/*             background: rgb(208, 199, 199); */
/*         } */
a, i {
	text-decoration: none;
	color: #000;
	font-size: 12px;
}

a, i:hover {
	color: #ddd;
}

.menuOuter {
	padding: 5px;
	width: 100%;
}

#option1 {
	/* display: inline-block; */
	float: left;
}

#option2 {
	float: right;
	/* display: inline-block; */
}

#SPOTTOUR {
	display: inline-block;
	font-size: 32px;
	font-family: Tahoma;
	color: #000;
}

.nav-item {
	margin: 5px;
}
</style>

</head>

<body>

	<div class='menuOuter'
		style="border-bottom: 1px solid black; text-align: center;">
		<div id='option1'>
			<a href="worldMap" target="_parent"> <i
				class="fas fa-globe-americas fa-spin fa-3x"></i>
			</a>
		</div>
		<a href="index" target="_parent">
			<div id="SPOTTOUR">SPOTS-TOUR</div>
		</a>
		<div id='option2'>
			<!-- 內嵌網站把連結導向父層 -->
			<!-- <div>
            <a href="01_MerchandiseIndex.html" target="_parent"> <i
                class="fas fa-cart-plus fa-3x"></i>
            </a>
        </div> -->

			<ul class="nav nav-tabs">

				<c:if test="${! empty LoginOK }">
					<img height='40px' width='30px'
						src='${pageContext.request.contextPath}/_00_init/getMemberImage?id=${LoginOK.memberId}'>

				</c:if>

				<li class="nav-item dropdown"><a class="fas fa-file-alt fa-2x"
					data-bs-toggle="dropdown" href="#" role="button"
					aria-expanded="false"></a>

					<ul class="dropdown-menu">
						<c:if test="${ funcName != 'SHO' }">
							<li><a class="dropdown-item"
								href="<c:url value='/_03_listBooks/DisplayPageProducts' />">購物</a></li>
						</c:if>
						<c:if test="${ funcName != 'CHE' }">
							<li><a class="dropdown-item"
								href="<c:url value='/_04_ShoppingCart/ShowCartContent.jsp' />">結帳</a></li>
						</c:if>
						<c:if test="${ funcName != 'ORD' }">
							<li><a class="dropdown-item"
								href="<c:url value='/_05_orderProcess/orderList.do' />">訂單</a></li>
						</c:if>
						<c:if test="${ funcName != 'BMT' }">
							<li><a class="dropdown-item"
								href="<c:url value='/_20_productMaintain/DisplayPageProducts' />">維護</a></li>
						</c:if>
						<c:if test="${ funcName != 'IND' }">
							<li><a class="dropdown-item"
								href="<c:url value='/index.jsp' />">回首頁</a></li>
						</c:if>
					</ul></li>

				<li class="nav-item dropdown"><a class="fas fa-cart-plus fa-2x"
					data-bs-toggle="dropdown" href="#" role="button"
					aria-expanded="false"></a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="merchandiseIndex">購物商城首頁</a></li>
						<li><a class="dropdown-item" href="shoppingCart">購物車</a></li>
						<li><a class="dropdown-item" href="aboutMerchandise">關於商品資訊</a></li>
						<li><a class="dropdown-item" href="myOrderList">我的訂單</a></li>
						<li><a class="dropdown-item" href="aboutMerchandise">我的訂單</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="merchandiseModify">管理商城</a></li>
						<li><a class="dropdown-item" href="activityList">管理活動列表</a></li>
						<li><a class="dropdown-item" href="activityModify">管理活動快訊</a></li>
						<li><a class="dropdown-item" href="aboutMerchandiseModify">編輯關於商品資訊</a></li>
						<li><a class="dropdown-item" href="manageMerchandiseReport">管理退貨商品列表</a></li>
						<li><a class="dropdown-item" href="manageVideoReport">管理檢舉影片</a></li>

					</ul></li>
				<li class="nav-item dropdown"><a class="fas fa-user-alt fa-2x"
					data-bs-toggle="dropdown" href="#" role="button"
					aria-expanded="false"></a>
					<ul class="dropdown-menu">
						<c:if test="${ funcName != 'REG' }">
							<li><a class="dropdown-item" href="memberRegister">註冊會員</a></li>
						</c:if>
						<c:if test="${ empty LoginOK }">
							<li><a class="dropdown-item" href="login">登入</a></li>
						</c:if>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="memberDetailModify">會員個人資料</a></li>
						<li><a class="dropdown-item" href="personalVideo">個人作品</a></li>
						<li><a class="dropdown-item" href="collectVideo">收藏的影片</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="logout">登出</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="fas fa-align-justify fa-2x" data-bs-toggle="dropdown"
					href="#" role="button" aria-expanded="false"></a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="aboutUs">關於我們</a></li>
						<li><a class="dropdown-item" href="contactUs">聯絡我們</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="aboutUsModify">編輯關於我們</a></li>
						<li><a class="dropdown-item" href="contactUsModify">編輯聯絡我們</a></li>
					</ul></li>
			</ul>
		</div>
	</div>


	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>

	<!-- 	<script -->
	<!-- 		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" -->
	<!-- 		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" -->
	<!-- 		crossorigin="anonymous"></script> -->


</body>
</html>