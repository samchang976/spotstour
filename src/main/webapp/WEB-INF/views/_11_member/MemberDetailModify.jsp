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

<title>會員個人資料</title>

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


#phto {
	/* border: solid 1px slategrey; */
	width: 200px;
	height: 600px;
	float: left;
}

div {
	margin-bottom: 10px;
	/* border: solid 1px slategrey; */
}

select {
	margin-bottom: 10px;
}

#genderBlock {
	float: left;
	margin-right: 15px;
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
		

		<div class="main">

			<div class="focus container text-dark text-left text-shdow">
				<div class="row text-center">
					<div class="col">
						<h1 class="mt-3">會員資料修改</h1>
					</div>
				</div>


				<!-- 表單 -->
				<div class="row justify-content-center mt-3">
					<div class="col-10 col-md-6 col-lg-4">

					<form:form method="POST" action="/SpotsTourHSM/memberDetailModify"  modelAttribute="member"
							enctype='multipart/form-data'>
							<div class="form-row" >
							
									帳號：${LoginOK.mAN}<br>
									
									姓名： <form:input path="mName" value="${LoginOK.mName}" size="40" class="mt-3"/>
										 <form:errors path="mName" class="error"/><br>

									密碼： <form:input path="mPw" placeholder="${LoginOK.mPw}" size="40" class="mt-3"/>
										 <form:errors path="mPw" class="error"/><br>

									密碼確認： <form:input path="mTPw" placeholder="${LoginOK.mPw}" size="36" class="mt-3"/>
										 <form:errors path="mTPw" class="error"/><br>

									地址： <form:input path="d_mAddress" placeholder="${LoginOK.d_mAddress}" size="40" class="mt-3"/>
										 <form:errors path="d_mAddress" class="error"/><br>

									性別： 
									<form:select path="mGender" class="mt-3">
									<form:options path="mGender" items="${gender}"/>
									</form:select><br>

									身分證： <form:input path="mUid" value="${LoginOK.mUid}" size="38" class="mt-3"/>
										 <form:errors path="mUid" class="error"/><br>

									電子信箱： <form:input path="mEmail" value="${LoginOK.mEmail}" size="36" class="mt-3"/>
										 <form:errors path="mEmail" class="error"/><br>

									生日： <form:input path="mBDay" value="${LoginOK.mBDay}" type="date" size="40" class="mt-3" required="required"/>
										 <form:errors path="mBDay" class="error"/><br>

									地址： <form:input path="mPhone" value="${LoginOK.mPhone}" size="40" class="mt-3"/>
										 <form:errors path="mPhone" class="error"/><br>
										 
									會員照片： <form:input path="multipartFile" size="36" class="mt-3" type="file"/>
										 <form:errors path="multipartFile" class="error"/><br>
							
							

							<button type="submit" class="btn btn-primary w-100 mt-3">修改</button>

							</div>
						</form:form>

						
					</div>
				</div>


			</div>

		</div>

		
	</div>
				
<!-- 		<div style="margin: 150px;"> -->
			<!-- 文字表單區塊 --> 
 			<!-- border: 1px solid saddlebrown; --> 

<!-- 			<div id="phto" style="margin-right: 30px;"> -->
<!-- 				照片+更換照片區塊 -->
<!-- 				<div -->
<!-- 					style="width: 200px; height: 200px; border: solid 1px rgb(35, 33, 48);"> -->
<!-- 					<img src="" alt=""> -->
<!-- 				</div> -->
<!-- 				<i class="fas fa-plus-circle fa-2x"></i> <span>更換照片</span> -->
<!-- 			</div> -->



    
    
<!-- 			<div> -->
<!-- 				<div>姓名或暱稱:</div> -->
<!-- 				<label for="name"> </label> <input type="text" name="name" id="name"> -->
<!-- 			</div> -->
<!-- 			<div> -->
<!-- 				<div>生日:</div> -->
<!-- 				<label for="bitthday"> </label> <input type="date" name="bitthday" -->
<!-- 					id="bitthday"> -->
<!-- 			</div> -->

<!-- 			<div style="padding-bottom: 1px;"> -->
<!-- 				排版用 : 性別和手機的區塊 -->
<!-- 				<div id="genderBlock"> -->
<!-- 					<div>性別:</div> -->
<%-- 					<form> --%>
<!-- 						<select name="gender" id="gender"> -->
<!-- 							<option value="violence">男性</option> -->
<!-- 							<option value="pornography">女性</option> -->
<!-- 							<option value="ImproperPofit">秘密</option> -->
<!-- 						</select> -->
<%-- 					</form> --%>
<!-- 				</div> -->
<!-- 				<div> -->
<!-- 					<div>手機或電話:</div> -->
<!-- 					<label for="phone"></label> <input type="text" name="phone" -->
<!-- 						id="phone"> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 			<div>地址:</div> -->
<!-- 			<label for="phone"></label> <input type="text" name="phone" -->
<!-- 				id="phone"> -->

<!-- /// -->

			<!-- 預留可以加的欄位，如果這邊欄位格是跑掉可以把 #phto的height調高 -->
			<!-- <div>身分證字號</div>
        <label for="IdNumber" ></label>
        <input type="text" name="IdNumber" id="IdNumber">   
 
        <div>身分證字號</div>
        <label for="IdNumber" ></label>
        <input type="text" name="IdNumber" id="IdNumber"> 

         
        <div>身分證字號</div>
        <label for="IdNumber" ></label>
        <input type="text" name="IdNumber" id="IdNumber">  -->

		

<!-- 		<button style="margin-left: 250px;">確定送出</button> -->

		
	
<!-----------定位----------------------------------------------------------------------------->
	</div>
<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
<!-- --------------------------------------------------------------------------------------->

</body>
</html>