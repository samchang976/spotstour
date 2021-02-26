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
<title>登出</title>
</head>
<body>
	<!--內嵌header  -->
	<div
		style="position: fixed; width: 100%; background-color: rgba(155, 146, 146, 0.705); top: 0px; z-index: 5;">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>

	<!--  -->
	<div class="container">
		<!-- 先將使用者名稱取出 -->
		<c:set var="memberName" value="${ LoginOK.mName }" />
		<!-- 移除放在session物件內的屬性物件 -->
		<c:remove var="LoginOK" scope="session" />
		<c:remove var="ShoppingCart" scope="session" />
		<!-- 下列敘述設定變數funcName的值為OUT，top.jsp 會用到此變數 -->
		<c:set var="funcName" value="OUT" scope="session" />
		<!-- 引入共同的頁首 -->
		<!-- 下列六行敘述設定登出後要顯示的感謝訊息 -->
		<c:set var="logoutMessage" scope='session'>
			<font color='blue'><BR> 訪客${ memberName }，感謝您使用本系統。<BR>
				您已經登出<BR> </font>
		</c:set>

		<%-- 	<jsp:useBean id='logoutBean' class='_02_login.model.LogoutBean' --%>
		<%-- 		scope='page' /> --%>

		<%-- 	<c:set target='${logoutBean}' property='session' --%>
		<%-- 		value='${pageContext.session}' /> --%>

		<%-- 	${ logoutBean.logout } --%>

		<form name="form1" action="" method="post">
			<table width="200" border="1">
				<tr>
					<td colspan="2">已登出</td>
				<tr>
					<td colspan="2"><input type="submit" name="submit" value="回首頁"></td>
				</tr>
			</table>
		</form>
	</div>
	<!--內嵌footer  -->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>

</body>
</html>