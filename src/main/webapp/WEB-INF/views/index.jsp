<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%-- <jsp:useBean id="SYSTEM" class="_00_init.util.GlobalService" scope="application"/> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="AppName" value="${SYSTEM.systemName}" scope="application" />
<title>${AppName}</title>

<!-- css連結-------------------------------------------------------------------------------- -->
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/utilLayout.css'></c:url>">
	
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/utilFont.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/utilColor.css'></c:url>">
<!-- -------------------------------------------------------------------------------------- -->
</head>
<body>
<!--header=================================================================================  -->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
<!-------------------------------------------------------------------------------------------->

	<!-- 設定變數funcName的值為"IND", top.jsp會使用此變數-->
	<c:set var="funcName" value="IND" scope="session" />

		<!-- 		<h1> -->
		<%-- 					歡迎光臨<br> <font color='RED'>${AppName}</font><br> --%>
		<!-- 			天天有優惠，天天有好康<br> 今天舉辦<font color='BLUE'>滿佰送仟</font>的促銷活動<br> -->
		<!-- 		</h1> -->
		<!-- 		<br> -->
		<!-- 		<h2>本店絕不販賣盜版書、山寨書與過期書</h2> -->
		<!-- 		<hr> -->
		<!-- 		<p style='font-family: "Verdana"; color: red'> -->
		<!-- 			本範例需要先執行_00_init.EDMTableReset.java來建立初始資料</p> -->
<%-- 影片輪播============================================================================== --%>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-bs-ride="carousel">
			<!-- 選擇影片的框框 -->
			<ol class=" carousel-indicators" >
				<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
					class="active"></li>
				<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
				<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
			</ol>
			<!--  -->
			<div style="width: 100%;" class="carousel-inner">
				<div id="first" class="carousel-item active">
					<video src="${pageContext.request.contextPath}/images/a.mp4"
						class="d-block w-100" autoplay loop muted></video>
				</div>
				<div class="carousel-item">
					<video src="${pageContext.request.contextPath}/images/a.mp4"
						class="d-block w-100" autoplay loop muted></video>
				</div>
				<div class="carousel-item">
					<video src="${pageContext.request.contextPath}/images/a.mp4"
						class="d-block w-100" autoplay loop muted></video>
				</div>
			</div>
			<!--  -->
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-bs-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-bs-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
			</a>
		</div>
<%-- ============================================================================================================== --%>
	<div class="overlay">
		<p>SPOTS-TOUR</p>
	
						<!-- 						servlet讀取前端畫面資料寫法 -->
						<!-- 						<form class="d-flex" action="PortfolioSearchServlet" method="get"> -->
						<!-- 							<input class="form-control me-2" type="text" name="searchword"  -->
						<!-- 								placeholder="Search" aria-label="Search"> -->
						<!-- 							<button class="btn btn-outline-success" type="submit"> -->
						<!-- 								<i class="fas fa-search"></i> -->
						<!-- 							</button> -->
						<!-- 						</form> --
						<!-- 							spring MVC讀取前端畫面資料寫法 -->
						<%-- 						<form:form method="GET"  --%>
						<%-- 							class="d-flex" action="/SearchResult" modelAttribute="ContinentBean"> --%>
						<%-- 							<form:input class="form-control me-2" type="text" path="searchWord" --%>
						<%-- 								placeholder="Search" aria-label="Search" /> --%>
						<!-- 							<button class="btn btn-outline-success" type="submit"> -->
						<!-- 								<i class="fas fa-search"></i> -->
						<!-- 							</button> -->
						<%-- 						</form:form> --%>
 		<%-- 搜尋欄	=================================================================================================================	 --%>
		<form class="d-flex" action="SearchResult" method="get">
			<input class="form-control me-2" type="text" name="searchWord"  placeholder="Search" aria-label="Search"> 
 			<button class="btn btn-outline-success" type="submit"> 
 				<i class="fas fa-search"></i> 
			</button> 
 		</form> 
	</div>
<%-- =================下面有佔空間，白色的區塊======================================================================== --%>
				${registerOK} ${Login} ${FlashMSG_farewell} ${SUCCESS} ${param.message}${MsgOK.InsertOK}<br> <br>
				<%
				session.removeAttribute("MsgOK");
				session.removeAttribute("registerOK");
				session.removeAttribute("Login");
				session.removeAttribute("SUCCESS");
				%>
<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
<!-- --------------------------------------------------------------------------------------->
</body>
</html>
