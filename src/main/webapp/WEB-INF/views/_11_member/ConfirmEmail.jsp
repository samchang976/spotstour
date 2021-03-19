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
	href="<c:url value='/_00_util/memberUtil/css/memberLayout.css'></c:url>">
	
<link rel="stylesheet"
	href="<c:url value='/_00_util/memberUtil/css/memberColor.css'></c:url>">	
	
<link rel="stylesheet"
	href="<c:url value='/_00_util/memberUtil/css/memberFont.css'></c:url>">
	
<!-- --------------------------------------------------------------------------------------------------------->
	
<title>信箱驗證通知</title>

</head>
<style>
#container_PurchaseSuccess{
   text-align: center;
   margin: 50px auto;
   /* background-color: lawngreen; */
}

</style>
<body>
<!--header=================================================================================  -->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
<!-----------定位----------------------------------------------------------------------------->
	<div class="BodyPosition">
<!------------------------------------------------------------------------------------------->	

<!-- 	<div class="container"> -->
	
<!-- 	<div class="main"> -->
	
<!-- 	<div class="alert alert-primary" role="alert"> -->
<!--   <h4 class="alert-heading">Well done!</h4> -->
<!--   <p>Aww yeah, you successfully read this important alert message. This example text is going to run a bit longer so that you can see how spacing within an alert works with this kind of content.</p> -->
<!--   <hr> -->
<!--   <p class="mb-0">Whenever you need to, be sure to use margin utilities to keep things nice and tidy.</p> -->
<!-- </div> -->

<!-- 			<div class="focus container text-dark text-left text-shdow"> -->
<!-- 				<div class="row text-center"> -->
<!-- 					<div class="col"> -->
<!-- 						<i class="fas fa-check-circle"></i><span id="successText"> -->
<!-- 							註冊成功! </span> -->
<!-- 					</div> -->
					
<!-- 					<div> -->
<!-- 					<br> -->
			
<!-- 		<div id="thanks"> -->
<!-- 				<br>SpotsTour已寄出一封驗證信至您的信箱<br> -->
<!-- 				<br>請繼續完成信箱驗證並登入<br> -->
<!-- 				<br>謝謝您 ! -->
<!-- 			</div> -->
<!-- 	</div> -->
<!-- 	</div> -->
	
	
	
	
	<div class="container" id="container_PurchaseSuccess">
			
<br>
			<!--訂購成功  -->
			<div class="row">
				<div class="col-12">
					<div>
						 <h1><i class="fas fa-check-circle"></i><span id="successText">
							註冊成功! </span></h1>
					</div>
				</div>
			</div>
			<br>
			<!-- 區塊 -->
			
			<div class="row">
				<div class="col-12">
					<div class="OrderNumber" style="text-align: center;">
						<h4>
							<span>會員您好 :</span> 
						</h4>
					</div>
				</div>
			</div>
		
			
			<!--感謝詞  -->
			<div id="thanks">
				<br>SpotsTour已寄出一封驗證信至您的信箱<br>
				<br>請繼續完成信箱驗證並登入<br>
				<br>謝謝您 ! <br>
				
			</div>
<hr>
			
<br>
			<!-- 回商城首頁 -->
			<button class="btn btn-primary"
				onclick="location.href='${pageContext.request.contextPath}/'">回首頁</button>

		
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