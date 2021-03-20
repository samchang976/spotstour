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
	
<title>註冊會員</title>
</head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Lora&family=Noto+Sans+TC:wght@300&display=swap')
	;

.main {
	font-family: 'Noto Sans TC';
}
.error {
	color: red;
	display: inline-block;
	font-size: 10pt;
}
.form-control{
	margin-bottom: 10px;
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

								
									
	<div class="container">
		<div class="main">

			<div class="shadow p-3 mb-9 bg-body rounded">
			
				<div class="progress">
				  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%">75%</div>
				</div>
				<div class="focus container text-dark text-left text-shdow">
					<div class="row text-center">
						<div class="col mt-3">
							<h1>註冊會員</h1>
						</div>
					</div>

				<!-- 表單 -->
				<div class="row justify-content-center mt-3">
					<div class="col-10 col-md-6 col-lg-6">

						<form:form method="POST" modelAttribute="memberBean"
							enctype='multipart/form-data'>
							<div class="form-row">
								
								<div class="form-group">
									<form:label path="mAN">帳號：</form:label><form:errors path="mAN" class="error"/>
									<form:input path="mAN" class="form-control"
									placeholder="請輸入6-10個英數字"/>	
								</div>
								<div class="form-group">
									<form:label path="mName">姓名：</form:label><form:errors path="mName" class="error"/>
									<form:input path="mName" class="form-control"/>
								</div>
							</div>
								<div class="form-row">
								
									<div class="form-group">
										<form:label path="mPw">密碼：</form:label><form:errors path="mPw" class="error"/>
										<form:input path="mPw" class="form-control" placeholder="請輸入6-10個英數字" type="password"/>
									</div>
								<div class="form-group">
									<form:label path="mTPw">密碼確認：</form:label><form:errors path="mTPw" class="error"/>
									<form:input path="mTPw" class="form-control" placeholder="需與密碼一致" type="password"/>
									
								</div>
							</div>
							<div class="form-row">
								<div class="form-group">
									<form:label path="d_mAddress">地址：</form:label><form:errors path="d_mAddress" class="error"/>
									<form:input path="d_mAddress" class="form-control"/>
									
								</div>
								<div class="form-group">
									<form:label path="mGender">性別：</form:label><form:errors path="mGender" class="error"/>
									<form:select path="mGender" class="form-control">
									<form:options path="mGender" items="${gender}"/>
									</form:select>
									
								</div>
								<div class="form-group">
									<form:label path="mUid">身分證：</form:label><form:errors path="mUid" class="error"/>
									<form:input path="mUid" class="form-control" placeholder="A123456789"/>
									
								</div>
							</div>
								<div class="form-group">
									<form:label path="mEmail">電子信箱：</form:label><form:errors path="mEmail" class="error"/>
									<form:input path="mEmail" class="form-control" placeholder="example@gmail.com" type="email"/>
									
								</div>
								<div class="form-group">
									<form:label path="mBDay">生日：</form:label><form:errors path="mBDay" class="error"/>
									<form:input path="mBDay" class="form-control" type="date" required="required"/>
									
								</div>

								<div class="form-group">
									<form:label path="mPhone">電話：</form:label><form:errors path="mPhone" class="error"/>
									<form:input path="mPhone" class="form-control" placeholder="0988123456"/>
									
								</div>
														
							
							<div class="form-group">
								<form:label path="multipartFile">會員照片：</form:label><form:errors path="multipartFile" class="error"/>
									<form:input path="multipartFile" class="form-control" type="file"/>
									
							</div>

							<button type="submit" class="btn btn-primary w-100 mt-3 mb-5">註冊</button>

						</form:form>

						
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

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>


</body>
</html>