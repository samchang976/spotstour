<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
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

<title>活動快訊管理</title>
<style>
body {
	font-size: 20px;
}

.news {
	padding: 5px;
	/* border: 1px solid slateblue; */
}

.clear-block {
	clear: both;
}

.date {
	/* border:1px solid  rgb(73, 147, 221) ; */
	margin-right: 5px;
}
/* .discount{
            border:1px solid  rgb(36, 112, 189) ;
        } */
#news-text {
	border-bottom: 1px solid rgb(224, 224, 224);
	background: rgb(240, 240, 240);
	padding: 10px;
}

.block {
	border-bottom: 1px solid rgb(224, 224, 224);
	padding: 5px;
}

#want {
	/* border: solid 1px slategrey; */
	font-size: 20px;
}

button { /*按鈕的樣式*/
	padding: 10px;
	color: rgb(24, 24, 168);
	border: 1px rgb(24, 24, 168) solid;
	background-color: rgb(245, 241, 242);
	border-radius: 5px;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<!-- 搜尋列 -->
	<div class="container" style="margin: 10px;">
		<div class="row">
			<div class="col-9 col-md-3">
				<i class="fas fa-plus"></i> <span><button id="news"
						value="新增活動資訊">新增活動資訊</button></span> <span><button id="selectall"
						value="全選">全選</button></span> <span><button id="denine"
						value="刪除全選">刪除全選</button></span>
			</div>

			<!-- <div class="col-9  col-md-4">
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search"aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">
                    <i class="fas fa-search"></i>
                    </button>
                </form>
            </div> -->

		</div>
	</div>


	<!-- 活動快訊 -->
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="news">
					<div id="news-text">活動快訊</div>

					<div class="block">
						<div class="left" style="float: left;">
							<div>
								<input class="form-check-input" type="checkbox"
									id="checkboxNoLabel" value="" aria-label="...">
							</div>
						</div>
						<!-- 日期 -->
						<div class="left" style="float: left;">
							<div class="date">2021/01/01</div>
						</div>
						<!-- 優惠內容 -->
						<div class="right " style="float: left;">
							<div class="discount">新春特惠，全館免運!</div>
						</div>
						<div class="right " style="float: right;">
							<input type="button" value="刪除">
						</div>
						<div class="right " style="float: right;">
							<input type="button" value="修改">
						</div>
						<div class="clear-block"></div>
					</div>
					<!--------------------------------------------------------------->
					<div class="block">
						<div class="left" style="float: left;">
							<div>
								<input class="form-check-input" type="checkbox"
									id="checkboxNoLabel" value="" aria-label="...">
							</div>
						</div>
						<!-- 日期 -->
						<div class="left" style="float: left;">
							<div class="date">2021/01/10</div>
						</div>
						<!-- 優惠內容 -->
						<div class="right " style="float: left;">
							<div class="discount">新春特惠，全館免運!</div>
						</div>
						<div class="right " style="float: right;">
							<input type="button" value="刪除">
						</div>
						<div class="right " style="float: right;">
							<input type="button" value="修改">
						</div>
						<div class="clear-block"></div>
					</div>
					<!--------------------------------------------------------------->

					<div class="block">
						<div class="left" style="float: left;">
							<div>
								<input class="form-check-input" type="checkbox"
									id="checkboxNoLabel" value="" aria-label="...">
							</div>
						</div>
						<!-- 日期 -->
						<div class="left" style="float: left;">
							<div class="date">2021/01/10</div>
						</div>
						<!-- 優惠內容 -->
						<div class="right " style="float: left;">
							<div class="discount">新春特惠，全館免運!</div>
						</div>
						<div class="clear-block"></div>
					</div>
					<!--------------------------------------------------------------->

					<div class="block">
						<div class="left" style="float: left;">
							<div>
								<input class="form-check-input" type="checkbox"
									id="checkboxNoLabel" value="" aria-label="...">
							</div>
						</div>
						<!-- 日期 -->
						<div class="left" style="float: left;">
							<div class="date">2021/01/10</div>
						</div>
						<!-- 優惠內容 -->
						<div class="right " style="float: left;">
							<div class="discount">新春特惠，全館免運!</div>
						</div>
						<div class="right " style="float: right;">
							<input type="button" value="刪除">
						</div>
						<div class="right " style="float: right;">
							<input type="button" value="修改">
						</div>
						<div class="clear-block"></div>
					</div>
					<!--------------------------------------------------------------->

					<div class="block">
						<div class="left" style="float: left;">
							<div>
								<input class="form-check-input" type="checkbox"
									id="checkboxNoLabel" value="" aria-label="...">
							</div>
						</div>
						<!-- 日期 -->
						<div class="left" style="float: left;">
							<div class="date">2021/01/10</div>
						</div>
						<!-- 優惠內容 -->
						<div class="right " style="float: left;">
							<div class="discount">新春特惠，全館免運!</div>
						</div>
						<div class="right " style="float: right;">
							<input type="button" value="刪除">
						</div>
						<div class="right " style="float: right;">
							<input type="button" value="修改">
						</div>
						<div class="clear-block"></div>
					</div>

					<!--------------------------------------------------------------->

					<div class="block">
						<div class="left" style="float: left;">
							<div>
								<input class="form-check-input" type="checkbox"
									id="checkboxNoLabel" value="" aria-label="...">
							</div>
						</div>
						<!-- 日期 -->
						<div class="left" style="float: left;">
							<div class="date">2021/01/10</div>
						</div>
						<!-- 優惠內容 -->
						<div class="right " style="float: left;">
							<div class="discount">新春特惠，全館免運!</div>
						</div>
						<div class="right " style="float: right;">
							<input type="button" value="刪除">
						</div>
						<div class="right " style="float: right;">
							<input type="button" value="修改">
						</div>
						<div class="clear-block"></div>
					</div>

					<!--------------------------------------------------------------->

					<div class="block">
						<div class="left" style="float: left;">
							<div>
								<input class="form-check-input" type="checkbox"
									id="checkboxNoLabel" value="" aria-label="...">
							</div>
						</div>
						<!-- 日期 -->
						<div class="left" style="float: left;">
							<div class="date">2021/01/10</div>
						</div>
						<!-- 優惠內容 -->
						<div class="right " style="float: left;">
							<div class="discount">新春特惠，全館免運!</div>
						</div>
						<div class="right " style="float: right;">
							<input type="button" value="刪除">
						</div>
						<div class="right " style="float: right;">
							<input type="button" value="修改">
						</div>
						<div class="clear-block"></div>
					</div>

					<div class="block">
						<div class="left" style="float: left;">
							<div>
								<input class="form-check-input" type="checkbox"
									id="checkboxNoLabel" value="" aria-label="...">
							</div>
						</div>
						<!-- 日期 -->
						<div class="left" style="float: left;">
							<div class="date">2021/01/10</div>
						</div>
						<!-- 優惠內容 -->
						<div class="right " style="float: left;">
							<div class="discount">新春特惠，全館免運!</div>
						</div>
						<div class="right " style="float: right;">
							<input type="button" value="刪除">
						</div>
						<div class="right " style="float: right;">
							<input type="button" value="修改">
						</div>
						<div class="clear-block"></div>
					</div>


				</div>
			</div>





			<!-- ============================================================= -->
			<!-- 地區搜尋 -->
			<div class="container"></div>
			<div class="row g-5">
				<div class="col-12 col-md-3">
					<div>
						<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
							class="w-100">
					</div>
				</div>
				<div class="col-12 col-md-3">
					<div>
						<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
							class="w-100">
					</div>
				</div>
				<div class="col-12 col-md-3">
					<div>
						<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
							class="w-100">
					</div>
				</div>
				<div class="col-12 col-md-3">
					<div>
						<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
							class="w-100">
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />

</body>
</html>
