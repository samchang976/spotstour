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
/* 	font-family: 'Noto Sans TC'; */
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
					<div class="col-10 col-md-6 col-lg-6">

					<form:form method="POST" action="/SpotsTourHSM/memberDetailModify"  modelAttribute="member"
							enctype='multipart/form-data'>
							<div class="form-row" >
							<div class="shadow p-3 mb-9 bg-body rounded">
															
									 <form:hidden path="mId" value="${member.mId}" size="40" class="mt-3"/>
									 <form:hidden path="m_verify" value="${member.m_verify}" size="40" class="mt-3"/>
										 				
									 <form:hidden path="m_createTime" value="${member.m_createTime}" size="40" class="mt-3"/>

										 <form:hidden path="mAN" value="${member.mAN}" size="40" class="mt-3"/>
									
							<div>
							<c:if test="${! empty LoginOK }">
					<img height='80px' width='60px' src="/upload/${LoginOK.mPic}" class="rounded mx-auto d-block mb-3">					
							</c:if>
							</div>
								
									
									
										姓名： <form:errors path="mName" class="error"/><br>
									 <form:input path="mName" value="${member.mName}" class="form-control"/>
									

										密碼： <form:errors path="mPw" class="error"/><br>
									 <form:input path="mPw" value="${member.mPw}" class="form-control" type="password"/>

										密碼確認： <form:errors path="mTPw" class="error"/><br>
									 <form:input path="mTPw" value="${member.mTPw}" class="form-control" type="password"/>

										地址： <form:errors path="d_mAddress" class="error"/><br>
									 <form:input path="d_mAddress" value="${member.d_mAddress}" class="form-control"/>

									性別： 
									<form:select path="mGender" class="form-control">
									<form:options path="mGender" items="${gender}"/>
									</form:select>

										身分證：<form:errors path="mUid" class="error"/><br>
								 <form:input path="mUid" value="${member.mUid}" class="form-control"/>

										電子信箱： <form:errors path="mEmail" class="error"/><br>
									 <form:input path="mEmail" value="${member.mEmail}" class="form-control" type="email"/>

										生日： <form:errors path="mBDay" class="error"/><br>
									 <form:input path="mBDay" value="${member.mBDay}" type="date" class="form-control" required="required"/>

										手機： <form:errors path="mPhone" class="error"/><br>
									 <form:input path="mPhone" value="${member.mPhone}" class="form-control"/>
										 
									會員照片：	 <form:errors path="multipartFile" class="error"/><br>
									 <form:input path="multipartFile" class="form-control" type="file"/>
							
							

									<button type="submit" class="btn btn-primary w-100 mt-3 mb-5">修改</button>

								<!-- Button trigger modal -->
<!-- 							<button type="submit" class="btn btn-primary w-100 mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal"> -->
<!-- 							  修改 -->
<!-- 							</button> -->
							
<!-- 							Modal -->
<!-- 							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!-- 							  <div class="modal-dialog"> -->
<!-- 							    <div class="modal-content"> -->
<!-- 							      <div class="modal-header"> -->
<!-- 							        <h5 class="modal-title" id="exampleModalLabel">修改成功</h5> -->
<!-- 							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
<!-- 							      </div> -->
<!-- 							      <div class="modal-body"> -->
<!-- 							        親愛的會員，您的資料已完成更新。 -->
<!-- 							      </div> -->
<!-- 							      <div class="spinner-border text-primary" role="status"> -->
<!-- 															<span class="visually-hidden">Loading...</span> -->
<!-- 														</div> -->
<!-- 							      <div class="modal-footer"> -->
<!-- 							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
<%-- 							        <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/memberDetailModify'" >回首頁</button> --%>
<!-- 							      </div> -->
<!-- 							    </div> -->
<!-- 							  </div> -->
<!-- 							</div> -->
						


							</div>
							</div>
						</form:form>
						</div>
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