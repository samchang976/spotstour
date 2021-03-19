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

/* 取消ul的底線 */
ul.nav.nav-tabs {
	border-bottom: none;
}

.menuOuter .fas {
	text-decoration: none;
	color: #000;
	font-size: 30px;
}

.menuOuter .fas:hover {
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
	font-size: 24px;
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
			<a href="<c:url value='worldMap' />" target="_parent" data-bs-toggle="tooltip" data-bs-placement="bottom" title="worldMap 世界地圖"> <i
				class="fas fa-globe-americas fa-spin "></i>
			</a>
		</div>
		<a href="<c:url value='/' />" target="_parent" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Spots-tour 首頁">
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
				<!-- 會員圖片 -->
				<c:if test="${! empty LoginOK }">
					<img height='40px' width='30px' src="/upload/${LoginOK.mPic}">					
				</c:if>
<!-- ======================測試頁面連結區塊================================================================================== -->
				
<!-- 				<li class="nav-item dropdown"><a class="fas fa-user" style="color:green" -->
<!-- 					data-bs-toggle="dropdown" href="#" role="button" -->
<!-- 					aria-expanded="false">會員</a> -->
<!-- 					<ul class="dropdown-menu"> -->
<%-- 						<li><a class="dropdown-item" href="<c:url value="/index"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Spots-tour 首頁">首頁</a></li> --%>
<!-- 						<li>_11_member</li> -->
<%-- 						<li><a class="dropdown-item" href="<c:url value="/confirmEmail"/>">Email確認(尚未)</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/emailVerificationSuccess"/>">Email核對成功</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/forgetPassword"/>">忘記密碼</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/login"/>">登入會員</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value='/login.out' />">登出</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/memberDetailModify"/>">會員個人資料</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/memberRegister"/>">註冊會員</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/memberRegisterSuccess"/>">註冊成功(尚未)</a></li> --%>
<!-- 					</ul></li> -->

<!-- 				<li class="nav-item dropdown"><a class="fas fa-user" style="color:green" -->
<!-- 					data-bs-toggle="dropdown" href="#" role="button" -->
<!-- 					aria-expanded="false">商城</a> -->
<!-- 					<ul class="dropdown-menu"> -->
<!-- 						<li>_21_shoppingMall</li> -->
<%-- 						<li><a class="dropdown-item" href="<c:url value="/aboutMerchandise"/>">關於商品資訊</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/aboutUs"/>">關於我們</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/activityDetail"/>">商城活動快訊詳細</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/contactUs"/>">聯絡我們</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/merchandiseDetail"/>">商品詳細</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/merchandiseIndex"/>">商城首頁</a></li>									 --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/merchandiseSearchResult"/>">商品搜尋結果</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/myOrderList"/>">我的訂單</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/orderDetail"/>">訂單明細</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/purchaseSuccess"/>">購買成功</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/selectPayment"/>">訂購資訊</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/shoppingCart"/>">購物車</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/submitOrderInfo"/>">提交訂單資訊</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/checkPayment"/>">結帳頁面</a></li> --%>
<!-- 					</ul></li> -->



<!-- 				<li class="nav-item dropdown"><a class="fas fa-user-secret " style="color:green" -->
<!-- 					data-bs-toggle="dropdown" href="#" role="button" -->
<!-- 					aria-expanded="false">影片</a> -->
<!-- 					<ul class="dropdown-menu"> -->
<!-- 						<li>_31_portfolio</li> -->
<%-- 						<li><a class="dropdown-item" href="<c:url value="/collectVideo"/>">收藏的影片</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/historyList"/>">觀看紀錄</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/personalPortfolio"/>">個人作品</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/portfolioPlay"/>">作品播放</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/previewVideo"/>">播放預覽頁面_播放頁預覽(尚未)</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/videoCreate"/>">新增影片頁面</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/videoModify"/>">編輯影片</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/videoReport"/>">檢舉影片(尚未)</a></li> --%>
						
<!-- 						<li>_wordMap</li> -->
<%-- 						<li><a class="dropdown-item" href="<c:url value="/worldMap"/>">世界地圖</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/videoPlayer"/>">影片播放</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/previewVideo_world"/>">播放預覽頁面_世界地圖預覽</a></li> --%>
						
<!-- 					</ul></li> -->

<!-- 				<li class="nav-item dropdown"><a class="fas fa-user-tie" style="color:green" -->
<!-- 					data-bs-toggle="dropdown" href="#" role="button" -->
<!-- 					aria-expanded="false">管理</a> -->
<!-- 					<ul class="dropdown-menu"> -->
<!-- 						<li>_91_manageMart</li> -->
<%-- 						<li><a class="dropdown-item" href="<c:url value="/aboutMerchandiseModify"/>">編輯關於商品資訊</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/aboutUsModify"/>">編輯關於我們</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/activityList"/>">管理活動列表</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/activityModify"/>">管理活動快訊</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/contactUsModify"/>">編輯聯絡我們</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/manageMerchandiseReport"/>">管理退貨商品列表</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/manageVideoReport"/>">管理檢舉影片</a></li> --%>
<%-- 						<li><a class="dropdown-item" href="<c:url value="/merchandiseModify"/>">編輯商品</a></li> --%>
<!-- 					</ul></li> -->
<!-- ======================上方:測試頁面連結區塊================================================================================== -->
					
				<li class="nav-item dropdown"><a class="fas fa-cart-plus "
					data-bs-toggle="dropdown" href="#" role="button"
					aria-expanded="false" data-bs-toggle="tooltip" data-bs-placement="bottom" title="商城資訊"></a>
					<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="<c:url value="/merchandiseIndex"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="前往購物商城首頁">購物商城首頁</a></li>
							<li><a class="dropdown-item" href="<c:url value="/merchandiseSearchResult"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="前往商城查詢全部商品">查看所有商品</a></li>
							<li><a class="dropdown-item" href="<c:url value="/aboutMerchandise"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="查詢關於商品配送資訊">關於商品資訊</a></li>
							
						<c:if test="${ mPid == 2 || mPid == 1}">
							<li><a class="dropdown-item" href="<c:url value="/shoppingCart"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="會員可以查詢個人已加入購物車內容">我的購物車</a></li>
							<li><a class="dropdown-item" href="<c:url value="/myOrderList"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="會員可以查詢個人訂單及訂單明細">我的訂單</a></li>
						</c:if>
						<c:if test="${ mPid == 1 }">
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="<c:url value="/merchandiseModify"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="管理者可以新增 刪除 修改 查詢所有商城商品">管理商城</a></li>
							<li><a class="dropdown-item" href="<c:url value="/activityList"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="管理者可以新增 刪除 修改 查詢所有商城活動資訊">管理活動列表</a></li>
							<li><a class="dropdown-item" href="<c:url value="/activityModify"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="管理者可以新增商城活動資訊">新增活動快訊</a></li>
							<li><a class="dropdown-item" href="<c:url value="/myOrderList"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="管理者可以查看所有訂單資訊">管理訂單資訊</a></li>
							<li><a class="dropdown-item" href="<c:url value="/aboutMerchandiseModify"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="管理者可以編輯關於商品訂購與配送">編輯關於商品</a></li>
							<li><a class="dropdown-item" href="<c:url value="/manageFeedback"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="管理者可以刪除不適當的商品留言">管理所有商品留言</a></li>
							<li><a class="dropdown-item" href="<c:url value="/manageMerchandiseReport"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="管理者可以編輯關於退貨商品資訊">編輯關於退貨商品</a></li>
							<li><a class="dropdown-item" href="<c:url value="/manageVideoReport"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="管理者可以新增 刪除 修改 查詢所有影片不當的內容">管理檢舉影片</a></li>
						</c:if>
					</ul></li>
					
				<li class="nav-item dropdown"><a class="fas fa-user-alt "
					data-bs-toggle="dropdown" href="#" role="button"
					aria-expanded="false" data-bs-toggle="tooltip" data-bs-placement="bottom" title="會員資訊"></a>
					<ul class="dropdown-menu">
						<c:if test="${ empty LoginOK }">
							<li><a class="dropdown-item" href="<c:url value="/memberRegister"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="還沒加入會員嗎? 這裡可以註冊會員">註冊會員</a></li>
							<li><a class="dropdown-item" href="<c:url value="/login"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="管理者及會員登入">登入</a></li>
						</c:if>
						<c:if test="${ !empty LoginOK }">
						<li><a class="dropdown-item" href="<c:url value="/memberDetailModify"/>" data-bs-placement="bottom" title="會員可以 修改會員資料">修改會員資料</a></li>
						<li><a class="dropdown-item" href="<c:url value="/personalPortfolio"/>" data-bs-placement="bottom" title="會員個人影片的作品集">個人作品</a></li>
						<li><a class="dropdown-item" href="<c:url value="/collectVideo"/>" data-bs-placement="bottom" title="會員個人收藏所有的影片">收藏的影片</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="<c:url value="/logout"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="管理者及會員登出">登出</a></li>
						</c:if>
				      </ul></li>
					
				<li class="nav-item dropdown"><a class="fas fa-align-justify "
					data-bs-toggle="dropdown" href="#" role="button"
					aria-expanded="false" data-bs-toggle="tooltip" data-bs-placement="bottom" title="其他資訊"></a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="<c:url value="/aboutUs"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="查看關於Spots-tour">關於我們</a></li>
						<li><a class="dropdown-item" href="<c:url value="/contactUs"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="聯絡Spots-tour">聯絡我們</a></li>
						<c:if test="${ mPid == 1 }">
							<li><a class="dropdown-item" href="<c:url value="/aboutUsModify"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="管理者可以編輯關於Spots-tour">編輯關於我們</a></li>
							<li><a class="dropdown-item" href="<c:url value="/contactUsModify"/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="管理者可以編輯聯絡Spots-tour的資訊">編輯聯絡我們</a></li>
						</c:if>
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
