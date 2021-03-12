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
<title>個人作品</title>
</head>
<body>
<!--header=================================================================================  -->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
<!-----------定位----------------------------------------------------------------------------->
	<div class="BodyPosition">
<!------------------------------------------------------------------------------------------->	

		<!-- 陳列商品 -->
		<h3>陳列商品</h3>
		<c:forEach var='item' items='${items}'>
			<div class="container-fluid">
				<div class="shadow p-3 mb-5 bg-body rounded" style="margin: 10px;">
					<div class="row R_SpCre">
						<div class="col col-1 C_SpCre">
							<input class="form-check-input" type="checkbox"
								id="checkboxNoLabel" value="" aria-label="...">
						</div>

						<div class="col col-2-1 C_SpCre">
							<div>${item.itemId}商品標頭:${item.itemHeader}</div>
							<br>
							<%-- 					<div>紀念品照片1${item.Pic1}</div> --%>
							<div>
								<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
									class="w-100">
							</div>
						</div>

						<div class=" col col-3-1 C_SpCre">
							<div>商品類別:${item.item_typeBean.itemType}</div>
							<br>
							<%-- 					<div>紀念品照片2${item.Pic2}</div> --%>
							<div>
								<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
									class="w-100">
							</div>

						</div>

						<div class="col col-4-1 C_SpCre">
							<div>商品國家:${item.countryBean.countryName}</div>
							<br>
							<%-- 					<div>紀念品照片3${item.Pic3}</div> --%>
							<div>
								<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
									class="w-100">
							</div>
						</div>

						<div class="col col-5-1 C_SpCre">
							<br>
							<div>
								商品描述:<br> <br> ${item.itemDes}
							</div>
						</div>

						<div class=" col col-6-1 C_SpCre">
							<br>
							<div>商品定價:${item.itemPrice}</div>
							<br>
							<div>商品剩餘:${item.itemQty}</div>
						</div>

						<div class="col col-7-1 C_SpCre">
							<div>
								<button id="editM" value="/Id=${itemId}"
									<%-- 							onclick="location.href='merchandiseModify/get/Id=${item.itemId}'">編輯商品</button> --%>
							onclick="location.href='Id=${item.itemId}'">編輯商品</button>
							</div>
							<br>
							<div>
								<button id="deleteM" value="/Id=${itemId}"
									<%-- 								onclick="location.href='merchandiseModify/delete/Id=${item.itemId}'">刪除商品</button> --%>
								 data-bs-toggle="modal"
									data-bs-target="#deleteItem${item.itemId}">刪除商品</button>



								<div class="modal fade" id="deleteItem${item.itemId}"
									tabindex="-1" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">刪除商品</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">確定要刪除此商品??</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">取消</button>
												<button type="button" class="btn btn-primary"
													onclick="location.href='merchandiseModify/delete/Id=${item.itemId}'">確定刪除商品</button>
											</div>
										</div>
									</div>
								</div>

							</div>
							<br>
							<div>
								<button id="manageFeedback"
									onclick="location.href='manageFeedback/Id=${item.itemId}'">管理留言</button>
							</div>
						</div>
					</div>
				</div>
			</div>

		</c:forEach>


		<hr>
<!-----------定位----------------------------------------------------------------------------->       
      </div>	
<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
<!-- --------------------------------------------------------------------------------------->

</body>
</html>