<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@splidejs/splide@2.4.21/dist/css/themes/splide-sea-green.min.css">
<!-- --------------------------------------------------------------------------------------------------------->
<title>作品播放</title>
<style>
textarea {
	border-radius: 15px;
	width: 100%;
}

.title {
	font-size: 2rem;
}

#messageBoard {
	font-size: 2rem;
}

.message {
	margin: 10px 0px;
	font-size: 1rem;
	min-height: 200px;
	width: 300px;

	/*          border: 1px solid grey; */
}

.message:hover {
	color: grey;
	border: 1px solid grey;
	transition: color 2s;
}

/*===============================================*/
.imageFrame {
	height: 300px; /*can be anything*/
	width: 300px; /*can be anything*/
	position: relative;
	overflow: hidden;
}

.imageFrameSide {
	height: 200px; /*can be anything*/
	width: 200px; /*can be anything*/
	position: relative;
	overflow: hidden;
}

.imageFrame .img, .imageFrameSide .img {
	transform: scale(1, 1);
	transition: all 0.5s ease-out;
}

.imageFrame .img:hover, .imageFrameSide .img:hover {
	transform: scale(1.5, 1.5);
}

.img {
	max-height: 100%;
	max-width: 100%;
	width: auto;
	height: auto;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
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
		<c:forEach items="${detailList}" var="row">
			<div class="container-flud">
				<div class="row" style="text-align: center;">
					<div class="col-12">
						<video controls class="w-75" poster="/upload${row.videoPic}"
							style="width: 100%; height: auto">
							<source src="/uploadv${row.videoFile}" type="video/mp4">
						</video>
					</div>
				</div>
			</div>

			<div class="container">
				<div class="row row-cols-1 row-cols-md-2">
					<div class="col-12">
						<div class="title">${row.portfolioName}</div>
					</div>


				</div>

				<!-- ------------------------------------------------------------------- -->
				<div class="row row-cols-1 row-cols-md-2">
					<div class="col">
						<div>
							<div>
								<img height='80px' width='60px' src="/upload/${row.mPic}" class="rounded mx-auto d-block mb-3">					
							</div>
							作者:${row.mName}
							觀看次數: <span><c:if test="${row.vcount==null}">0</c:if>
								<c:if test="${row.vcount!=null}">${row.vcount}</c:if></span>次
						</div>
						<div>
							上傳日期: <span><c:set var="pCreateTime"
									value="${row.p_createTime}" /> <fmt:formatDate type="both"
									dateStyle="long" timeStyle="medium" value="${pCreateTime}" /></span>
						</div>
						<!--按讚次數-->
						<div id="great">
							<a href="#"> <i class="far fa-thumbs-up"></i></a> <span><c:if
									test="${row.gcount==null}">0</c:if>
								<c:if test="${row.gcount!=null}">${row.gcount}</c:if></span> <a
								href="#"> <i class="far fa-thumbs-down"></i></a> <span><c:if
									test="${row.bcount==null}">0</c:if>
								<c:if test="${row.bcount!=null}">${row.bcount}</c:if></span>
						</div>
					</div>
					<div class="col">
						<div id="tag">#${row.continentName}#${row.countryName}#${row.cityName}#${row.portfolioName}</div>
						<div>
							<i class="fas fa-map-marker-alt red mx-2"></i>位置 : <span>${row.pAddress}</span>
						</div>
						<!--                 <div>相關連結</div> -->
						<!--                 <div><span>台灣</span>(地區一覽表)</div> -->
					</div>
				</div>
			</div>
		</c:forEach>
		<!-- ------------------------------------------------------------------- -->
		<div class="container">
		
			<div class="row row-cols-4">
				<div class="col-12 title  my-3">留言板</div>
				<c:forEach items="${pMsgList}" var="msg">
					<div class="col-3 message my-4">
						<span style="font-size: 1.3rem;" class="fw-bold">#${msg.mName}</span>
						<div class="col-11">
							<c:set var="fbCreateTime" value="${msg.pm_createTime}" />
							<fmt:formatDate type="both" dateStyle="long" timeStyle="medium"
								value="${fbCreateTime}" />
							<br>${msg.msgText}
						</div>
					</div>
				</c:forEach>
			</div>
			
			<c:if test="${mId!=null}">
				<div class="row my-3">
					<div class="col">
						<div class="title">新增公開留言:</div>
						<form action="createPortfolioMsg" method="post">
							<textarea style="resize: none;" id="feedback" rows="4"
								maxlength="100" name="msgText"></textarea>
							<input type="hidden" name="portfolioId" value="${portfolioId}">
							<input type="hidden" name="countryId" value="${countryId}">
							<button class="btn btn-primary float-end" type="submit">送出</button>
						</form>
					</div>
				</div>
			</c:if>
		</div></div>
	<!-----------商品/廣告----------------------------------------------------------------------------->
<%-- 	<c:forEach items="${itemList}" var="it"> --%>
<%-- 		<form action="merchandiseDetail/Id=${it.itemId}" method="get"> --%>
<%-- 			<%-- 					<input class="form-control me-2" type="hidden" name="Id" value="${it.itemId}"> --%> 
<!-- 			<button class="btn fs-6" id="search" type="submit" -->
<%-- 				style="box-shadow: none;">${it.itemHeader}</button> --%>
<%-- 		</form> --%>
<!-- 		<div class="col-3 message my-4"> -->
<!-- 			<span style="font-size: 1.3rem;" class="fw-bold">#${it.itemDes}</span> -->
<!-- 			<br> -->
<!-- 		</div> -->
<%-- 	</c:forEach> --%>
	<!-----------商品/廣告----------------------------------------------------------------------------->
	<!-- 最外層----------------------------------------------------------------- -->
	<div class="container" >
		<div class="splide row" >
			<!-- 放拉動調的區塊------------------------------------------------------ -->
			<div class="splide__track">
				<!-- 拉動條的區塊 ----------------------------------------------------->
				<ul class="splide__list" >
					<c:forEach items="${itemList}" var="it">
						<li class="splide__slide">

						<div class="card">
								<div class="itemImageBorder" style="margin:auto">
									<div id="carouselExampleControls${it.itemId}"
										class="carousel slide" data-bs-ride="carousel">
										<div class="carousel-inner">
											<div class="carousel-item active">
												<div class="imageFrame">
													<img class="img" src="/upload/${it.itemPic1}"
														class="d-block w-100" alt="...">
												</div>
											</div>
											<div class="carousel-item">
												<div class="imageFrame">
													<img class="img" src="/upload/${it.itemPic2}"
														class="d-block w-100" alt="...">
												</div>
											</div>
											<div class="carousel-item">
												<div class="imageFrame">
													<img class="img" src="/upload/${it.itemPic3}"
														class="d-block w-100" alt="...">
												</div>
											</div>
										</div>
										<button class="carousel-control-prev" type="button"
											data-bs-target="#carouselExampleControls${it.itemId}"
											data-bs-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Previous</span>
										</button>
										<button class="carousel-control-next" type="button"
											data-bs-target="#carouselExampleControls${it.itemId}"
											data-bs-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Next</span>
										</button>
									</div>


								</div>

								<div class="itemName " style="margin:auto">
									<a href="<c:url value="/merchandiseDetail/Id=${it.itemId}"/>">
										<img class="w-100"> ${it.itemHeader}
									</a>
								</div>
							</div>

					</c:forEach>

				</ul>
			</div>
		</div>
	</div>
	<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
	<!-- --------------------------------------------------------------------------------------->

<script type="text/javascript">
$(function (){
// 	判斷狀態:點讚紅色,未點黑色
    var userLike = $("button[name='like']").val();
    if (userLike == 1) {
        $("span[id='like']").css("color","red");

    }else {
        $("span[id='like']").css("color","black");

    }
// 	點擊觸發判斷:1=讚,0=未點
    $("button[name='like']").click(function() {
        userl =$(this).val();
        if (userl == 1) {
            selected()
        }else {
            selecting()
        }
    })

})
// <!已点赞事件，取消点赞，改变颜色，post传递数据修改用户点赞状态，和返回点赞总数>
// 點讚事件 取消點讚 改變顏色時 POST修改點讚狀態
function selected() {
    $("span[id='like']").css("color","black");
    $.ajax({
        url:"like",
        data:{"ulike":0},
        type:"post",
        dataType:"JSON",
        success:function (rs){
            var s = rs.sumLike
            $("button[name='like']").val(0);
            $("#sumLike").html(s);
        },
        error:function (rs) {
            alert(rs.sumLike);
        }
    })
}
// <!未点赞事件，点赞，改变颜色，post传递数据修改用户点赞状态，和返回点赞总数>
function selecting() {
    $("span[id='like']").css("color","red");
    $.ajax({
        url:"like",
        data:{"ulike":1},
        type:"post",
        dataType:"JSON",
        success:function (rs){
            var s = rs.sumLike
            $("button[name='like']").val(1);
            $("#sumLike").html(s);
        },
        error:function (rs) {
            alert(rs.sumLike);
        }
    })
}

</script>
<script
		src="https://cdn.jsdelivr.net/npm/@splidejs/splide@2.4.21/dist/js/splide.min.js"></script>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			new Splide('.splide', {
				//拉動條寬
				width : '100%',
				//單向寬
				fixedWidth : '23rem',
				fixedHeight : '30rem',
				padding : {
					left : 0,
					right :40,
				},
				
				perPage : 4,
				perMove : 1,
// 				間距
				gap : 40,
				rewind : true,
				pagination : false,
			}).mount();
		});
	</script>
</body>
</html>


