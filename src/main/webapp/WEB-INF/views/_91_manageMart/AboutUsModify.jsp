<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>編輯關於我們</title>
<style>
.value {
	font-size: 48px;
	color: #0e9e01;
	margin: 20px;
}

.text {
	display: block;
	text-align: center;
	font: sans-serif;
	color: #272727;
	font-size: 13px;
}

.item {
	display: inline-block;
}

.content {
	width: 650px;
	display: inline-block;
	font-family: sans-serif;
}

.circle {
	margin: 0 auto;
	width: 80px;
	height: 80px;
	border-radius: 999em;
	background-color: rgb(136, 133, 133);
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/header.jsp" />
	<div class="content" id="facts">
		<div class="item">
			<div class="circle"></div>
			<span class="value">4247</span> <span class="text">PANORAMAS</span>
		</div>
		<div class="item">
			<div class="circle"></div>
			<span class="value">155</span> <span class="text">360° VIDEO</span>
		</div>
		<div class="item">
			<div class="circle"></div>
			<span class="value">1</span> <span class="text">A NEW </span>
		</div>
		<div class="item">
			<div class="circle"></div>
			<span class="value">2012</span> <span class="text">THIS YEAR"</span>
		</div>
		<div class="item">
			<div class="circle"></div>
			<span class="value">386</span> <span class="text">FAMOUS</span>
		</div>
		<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit.
			Debitis repellendus molestiae, soluta voluptatibus eveniet id illo
			molestias, similique iste quam quas autem voluptates adipisci
			veritatis eum itaque at tempore. Quasi aut dolore vel consequuntur
			quibusdam nesciunt nisi perferendis nobis accusantium possimus,
			distinctio ipsam, sit numquam eveniet repellat asperiores non itaque
			magni veritatis iure. Magnam eveniet, eum, explicabo quisquam
			excepturi suscipit, fugit totam nisi cum aperiam alias ducimus.
			Dolores expedita ex debitis eius, provident nulla veniam sint itaque
			soluta quos animi nesciunt dignissimos perspiciatis, minima
			asperiores facilis saepe hic consequatur praesentium harum voluptas
			ea. Repudiandae accusantium culpa vero totam atque tenetur.</p>
		<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit.
			Debitis repellendus molestiae, soluta voluptatibus eveniet id illo
			molestias, similique iste quam quas autem voluptates adipisci
			veritatis eum itaque at tempore. Quasi aut dolore vel consequuntur
			quibusdam nesciunt nisi perferendis nobis accusantium possimus,
			distinctio ipsam, sit numquam eveniet repellat asperiores non itaque
			magni veritatis iure. Magnam eveniet, eum, explicabo quisquam
			excepturi suscipit, fugit totam nisi cum aperiam alias ducimus.
			Dolores expedita ex debitis eius, provident nulla veniam sint itaque
			soluta quos animi nesciunt dignissimos perspiciatis, minima
			asperiores facilis saepe hic consequatur praesentium harum voluptas
			ea. Repudiandae accusantium culpa vero totam atque tenetur.</p>


	</div>

	<br>
	<br>
	<br>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/footer.jsp" />
</body>
</html>