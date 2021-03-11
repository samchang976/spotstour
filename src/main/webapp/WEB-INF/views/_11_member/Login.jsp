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

<title>登入</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Lora&family=Noto+Sans+TC:wght@300&display=swap')
	;

.container {
	font-family: 'Noto Sans TC';
}
.error {
	color: red;
	display: inline-block;
	font-size: 10pt;
}
 #main { 
 	position:relative; 
 	top: 50px; 
     width:100%; 
     text-align:center; 
 } 
 #content { 
   width: 500px ; 
   margin-left: auto ; 
   margin-right: auto ; 
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

<c:set var="funcName" value="LOG" scope="session"/>
<c:set var="msg" value="登入" />
<c:if test="${ ! empty sessionScope.timeOut }" > <!-- 表示使用逾時，重新登入 -->
   <c:set var="msg" value="<font color='red'>${sessionScope.timeOut}</font>" />
</c:if>


<form:form method="POST" modelAttribute="memberBean">
                                         
  <div id='content'>
    <Table  style="border-width:2; background:#E0E0E0; width: 500px;">

         <TR>
             <TD height='50' colspan='2' align="CENTER" style="font-size:0.8cm"> 
                <Font color="#000000">
                    ${msg}<br>
                    
                </Font>
             </TD>
         </TR>

         <TR height='20'>
             <TD align="CENTER" colspan='2'>
             	&nbsp;
             </TD>
         </TR>
         <TR>
             <TD width="180" align="right">帳號：　</TD>
             <TD width="180" colspan='2' align="LEFT">
	             <form:input  path="mAN" size="16" />
    	         <form:errors  path="mAN" cssClass="error" /><br>
             </TD>
         </TR>
         <TR>
             <TD width="180" align="right">密碼：　</TD>
             <TD width="180" colspan='2' align="LEFT" >
             	<form:input  type="password" path="mPw" size="16" />
             	<form:errors  path="mPw" cssClass="error" /><br>
             </TD>
             
         </TR>  
         <tr>
         <TD width="180" align="right" >
				
			<input type="checkbox">
						
         </TD>
         <TD width="180"  colspan='2' align="left"><small>記住密碼</small></TD>
         </tr>
         <TR height='20'>
             <TD> &nbsp;</TD>   
             <TD Class="error">${LoginError}</TD>
         </TR>

        <TR>
            <TD colspan="2" align="center"><input type="submit" value="提交"> </TD>
         </TR>
         <TR height='10'>
             <TD align="CENTER" colspan='2'>&nbsp;</TD>
         </TR>
         
    </Table>
  </div>
</form:form>
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