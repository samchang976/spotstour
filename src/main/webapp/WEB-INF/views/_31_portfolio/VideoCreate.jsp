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
	href="<c:url value='/_00_util/shoppingMallUtil/css/shoppingMallLayout.css'></c:url>">
<!-- --------------------------------------------------------------------------------------------------------->

<!--     <style> 
/*         #viedo_name { */
/*             font-size: 1.5rem; */
/*         } */

/*         .title { */
/*             font-size: 2rem; */
/*         } */
/*         input{ */
/*             width: 100%; */
/*             padding-bottom: 250px; */
/*         } */
    </style> -->

<title>影片新增</title>
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
		<!-- 影片新增 -->
		<div class="row">
			<div class="col">
				<div class="title">影片新增</div>
			</div>
		</div>

		<div class="row row-cols-1 row-cols-md-2">
			<div class="col"></div>
			<div class="col">
				<div id="viedo_name">枕頭山</div>
			</div>
		</div>

		<div class="row row-cols-1 row-cols-md-2">
			<div class="col">
				觀看次數 :<span>123456</span>次 <i class="fas fa-bookmark"></i> 收藏(<span>1234</span>次)

			</div>
			<div class="col">
				<i class="fas fa-map-marker-alt"></i> 位置: <span>732臺灣臺南市白河區</span>
			</div>
		</div>

		<div class="row row row-cols-1 row-cols-md-2">
			<div class="col">
				<video src="/a.mp4" controls class="w-100"></video>
			</div>
			<div class="col">
				<div>影片描述:</div>
				<div>
					<form action="">
						<input type="text" placeholder="請輸入影片描述">
					</form>
				</div>
			</div>
		</div>
		<div class="row ">
			<div class="col-md-6"></div>
			<div class="col">
				<select class="form-select" aria-label="Default select example">
					<option selected>選擇預覽方式</option>
					<option value="time">預覽</option>
					<option value="look">播放頁預覽</option>
					<option value="good">世界地圖資訊預覽</option>
				</select>
			</div>
			<div class="col">
				<button class="Bt_blue">儲存</button>
				<button class="Bt_blue">取消</button>

			</div>
		</div>
	</div>
<!-----------定位----------------------------------------------------------------------------->       
      </div>	
<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
<!-- --------------------------------------------------------------------------------------->
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>

</html>