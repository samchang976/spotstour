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
	href="<c:url value='/_00_util/shoppingMallUtil/css/managerLayout.css'></c:url>">
<title>註冊會員</title>
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
</style>
<body>
	<!--內嵌header  -->
	<div
		style="position: fixed; width: 100%; background-color: rgba(155, 146, 146, 0.705); top: 0px; z-index: 5;">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>

	<!--  -->
	<div class="container">
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
					<div class="col-10 col-md-6 col-lg-8">


						<form method="POST" modelAttribute="memberBean"
							enctype='multipart/form-data'>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">帳號：</label> <input type="text"
										name="memberId" value="${param.memberId}" class="form-control"
										placeholder="6-10個字元英數混合不含特殊符號"> <font color="red"
										size="-1">${MsgMap.errorIdEmpty}${MsgMap.errorIdDup}</font>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">姓名：</label> <input type="text"
										name="mName" value="${param.mName}" class="form-control">
									<font color="red" size="-1">${MsgMap.errorName}</font>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">密碼：</label> <input type="password"
										name="mPw" class="form-control"
										placeholder="6-10個字元英數混合不含特殊符號"> <font color="red"
										size="-1">${MsgMap.errorPasswordEmpty}${MsgMap.passwordError}</font>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">密碼確認：</label> <input
										type="password" name="mPw1" class="form-control"
										placeholder="6-10個字元英數混合不含特殊符號"> <font color="red"
										size="-1">${MsgMap.errorPassword1Empty}</font>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputCity">地址：</label> <input type="text"
										name="d_mAddress" value="${param.d_mAddress}"
										class="form-control"> <font color="red" size="-1">${MsgMap.errorAddr}</font>
								</div>
								<div class="form-group col-md-2">
									<label for="inputState">性別：</label> <select id="inputState"
										name="mGender" class="form-control">
										<option selected>女</option>
										<option>男</option>
										<option>不告訴你</option>
									</select> <font color="red" size="-1">${MsgMap.errorGender}</font>
								</div>
								<div class="form-group col-md-4">
									<label for="inputZip">身分證：</label> <input type="text"
										name="mUid" value="${param.mUid}" class="form-control"
										placeholder="A123456789"> <font color="red" size="-1">${MsgMap.errorUid}</font>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputCity">電子信箱：</label> <input type="email"
										name="mEmail" value="${param.mEmail}" class="form-control"
										placeholder="example@gmail.com"> <font color="red"
										size="-1">${MsgMap.errorEmail}</font>
								</div>
								<div class="form-group col-md-3">
									<label for="inputCity">生日：</label> <input type="date"
										name="mBDay" value="${param.mBDay}" class="form-control"
										placeholder="1990-06-01"> <font color="red" size="-1">${MsgMap.errorBirthday}</font>
								</div>
								<!-- <div class="form-group col-md-3">
                          <label for="inputState">生日：</label>
                          <select id="inputState" class="form-control">
                            <option selected>Choose...</option>
                            <option>...</option>
                          </select> -->
								<div class="form-group col-md-3">
									<label for="inputZip">電話：</label> <input type="text"
										name="mPhone" value="${param.mPhone}" class="form-control"
										placeholder="0988123456"> <font color="red" size="-1">${MsgMap.errorTel}</font>
								</div>
							</div>
							<div class="form-group">
								<label for="inputZip">會員照片：</label> <input
									name='memberMultipartFile' type='file' />
							</div>
							<div class="form-group form-check mt-3">
								<input type="checkbox" class="form-check-input"> <label
									class="form-check-label" for="exampleCheck1">我已閱讀並同意服務條款及隱私權政策</label>
							</div>



							<button type="submit" class="btn btn-primary w-100">註冊</button>


						</form>

						${param.message}${MsgOK.InsertOK}<br> <br>
						<%
							// 顯示MsgOK.InsertOK後，就要立刻移除，以免每次回到首 頁都會顯示新增成功的訊息
						session.removeAttribute("MsgOK");
						%>
					</div>
				</div>


			</div>

		</div>

		<%--   ${param.message}${MsgOK.InsertOK}<br> --%>
		<!--  <br>   -->
		<%--  <% // 顯示MsgOK.InsertOK後，就要立刻移除，以免每次回到首 頁都會顯示新增成功的訊息 --%>
		<!-- //       session.removeAttribute("MsgOK");    -->
		<%-- %>  --%>
	</div>
	<!--內嵌footer  -->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>


</body>
</html>