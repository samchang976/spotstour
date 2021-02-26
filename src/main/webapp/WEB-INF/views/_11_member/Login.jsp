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
	href="<c:url value='/_00_util/memberUtil/css/memberLayout.css'></c:url>">
<title>登入</title>
<style>
#main {
	position: relative;
	top: 50px;
	width: 100%;
	text-align: center;
}

#content {
	width: 500px;
	margin-left: auto;
	margin-right: auto;
}
</style>
<script type="text/javascript">
	//由<body>的onLoad事件處理函數觸發此函數
	function setFocusToUserId() {
		document.forms[0].userId.focus(); // 將游標放在userId欄位內
	}
</script>
</head>
<body onLoad="setFocusToUserId()"">
	<!--內嵌header  -->
	<div
		style="position: fixed; width: 100%; background-color: rgba(155, 146, 146, 0.705); top: 0px; z-index: 5;">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>

	<!--  -->
	<div class="container">
		<!-- 下列敘述設定變數funcName的值為LOG，top.jsp 會用到此變數 -->
		<c:set var="funcName" value="LOG" scope="session" />
		<c:set var="msg" value="登入" />
		<c:if test="${ ! empty sessionScope.timeOut }">
			<!-- 表示使用逾時，重新登入 -->
			<c:set var="msg"
				value="<font color='red'>${sessionScope.timeOut}</font>" />
		</c:if>

		<Form action="<c:url value='login.do' />" method="POST"
			name="loginForm">
			<div id='content'>
				<Table style="border-width: 2; width: 500px; border-color: #EF02A4;">
					<TR>
						<TH width="180">&nbsp;</TH>
						<TH width="180">&nbsp;</TH>
					</TR>
					<!-- 				<TR> -->
					<!-- 					<TD colspan='2' align="CENTER" -->
					<!-- 						style="font-size: 0.6cm; font-weight: 300;"><Font -->
					<%-- 						color="#006600" face="標楷體"> ${AppName} </Font></TD> --%>
					<!-- 				</TR> -->
					<!-- 				<TR> -->
					<!-- 					<TD height='50' colspan='2' align="CENTER" -->
					<!-- 						style="font-size: 0.5cm; font-weight: 300;"><Font -->
					<%-- 						color="#006600" face="標楷體"> ${msg} </Font></TD> --%>
					<!-- 				</TR> -->
					<tr height='10'>
						<TD align="CENTER" colspan='2'>&nbsp;</TD>
					</tr>
					<tr>
						<TD width="180" align="right">帳號：</TD>
						<TD width="180" colspan='2' align="LEFT"><input type="text"
							name="userId" size="10"
							value="${requestScope.user}${param.userId}"> &nbsp;<small><Font
								color='red' size="-3">${requestScope.ErrorMsgKey.AccountEmptyError}
							</Font></small></TD>
					</tr>
					<tr>
						<TD width="180" align="right">密碼：</TD>
						<TD width="180" colspan='2' align="LEFT"><input
							type="password" name="mPw" size="10"
							value="${requestScope.password}${param.mPw}"> &nbsp;<small><Font
								color='red' size="-3">${requestScope.ErrorMsgKey.mPwEmptyError}
							</Font></small></TD>

					</tr>
					<tr>
						<TD width="180" align="right"><input type="checkbox"
							name="rememberMe"
							<c:if test='${requestScope.rememberMe==true}'>
                  
                  checked='checked'
               </c:if>
							value="true"></TD>
						<TD width="180" colspan='2' align="left"><small>記住密碼</small></TD>
					</tr>
					<tr height='10'>
						<TD align="CENTER" colspan='2'>&nbsp;<Font color='red'
							size="-1"> ${ErrorMsgKey.LoginError}&nbsp;</Font></TD>
					</tr>
					<tr>
						<TD colspan="2" align="center"><input type="submit"
							value="提交"></TD>
					</tr>
					<tr height='10'>
						<TD align="CENTER" colspan='2'>&nbsp;</TD>
					</tr>
				</Table>
			</div>
		</Form>
	</div>
	<!--內嵌footer  -->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
</body>
</html>