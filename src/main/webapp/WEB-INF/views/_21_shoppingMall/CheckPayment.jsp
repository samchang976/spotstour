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
	href="<c:url value='/_00_util/shoppingMallUtil/css/shoppingMallLayout.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/shoppingMallUtil/css/shoppingMallColor.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/shoppingMallUtil/css/shoppingMallFont.css'></c:url>">

<!-- --------------------------------------------------------------------------------------------------------->

<title>商城活動快訊詳細</title>
<%
	pageContext.setAttribute("test", request.getContextPath());

%>
</head>
<body>
	<!--header--------------------------------------------------------------------------->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<!-----------定位----------------------------------------------------------------------------->
	<div class="BodyPosition">
		<!-- 搜尋 ----------------------------------------------------------------------------->

		<table>
			<tr>
				<th>購買項目</th>
				<th>金額</th>
			</tr>
			<tr>
				<td><span id="feedback"></span></td>
				<td></td>
			</tr>
		</table>
		
		<form action="${test}/testRequestBody" method="post">
			<input name="username" value="1234">
			<input name="password" value="123">
			<input type="file" name="file">
			<input type="submit">
		</form>

		<form:form method="POST" modelAttribute="memberBean"
			enctype='multipart/form-data'>
			<div>信用卡付款</div>
<!-- 			<div> -->
<!-- 				<label>姓名</label><br> -->
<%-- 				<form:input path='mName' required="required" /> --%>
<!-- 			</div> -->

			<!-- 			<div> -->
			<%-- 				<form:errors path="mName" cssClass="error" /> --%>
			<!-- 			</div> -->

			<div>
				<label>信用卡卡號</label><br> <input required="required"
					maxlength="4" size="4" type="text" /> <input required="required"
					maxlength="4" size="4" type="text" /> <input required="required"
					maxlength="4" size="4" type="text" /> <input required="required"
					maxlength="4" size="4" type="text" />
			</div>

<!-- 			<div> -->
<%-- 				<form:errors path="mName" cssClass="error" /> --%>
<!-- 			</div> -->

			<div>
				<label>有效期限</label><br>
			</div>
			
			<div>
				<select>
					<option selected="selected" value="">請選擇月份</option>
					<option value="01">01月</option>
					<option value="02">02月</option>
					<option value="03">03月</option>
					<option value="04">04月</option>
					<option value="05">05月</option>
					<option value="06">06月</option>
					<option value="07">07月</option>
					<option value="08">08月</option>
					<option value="09">09月</option>
					<option value="10">10月</option>
					<option value="11">11月</option>
					<option value="12">12月</option>
				</select> <select>
					<option selected="selected" value="">請選擇年份</option>
					<option value="2021">2021</option>
					<option value="2022">2022</option>
					<option value="2023">2023</option>
					<option value="2024">2024</option>
					<option value="2025">2025</option>
					<option value="2026">2026</option>
					<option value="2027">2027</option>
					<option value="2028">2028</option>
					<option value="2029">2029</option>
					<option value="2030">2030</option>
					<option value="2031">2031</option>
					<option value="2032">2032</option>
					<option value="2033">2033</option>
					<option value="2034">2034</option>
					<option value="2035">2035</option>
					<option value="2036">2036</option>
					<option value="2037">2037</option>
					<option value="2038">2038</option>
					<option value="2039">2039</option>
					<option value="2040">2040</option>
				</select>
			</div>

			<!-- 			<div> -->
			<%-- 				<form:errors path="expiryMonth" cssClass="error" /> --%>
			<%-- 				<form:errors path="expiryYear" cssClass="error" /> --%>
			<!-- 			</div> -->

			<div>
				<label>背面後三碼</label><br> <input required="required" size="3"
					maxlength="3" />
			</div>

			<!-- 			<div> -->
			<%-- 				<form:errors path="cardCVV" cssClass="error" /> --%>
			<!-- 			</div> -->

			<hr>

			<div>持卡人資料</div>
			<div>
				<label>持卡人姓名</label><br>
				<form:input path='mName' placeholder="請輸入持卡人姓名" required="required" />
			</div>

			<!-- 			<div> -->
			<%-- 				<form:errors path="mName" cssClass="error" /> --%>
			<!-- 			</div> -->

			<div>
				<label>手機號碼</label><br>
				<form:input path='mPhone' required="required" />
			</div>

			<!-- 			<div> -->
			<%-- 				<form:errors path="mPhone" cssClass="error" /> --%>
			<!-- 			</div> -->

			<div>
				<label>電子信箱</label><br>
				<form:input path='mEmail' required="required" type="email" />
			</div>

			<!-- 			<div> -->
			<%-- 				<form:errors path="mEmail" cssClass="error" /> --%>
			<!-- 			</div> -->

			<!-- 			<div> -->
			<%-- 				<form:errors path="d_mAddress" cssClass="error" /> --%>
			<!-- 			</div> -->


			<button type="submit" class="submit-btn register-btn"
				onclick="location.href='/studentMoney/checkout'">提交</button>
		</form:form>


		<script>
			value = localStorage.getItem('name');
			// alert(value);
			document.getElementById("feedback").innerHTML = value;
			// alert(feedback);
			money = document.getElementById('money');
			money.value = value;
		</script>


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
