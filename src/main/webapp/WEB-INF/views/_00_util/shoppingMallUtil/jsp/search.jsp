<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>search</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- icon cdn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<style>
#container_search {
/* 	margin-bottom: 20px; */
font-size: 20px;
}
}

#want {
	font-size: 25px;
	width:20%;
}

/* 跑馬燈開始 */
#Marquee{
  /* border: 1px solid red; */
  display: flex;
  padding-left: 160px;
  align-items: center;   
}
#Marquee h3{
  /* border: 1px solid red; */
  font-size: 1rem;
  padding: 5px;
}
#Marquee ul{
  /* border: 1px solid red; */
  list-style:none;
  height:30px;
  overflow:hidden;
  /* display: flex; */
  /* flex-direction: column;*/
  
}
#Marquee ul li:first-child{
  /* border: 1px solid red; */
  margin: 7px 0;
  width:100%;

}

/* 跑馬燈結束 */

</style>

</head>
<body>

	<div class="container" id="container_search">
		<div class="row">
			<div class="col-5">
				<span id="want">想買什麼?</span>
				<div style="display: inline-flex;  width:60%; ">
					<form class="input-group mb-3"action="${pageContext.request.contextPath}/merchandiseSearchResult" method="get">
						<input class="form-control" type="search" name="searchWord"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-secondary" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</form>

<%-- 					<form class="d-flex" action="${pageContext.request.contextPath}/merchandiseSearchResult" method="get"> --%>
<!-- 						<input class="form-control me-2" type="search" name="searchWord" -->
<!-- 							placeholder="Search" aria-label="Search"> -->
<!-- 						<button class="btn btn-outline-success" type="submit"> -->
<!-- 							<i class="fas fa-search"></i> -->
<!-- 						</button> -->
<%-- 					</form> --%>

				</div>
			</div>
			<div class="col" id="Marquee">
				<ul id="news">
					<li>代購商城全館8折!!請輸入折扣代碼 : SPOTSTOURJAVA015</li>
					<li>熱銷商品 : MAMA泰國泡麵，紫玉酥禮盒，焦糖奶油餅 <i class="fas fa-cookie-bite"></i></li>
					<li><i class="fas fa-bell"></i> 2021年最新版! 推薦十大熱門商品! 促銷優惠!</li>
					<li><a href="${pageContext.request.contextPath}/merchandiseSearchResult">零食餅乾團購更便宜，食品團購量販買多省多，立即前往 <i class="far fa-hand-pointer"></i></a></li>
				</ul>
			</div>

		</div>

	</div>


<%-- 	<script src="<c:url value='/_00_util/shoppingMallUtil/javascript/marquee.js'></c:url>"></script> --%>

	<!-- jQuery ----------------------------------------------------------------------------------->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
	<script>
	$(function () {
// 		alert()
	    setInterval(function(){
	    $('#news li:first-child').slideUp(function(){
// 	    	alert()
	        $(this).appendTo($('#news')).slideDown();
	    });
	    
	    },4000);
	    
	});
	</script>
</body>
</html>