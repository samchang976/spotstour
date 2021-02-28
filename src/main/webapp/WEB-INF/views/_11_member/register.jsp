<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>註冊會員</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
</head>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Lora&family=Noto+Sans+TC:wght@300&display=swap')
	;

.main {
	font-family: 'Noto Sans TC';
	height: 85vh;
	display: flex;
	justify-content: center;
	align-items: center;
}
.error {
	color: red;
	display: inline-block;
	font-size: 10pt;
}
</style>

<body>

	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />

	<!-- <button class="btn btn-primary">ABC</button> -->

	<div class="main">

		<div class="focus container text-dark text-left text-shdow">
			<div class="row text-center">
				<div class="col">
					<h1>註冊會員</h1>
				</div>
			</div>


			<!-- 表單 -->
			<div class="row justify-content-center mt-3">
				<div class="col-10 col-md-6 col-lg-7">


					<form:form method="POST" modelAttribute="memberBean" enctype='multipart/form-data'>
					
						<div class="form-row">
							<div class="form-group col-md-6">
							<form:label path="mAN">帳號：</form:label>
									<form:input path="mAN" class="form-control"
									placeholder="6-10個字元英數混合不含特殊符號"/>
									<form:errors path="mAN" class="error"/>
									
<!-- 								<label for="inputEmail4">帳號：</label>  -->
<%-- 								<input type="text" name="memberId" value="${param.memberId}" class="form-control" placeholder="6-10個字元英數混合不含特殊符號">  --%>
<%-- 									<font color="red" size="-1">${MsgMap.errorIdEmpty}${MsgMap.errorIdDup}</font> --%>
							</div>
							<div class="form-group col-md-6">
									<form:label path="mName">姓名：</form:label>
									<form:input path="mName" class="form-control"/>
									<form:errors path="mName" class="error"/>
							
<!-- 								<label for="inputPassword4">姓名：</label> <input type="text" -->
<%-- 									name="mName" value="${param.mName}" class="form-control"> --%>
<%-- 								<font color="red" size="-1">${MsgMap.errorName}</font> --%>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
									<form:label path="mPw">密碼：</form:label>
									<form:input path="mPw" class="form-control" placeholder="6-10個字元英數混合"/>
									<form:errors path="mPw" class="error"/>
									
<!-- 								<label for="inputEmail4">密碼：</label> <input type="password" -->
<!-- 									name="mPw" class="form-control" placeholder="6-10個字元英數混合不含特殊符號"> -->
<%-- 								<font color="red" size="-1">${MsgMap.errorPasswordEmpty}${MsgMap.passwordError}</font> --%>
							</div>
							<div class="form-group col-md-6">
									<form:label path="mPw1">密碼確認：</form:label>
									<form:input path="mPw1" class="form-control" placeholder="6-10個字元英數混合"/>
									<form:errors path="mPw1" class="error"/>
									
<!-- 								<label for="inputPassword4">密碼確認：</label> <input type="password" -->
<!-- 									name="mPw1" class="form-control" -->
<!-- 									placeholder="6-10個字元英數混合不含特殊符號"> <font color="red" -->
<%-- 									size="-1">${MsgMap.errorPassword1Empty}</font> --%>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
									<form:label path="d_mAddress">地址：</form:label>
									<form:input path="d_mAddress" class="form-control"/>
									<form:errors path="d_mAddress" class="error"/>
							
<!-- 								<label for="inputCity">地址：</label> <input type="text" -->
<%-- 									name="d_mAddress" value="${param.d_mAddress}" --%>
<%-- 									class="form-control"> <font color="red" size="-1">${MsgMap.errorAddr}</font> --%>
							</div>
							<div class="form-group col-md-2">
									<form:label path="mGender">性別：</form:label>
									<form:select path="mGender" class="form-control">
									<form:option value="-1" label="請挑選" />
									<form:option value="0" label="男" />
									<form:option value="1" label="女" />
									<form:option value="2" label="秘密" />
									</form:select>
									<form:errors path="mGender" class="error"/>

<%-- 			<form:select path="hobby.id" > --%>
<%-- 				<form:option value="-1" label="請挑選" /> --%>
<%-- 				<form:options  items="${hobbyList}" --%>
<%-- 	   	  	       itemLabel='name' itemValue='id'/> --%>
<%-- 	   	  	</form:select><br>&nbsp; --%>
<%-- 	   	  <form:errors path="hobby"  cssClass="error"/> --%>
							
<!-- 								<label for="inputState">性別：</label>  -->
<!-- 								<select id="inputState" name="mGender" class="form-control"> -->
<!-- 									<option selected>女</option> -->
<!-- 									<option>男</option> -->
<!-- 									<option>不告訴你</option> -->
<!-- 								</select>  -->
<%-- 								<font color="red" size="-1">${MsgMap.errorGender}</font> --%>
							</div>
							<div class="form-group col-md-4">
									<form:label path="mUid">身分證：</form:label>
									<form:input path="mUid" class="form-control" placeholder="A123456789"/>
									<form:errors path="mUid" class="error"/>
							
<!-- 								<label for="inputZip">身分證：</label> <input type="text" -->
<%-- 									name="mUid" value="${param.mUid}" class="form-control" --%>
<%-- 									placeholder="A123456789"> <font color="red" size="-1">${MsgMap.errorUid}</font> --%>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
									<form:label path="mEmail">電子信箱：</form:label>
									<form:input path="mEmail" class="form-control" placeholder="example@gmail.com"/>
									<form:errors path="mEmail" class="error"/>
							
<!-- 								<label for="inputCity">電子信箱：</label> <input type="email" -->
<%-- 									name="mEmail" value="${param.mEmail}" class="form-control" --%>
<!-- 									placeholder="example@gmail.com"> <font color="red" -->
<%-- 									size="-1">${MsgMap.errorEmail}</font> --%>
							</div>
							<div class="form-group col-md-3">
									<form:label path="mBDay">生日：</form:label>
									<form:input path="mBDay" class="form-control" type="date"/>
									<form:errors path="mBDay" class="error"/>
							
<!-- 								<label for="inputCity">生日：</label> <input type="date" -->
<%-- 									name="mBDay" value="${param.mBDay}" class="form-control" --%>
<%-- 									placeholder="1990-06-01"> <font color="red" size="-1">${MsgMap.errorBirthday}</font> --%>
							</div>
							<!-- <div class="form-group col-md-3">
                          <label for="inputState">生日：</label>
                          <select id="inputState" class="form-control">
                            <option selected>Choose...</option>
                            <option>...</option>
                          </select> -->
							<div class="form-group col-md-3">
									<form:label path="mPhone">電話：</form:label>
									<form:input path="mPhone" class="form-control" placeholder="0988123456"/>
									<form:errors path="mPhone" class="error"/>
							
<!-- 								<label for="inputZip">電話：</label> <input type="text" -->
<%-- 									name="mPhone" value="${param.mPhone}" class="form-control" --%>
<%-- 									placeholder="0988123456"> <font color="red" size="-1">${MsgMap.errorTel}</font> --%>
							</div>
						</div>
						<div class="form-group">
									<form:label path="mMultipartFile">會員照片：</form:label>
									<form:input path="mMultipartFile" class="form-control" type="file"/>
									<form:errors path="mMultipartFile" class="error"/>
<!-- 							<label for="inputZip">會員照片：</label> <input -->
<!-- 								name='memberMultipartFile' type='file' /> -->
						</div>
						<div class="form-group form-check mt-3">			
							<input type="checkbox" class="form-check-input"> <label
								class="form-check-label" for="exampleCheck1">我已閱讀並同意服務條款及隱私權政策</label>
						</div>



						<button type="submit" class="btn btn-primary w-100">註冊</button>


					</form:form>

					
				</div>
			</div>


		</div>

	</div>




	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>


</body>
</html>