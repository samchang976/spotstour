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
	href="<c:url value='/_00_util/managerUtil/css/managerLayout.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/managerUtil/css/managerFont.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/managerUtil/css/managerColor.css'></c:url>">
	
<!-- --------------------------------------------------------------------------------------------------------->
	
<title>管理退貨商品列表</title>
<!-- <link rel="stylesheet" href="button.css">
    <link rel="stylesheet" href="font.css"> -->
</head>
<style>
/* body { */
/* 	text-align: center; */
/* 	font-size: 20px; */
/* } */
#form {
	margin: 50px auto;
	padding: 20px;
	text-align: left;
	/* border: 1px solid #cccccc; */
	width: 1000px;
	height: 800px;
	font-size: 20px;
}

.auto {
	line-height: 20px;
	text-align: left;
	padding: 20px;
	margin: 5px;
	border: #ccc 1px solid;
	font-size: 20px;
}
/* .auto:nth-child(1){
        margin-bottom: 10px;
    } */
</style>
<body>
<!--header=================================================================================  -->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
<!-----------定位----------------------------------------------------------------------------->
	<div class="BodyPosition">
<!------------------------------------------------------------------------------------------->	
	<div class="container">
			<div id="form">
				<div style="text-align: center;"><h3>關於商品退貨</h3></div>
<!-- 				<div>&nbsp;&nbsp;&nbsp;&nbsp;退換貨</div> -->
<!-- 				<div>&nbsp;&nbsp;&nbsp;&nbsp;配送方式</div> -->

				<!-- 從DB抓資料填上 -->
<!-- 				<div class="auto"> -->
<!-- 					<input type="hidden" id="pnumber" name="商品編號"> -->
<!-- 				</div> -->
<!-- 				<br> -->
				<!-- 從DB抓資料填上 -->
<!-- 				<div class="auto"> -->
<!-- 					<input type="hidden" id="pname" name="商品名稱"> -->
<!-- 				</div> -->
				<div class="shadow p-3 mb-5 bg-body rounded">
					<div id="rule">
					
						<ul>
							<li>＊商品退貨＊</li>
							<li>1.	商品到貨享七天猶豫期之權益（注意！猶豫期非試用期），辦理退貨時，商品必須保持原廠外盒及包裝、商品本體、配件、附隨文件（含贈品及加價購商品），是全新狀態且包裝完整，否則將會影響您的退貨權利。</li>
							<li>2.	商品退貨時，請以原外箱退回，勿於原廠包裝上黏貼紙張及書寫文字。</li>
							<li>3.	冷凍及冷藏食品、生鮮商品，容易腐敗、保存期限較短或即將到期之商品，除商品本身有瑕疵或於配送過程失溫導致變質外，將不提供退貨服務。</li>
							<li>4.	個人衛生用品如：內衣褲、塑身衣、泳裝、襪子、紙尿褲、刮鬍刀、美體刀…等，已拆封 (如剪標、下水等情形…)，除商品本身有瑕疵外，因有影響衛生之虞，無法受理退貨。</li>
							<li>5.	經拆封之影音商品及智慧財產權保護商品或電腦軟體、電子書、線上遊戲…等非以有形媒介提供之數位內容或一經提供即為完成之線上服務，無法受理退貨。</li>
							<li>6.	客製化商品、報紙、期刊、雜誌類商品皆無法受理退貨。</li>
							<li>7.	3C家電用品於猶豫期內請保留原「運送外箱」，勿讓配送人員收走，以便退貨返還時保護商品使用。</li>
							<li>8.	大型家電如：(冰箱、洗衣機、烘衣機…等。)除商品本身故障或瑕疵外，一經使用將會影響退貨權利。</li>
							<li>9.	如您購買的商品需要安裝或自行組裝，除商品本身有瑕疵外，欲辦理退貨，可能衍生額外的拆機、整新費用，且無法退回已回收之舊機。</li>
							<li>10.	發票一經開立不得任意更改或改開發票，請參考「 電子發票說明 」。</li>
							<li>11.	本網站未提供換貨服務。</li>
						</ul>
					</div>
				</div>
				<div style="text-align: center;">
					<button type="submit" class="btn btn-primary"
						onclick="location.href='${pageContext.request.contextPath}/merchandiseIndex'">回商城首頁</button>
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

</body>
</html>