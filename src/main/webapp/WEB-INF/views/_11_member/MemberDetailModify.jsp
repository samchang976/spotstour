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
<title>會員個人資料</title>
<link rel="stylesheet" href="button.css">
<link rel="stylesheet" href="font.css">
<style>
#phto {
	/* border: solid 1px slategrey; */
	width: 200px;
	height: 600px;
	float: left;
}

div {
	margin-bottom: 10px;
	/* border: solid 1px slategrey; */
}

select {
	margin-bottom: 10px;
}

#genderBlock {
	float: left;
	margin-right: 15px;
}
</style>
</head>
<body>
	<!--內嵌header  -->
	<div
		style="position: fixed; width: 100%; background-color: rgba(155, 146, 146, 0.705); top: 0px; z-index: 5;">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>

	<!--  -->
	<div class="container">
		待修改
		<div style="margin: 150px;">
			<!-- 文字表單區塊 -->
			<!-- border: 1px solid saddlebrown; -->

			<div id="phto" style="margin-right: 30px;">
				<!-- 照片+更換照片區塊 -->
				<div
					style="width: 200px; height: 200px; border: solid 1px rgb(35, 33, 48);">
					<!-- <img src="" alt=""> -->
				</div>
				<i class="fas fa-plus-circle fa-2x"></i> <span>更換照片</span>
			</div>


			<div>
				<div>姓名或暱稱:</div>
				<label for="name"> </label> <input type="text" name="name" id="name">
			</div>
			<div>
				<div>生日:</div>
				<label for="bitthday"> </label> <input type="date" name="bitthday"
					id="bitthday">
			</div>

			<div style="padding-bottom: 1px;">
				<!-- 排版用 : 性別和手機的區塊 -->
				<div id="genderBlock">
					<div>性別:</div>
					<form>
						<select name="gender" id="gender">
							<option value="violence">男性</option>
							<option value="pornography">女性</option>
							<option value="ImproperPofit">秘密</option>
						</select>
					</form>
				</div>
				<div>
					<div>手機或電話:</div>
					<label for="phone"></label> <input type="text" name="phone"
						id="phone">
				</div>
			</div>

			<div>地址:</div>
			<label for="phone"></label> <input type="text" name="phone"
				id="phone">

			<!-- 預留可以加的欄位，如果這邊欄位格是跑掉可以把 #phto的height調高 -->
			<!-- <div>身分證字號</div>
        <label for="IdNumber" ></label>
        <input type="text" name="IdNumber" id="IdNumber">   
 
        <div>身分證字號</div>
        <label for="IdNumber" ></label>
        <input type="text" name="IdNumber" id="IdNumber"> 

         
        <div>身分證字號</div>
        <label for="IdNumber" ></label>
        <input type="text" name="IdNumber" id="IdNumber">  -->

		</div>

		<button style="margin-left: 250px;">確定送出</button>
	</div>
	<!--內嵌footer  -->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>

</body>
</html>