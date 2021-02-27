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
<style>

/* img {
			width: 700px;
			height: 600px;
		} */
.menuOuter {
	padding: 5px;
	width: 100%;
}

#option1 {
	display: inline-block;
}

#option2 {
	float: right;
	display: inline-block;
}

/* 控制SPOTS-TOUR跟search BAR  */
.overlay {
	/* position: absolute; */
	/* color: red; */
	/* background-color: aqua; */
	position: fixed;
	/* 	margin-left: 10px; */
	margin: 10%;
	/* align-items: center;  */
	top: 10%;
	/* background-color: aquamarine; */
	/* margin-left: 130res; */
	/* z-index: 5; */
}

.container {
	align-items: center;
	justify-content: center;
}

/* .overlay p { */
/* margin-left: 10px; */
/* font-size: 100px; */
/* color: deepskyblue; */

/* } */
html {
	font-size: 14px;
}

.overlay p {
	font-size: 4.5rem;
	color: deepskyblue;
}

@media ( min-width : 300px) and (max-width: 1200px) {
	.overlay p {
		/* 		font-size: calc(4.5rem + ( 20.3 -4.5)* ((300vw- 1200px)/(1200- 600))); */
		font-size: 5rem;
		color: deepskyblue;
	}
}

@media ( min-width : 1200px) {
	.overlay p {
		font-size: 10rem;
		color: deepskyblue;
	}
}

/* #input {
				width: 100%;
				outline: none;
				color: #7d7d7d;
				font-size: 14px;
				line-height: 32px;
				background: #ffffff;
				display: inline-block;
				border: 0px;
				padding: 10px 87px 10px 12px;
				margin: 0;
				border-radius: 4px;
				box-sizing: border-box
			} */

/* #index_head_search_btn {
				position: absolute;
				display: block;
				cursor: pointer;
				background: #51b72d 50% 50% no-repeat;
				padding: 0;
				margin: 0;
				right: -1px;
				top: 165px;
				width: 75px;
				height: 24.9%;
				border: 0;
				border-radius: 0 4px 4px 0; */

/* } */
a, i {
	text-decoration: none;
	color: #000;
}

a, i:hover {
	color: #ddd;
}
</style>
</head>
<body>
	<!--內嵌header  -->
	<div
		style="position: fixed; width: 100%; background-color: rgba(155, 146, 146, 0.705); top: 0px; z-index: 5;">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<!-- 設定變數funcName的值為"IND", top.jsp會使用此變數-->
	<c:set var="funcName" value="IND" scope="session" />
	<div align='center'>
		<!-- 		<h1> -->
		<%-- 					歡迎光臨<br> <font color='RED'>${AppName}</font><br> --%>
		<!-- 			天天有優惠，天天有好康<br> 今天舉辦<font color='BLUE'>滿佰送仟</font>的促銷活動<br> -->
		<!-- 		</h1> -->
		<!-- 		<br> -->
		<!-- 		<h2>本店絕不販賣盜版書、山寨書與過期書</h2> -->
		<!-- 		<hr> -->
		<!-- 		<p style='font-family: "Verdana"; color: red'> -->
		<!-- 			本範例需要先執行_00_init.EDMTableReset.java來建立初始資料</p> -->

		<div id="carouselExampleIndicators" class="carousel slide"
			data-bs-ride="carousel">
			<!-- 選擇影片的框框 -->
			<ol class=" carousel-indicators">
				<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
					class="active"></li>
				<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
				<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
			</ol>
			<!--  -->
			<div style="width: 100%; height: 600px;" class="carousel-inner">
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

		<div class="container">
			<div class="overlay">
				<div class="row">
					<div class="col-12">
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
 						<form class="d-flex" action="SearchResult" method="get">
							<input class="form-control me-2" type="text" name="searchWord"  
								placeholder="Search" aria-label="Search"> 
 							<button class="btn btn-outline-success" type="submit"> 
 								<i class="fas fa-search"></i> 
							</button> 
 						</form> 

					</div>

				</div>
			</div>
		</div>
		${param.message}${MsgOK.InsertOK}<br> <br>
		<%
			// 顯示MsgOK.InsertOK後，就要立刻移除，以免每次回到首 頁都會顯示新增成功的訊息
		session.removeAttribute("MsgOK");
		%>
		
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
</body>
</html>
