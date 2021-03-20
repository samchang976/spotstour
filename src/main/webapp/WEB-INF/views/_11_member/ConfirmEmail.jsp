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
		
			<div class="shadow p-3 mb-9 bg-body rounded">
	
			<div class="progress">
	  			<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 100%">100%</div>
			</div>
				
				<div class="focus container text-dark text-left text-shdow">
					<div class="row text-center">
						<div class="col mt-3">
							<h1><i class="fas fa-check-circle"></i>註冊成功!</h1>
							
						</div>
					</div>
				
				
					<div class="row text-center">
						<div class="col-12">
		
							<div id="thanks">
							<h5>
								<br>親愛的會員您好 :<br>
								<br>SpotsTour已寄出一封驗證信至您的信箱<br>
								<br>請至您的信箱查看認證信<br>
								<br>完成信箱驗證即可登入<br>
								<br>謝謝您的合作 ! <br><br>		
							</h5>
							</div>
							
						</div>
					</div>

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