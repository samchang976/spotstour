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
	href="<c:url value='/_00_util/portfolioUtil/css/portfolioLayout.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/portfolioUtil/css/portfolioFont.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/portfolioUtil/css/portfolioColor.css'></c:url>">
	
<!-- --------------------------------------------------------------------------------------------------------->
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
    <div class="container " id="container_VideoCreate">
        <!-- 影片新增 -->
        <div class="row">
            <div class="col">
                <div id="title">影片新增</div>
            </div>
        </div>

        <div class="row row-cols-1 row-cols-md-2">
            <div class="col SpotName">
                景點名稱:
                <input type="text" placeholder="請輸入景點名稱">
            </div>
            <div class="col LocationInformation">
                <i class="fas fa-map-marker-alt"></i>
                位置:
                <input type="text" placeholder="請輸入位置資訊">
            </div>
            
        </div>

        <div class="row row-cols-1 row-cols-md-2">
            <div class="col">
            </div>
            <div class="col">
                經度:<input type="text" placeholder="經度" id="longitude">
                緯度:<input type="text" placeholder="緯度" id="latitude">
            </div>
            
        </div>

        <div class="row row row-cols-1 row-cols-md-2">
            <div class="col" style="text-align: right;">
                <video src="/a.mp4" controls class="w-100"></video>
                <button class="Bt_black" type="submit">上傳影片</button>
            </div>
            
            <div class="col ViedoDescription">
                <div>影片描述:</div>
                <div>
                        <input type="text" placeholder="請輸入影片描述" >
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