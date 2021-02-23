<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>管理退貨商品列表</title>
<!-- <link rel="stylesheet" href="button.css">
    <link rel="stylesheet" href="font.css"> -->
</head>
<style>
body {
	text-align: center;
	font-size: 20px;
}

#form {
	margin: 50px auto;
	padding: 20px;
	text-align: left;
	/* border: 1px solid #cccccc; */
	width: 500px;
	height: 600px;
	font-size: 20px;
}

.auto {
	line-height: 20px;
	text-align: left;
	padding: 20px;
	margin: 5px;
	border: #ccc 1px solid;
	font-size: 20px;
}
/* .auto:nth-child(1){
        margin-bottom: 10px;
    } */
</style>
<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<div id="form">
		<div>關於商品資訊</div>
		<div>&nbsp;&nbsp;&nbsp;&nbsp;退換貨</div>
		<div>&nbsp;&nbsp;&nbsp;&nbsp;配送方式</div>

		<!-- 從DB抓資料填上 -->
		<div class="auto">
			<input type="hidden" id="pnumber" name="商品編號">
		</div>
		<br>
		<!-- 從DB抓資料填上 -->
		<div class="auto">
			<input type="hidden" id="pname" name="商品名稱">
		</div>

		<div id="rule">
			<ul>
				<li>・於商品到達簽收後「7日內」商品,並與我們聯繫退貨服務。</li>
				<li>・以本公司判斷為基準,符合「未使用商品」。</li>
				<li>・於商品到達簽收後「10日內」寄回之商品。</li>
				<li>・商品頁面中記載「不可退貨」商品,在此情況下不得退貨。</li>
			</ul>
		</div>

	</div>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
</body>
</html>