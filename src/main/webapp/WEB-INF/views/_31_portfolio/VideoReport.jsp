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
	
<!-- <style>
       #viedo_name {
            font-size: 1.5rem;
        }

        .title {
            font-size: 2rem;
        }
        textarea{
            width: 100%;
        }
    </style>-->

<title>檢舉影片</title>
<link rel="stylesheet" href="button.css">
<link rel="stylesheet" href="font.css">
<style>
body {
	margin: 0px;
}

#first { /*最外層的div，包含所有*/
	/* border: rgb(219, 67, 67) solid 1px; */
	text-align: center;
	margin: auto;
	width: 60%;
}

#scoend { /*div，檢舉類型選單*/
	/* border: rgb(32, 4, 4) solid 1px; */
	height: 30px;
	text-align: left;
}

#button { /*確定、送出的按鈕排版*/
	text-align: right;
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

		<div id="first">
			<h2>影片標題 : 原來真的有枕頭山 上傳者 :多拉A 先生</h2>
			<form>
				<div>
					<input type="text" name="Reportdescription" placeholder="請輸入內容"
						style="font-size: 20px; font-family: 'Tahoma'; padding: 6px; width: 100%; padding-bottom: 300px;">


					<div id="scoend">
						<form>
							<select name="Report" id="Report"
								style="background-color: rgb(208, 210, 212); border-radius: 3px; border: 1px solid rgb(0, 0, 0);">
								<option value="violence">血腥暴力</option>
								<option value="pornography">色情內容</option>
								<option value="ImproperPofit">不當營利</option>
							</select>
						</form>
					</div>

					<div id="button">
						<button>取消</button>
						<button>確定送出</button>
					</div>
				</div>

			</form>
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