<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登出</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
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
        <td colspan="2"><input type="submit" name="submit"
            value="回首頁"></td>
    </tr>
</table>
</form>

	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
</body>
</html>