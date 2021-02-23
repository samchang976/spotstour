<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>管理退貨商品列表</title>
<link rel="stylesheet" href="button.css">
<link rel="stylesheet" href="font.css">
</head>
<style>
body {
	text-align: center;
}

#pnumber {
	display: none;
}

#pname {
	display: none;
}

#label {
	text-align: center;
}

#rule {
	text-align: left;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<form id="label">
		<dspan>關於商品資訊</span>
		<br>
		<span>退換貨</span>
		<br>
		<span>配送方式</span>
		<br>

		<br>
		<span><input type="text" id="pnumber"></span>
		<br>
		<span><input type="text" id="pname"></span> <br>
		<div id="rule">
			<ul>
				<li>・於商品到達簽收後「7日內」商品,並與我們聯繫退貨服務。</li>
				<li>・以本公司判斷為基準,符合「未使用商品」。</li>
				<li>・於商品到達簽收後「10日內」寄回之商品。</li>
				<li>・商品頁面中記載「不可退貨」商品,在此情況下不得退貨。</li>
			</ul>
		</div>
	</form>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
</body>
</html>