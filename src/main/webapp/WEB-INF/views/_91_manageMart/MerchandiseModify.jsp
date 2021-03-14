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
	href="<c:url value='/_00_util/managerUtil/css/managerLayout.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/managerUtil/css/managerFont.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/managerUtil/css/managerColor.css'></c:url>">

<!-- --------------------------------------------------------------------------------------------------------->
<title>編輯商品</title>

<style>
body {
	font-size: 20ox;
	text-align: center;
}

.container {
	text-align: left;
}

div.container-fluid {
	text-align: center;
	/* 	border: 1px solid black; */
	margin: 0px;
	padding: 0px;
}

.row {
	/* 	margin-bottom: 10px; */
	
}

/* 欄位敘述區 */
.de {
	/* border: 1px solid rgb(65, 65, 65); */
	/* background: rgb(133, 133, 133); */
	/* line-height:25px; */
	min-width: 60px;
}

/* 商品清單區 */
img {
	max-width: 200px;
	min-width: 80px;
}

.R_SpCre {
	/* background: rgb(184, 181, 181); */
	display: flex;
	align-items: center
}

.C_SpCre {
	min-width: 60px;
}

button { /*按鈕的樣式*/
	padding: 10px;
	color: rgb(24, 24, 168);
	border: 1px rgb(24, 24, 168) solid;
	background-color: rgb(245, 241, 242);
	border-radius: 5px;
}
/* .form-check-input{
        
        align-content: center;
    } */
#addItem {
	display: flex;
}

#addSquare {
	/* 	border: 1px solid red; */
	margin: 10px;
	padding: 10px;
}

#searchSquare {
	/* 	border: 1px solid red; */
	/* 	margin: 10px; */
	/* 	padding: 10px; */
	
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

		<%-- 	<jsp:include page="<c:url value='${pageContext.request.contextPath}/WEB-INF/views/_00_util/allUtil/jsp/header.jsp'/>" /> --%>
		<div class="container">
			<div class="row">
				<div class="col">
					<br> <br>
					<button id="newM" class="btn btn-primary btn-lg"
						onclick="location.href='${pageContext.request.contextPath}/merchandiseModify'">
						<span class="fas fa-plus"></span> 新增商品
					</button>
					<!-- 							<button id="selectA">全選</button> -->
					<!-- 							<button id="save">儲存變更</button> -->
					<button id="allFeedback" class="btn btn-primary btn-lg"
						onclick="location.href='${pageContext.request.contextPath}/manageFeedback'">查看全部商品留言</button>
					<br> <br>


					<!-- 	新增商品和編輯商品 -->
					<div class="accordion" id="accordionExample">
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingOne">
								<button class="accordion-button" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseOne"
									aria-expanded="true" aria-controls="collapseOne">
									<c:if test="${itemId==null}">
										<h3>新增商品</h3>
									</c:if>

									<c:if test="${itemId!=null}">
										<h3>編輯商品 (商品編號 : ${itemId})</h3>
									</c:if>
								</button>
							</h2>
							<div id="collapseOne" class="accordion-collapse collapse show"
								aria-labelledby="headingOne" data-bs-parent="#accordionExample">
								<div class="accordion-body">

									<!-- 			增加陰影效果 -->
									<div class="shadow p-3 mb-5 bg-body rounded">
										<div id="addSquare">
											<form:form method='POST' modelAttribute='itemBean'>

												<div class="form-group row">
													<div class="input-group mb-3">
														<label for="itemHeader" class="col-sm-2 col-form-label"
															style="text-align: right;">商品名稱 : &nbsp;</label>
														<div class="col-sm-10">
															<form:input type="text" path="itemHeader"
																class="form-control" id="itemHeader" maxlength="20"
																placeholder="限20字以內" aria-label="Username"
																aria-describedby="basic-addon1" />
														</div>
													</div>
												</div>

												<div class="form-group row">
													<div class="input-group mb-3">
														<label for="itemPrice" class="col-sm-2 col-form-label"
															style="text-align: right;">商品價錢 : &nbsp;</label>
														<div class="col-sm-10">
															<div class="input-group">
																<span class="input-group-text">$</span>
																<form:input type="text" path="itemPrice"
																	class="form-control" id="itemPrice" />
															</div>
														</div>
													</div>
												</div>

												<div class="form-group row">
													<div class="input-group mb-3">
														<label for="itemQty" class="col-sm-2 col-form-label"
															style="text-align: right;">商品數量 : &nbsp;</label>
														<div class="col-sm-10">
															<form:input type="number" path="itemQty" min="0"
																class="form-control" id="itemQty" />
														</div>
													</div>
												</div>

												<div class="form-group row">
													<div class="input-group mb-3">
														<label for="itemDes" class="col-sm-2 col-form-label"
															style="text-align: right;">商品描述 : &nbsp;</label>
														<div class="col-sm-10">
															<form:textarea type="text" path="itemDes" min="0"
																style="padding-bottom: 40px;" class="form-control"
																id="itemDes" aria-label="With textarea" />
														</div>
													</div>
												</div>

												<div class="form-group row">
													<div class="input-group mb-3">
														<label for="itTId" class="col-sm-2 col-form-label"
															style="text-align: right;">商品類型 : &nbsp;</label>
														<div class="mb-3 col-10">
															<c:if test="${itemId==null}">
																<form:select path="itTId" class="form-select"
																	aria-label="Default select example">
																	<form:option value="-1" label="請選擇商品類型" />
																	<form:options items="${item_TypeMap}" />
																</form:select>
															</c:if>
															<c:if test="${itemId!=null}">
																<form:select path="item_typeBean.itId"
																	class="custom-select">
																	<form:option value="-1" label="請選擇商品類型" />
																	<form:options items="${item_TypeMap}" />
																</form:select>
															</c:if>
														</div>
													</div>
												</div>

												<div class="form-group row">
													<div class="input-group mb-3">
														<label for="countryTId" class="col-sm-2 col-form-label"
															style="text-align: right;">商品產地 : &nbsp;</label>
														<c:if test="${itemId==null}">
															<div class="mb-3 col-10">
																<form:select path="countryTId" class="form-select"
																	aria-label="Default select example">
																	<form:option value="-1" label="請選擇國家" />
																	<form:options items="${countryMap}" />
																</form:select>
															</div>
														</c:if>
														<c:if test="${itemId!=null}">
															<div class="mb-3 col-10">
																<form:select path="countryBean.countryId"
																	class="custom-select">
																	<form:option value="-1" label="請選擇國家" />
																	<form:options items="${countryMap}" />
																</form:select>
															</div>
														</c:if>
													</div>
												</div>

												<div id="addItem">
													<div class="col-1"></div>
													<div class="col-3">
														商品第一張照片 :<br>
														<%-- 					<div>紀念品照片1${item.Pic1}</div> --%>
														<img id="photo" name="photo"
															src="https://fakeimg.pl/350x350/?text=World&font=lobster"
															class="w-100"> <br>
														<!-- 												 <input type="file" name="itemPic1" /> -->
														<%-- 														<form:input path="itemImage1" type='file' class="theFile" /> --%>
													</div>
													<div class="col-1"></div>

													<div class="col-3">
														商品第二張照片 :<br>
														<%-- 					<div>紀念品照片2${item.Pic2}</div> --%>
														<img
															src="https://fakeimg.pl/350x350/?text=World&font=lobster"
															class="w-100"> <br> <input type="file"
															name="itemPic2" />
													</div>
													<div class="col-1"></div>

													<div class="col-3">
														商品第三張照片 :<br>
														<%-- 					<div>紀念品照片3${item.Pic3}</div> --%>
														<img
															src="${pageContext.request.contextPath}/images/itemImages/1/MAMA3.jpg"
															class="w-100"> <br> <input type="file"
															name="itemPic3" />
													</div>
													<!-- 一次上傳三張照片 -->
													<!-- 					<div class="mb-3"> -->
													<!-- 						<label for="formFileMultiple" class="form-label">Multiple -->
													<!-- 							一次上傳三張照片</label> <input class="form-control" type="file" -->
													<!-- 							id="formFileMultiple" multiple> -->
													<!-- 					</div> -->
												</div>
												<div class="form-group row  d-flex justify-content-end mt-5">
													<div style="text-align: center;">
														<!-- 				<div> -->
														<!-- 					<button type="submit" class="btn btn-secondary mr-3">一鍵輸入</button> -->
														<!-- 				</div> -->
														<c:if test="${itemId==null}">
															<div>
																<button type="submit" id="btnAdd"
																	class="btn btn-primary btn-lg">新增</button>
															</div>
														</c:if>

														<c:if test="${itemId!=null}">
															<div>
																<button type="submit" id="editM"
																	class="btn btn-primary btn-lg"
																	<%-- 													onclick="location.href='merchandiseModify/get/Id=${item.itemId}'">儲存變更</button> --%>
													onclick="location.href='merchandiseModify/get/Id=${itemId}'">儲存變更</button>
															</div>
														</c:if>
													</div>
												</div>

												<!-- 			<div> -->
												<%-- 				<button type="submit" id="editM" value="/Id=${itemId}" --%>
												<%-- 					onclick="location.href='merchandiseModify/update/Id=${item.itemId}'">儲存變更</button> --%>
												<!-- 			</div> -->

											</form:form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<br>
					<!-- 陳列商品 -->
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingTwo">
							<button class="accordion-button" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseTwo"
								aria-expanded="true" aria-controls="collapseTwo">
								<h3 id="searchi">陳列所有商品</h3>
							</button>
						</h2>
						<div id="collapseTwo" class="accordion-collapse collapse show"
							aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
							<div class="accordion-body">

								<c:forEach var='item' items='${items}'>
									<div class="container-fluid">
										<!-- 			增加陰影效果 -->
										<div class="shadow p-3 mb-5 bg-body rounded">
											<div id="searchSquare">
												<div class="row R_SpCre">
													<!-- 						<div class="col-1"> -->
													<!-- 							<input class="form-check-input" type="checkbox" -->
													<!-- 								id="checkboxNoLabel" value="" aria-label="..."> -->
													<!-- 						</div> -->
													<div style="text-align: left;">
														<div>商品編號 : ${item.itemId}</div>
													</div>
													<div>商品名稱 : ${item.itemHeader}</div>
													<div class="col-2">
														<br>
														<div>
															<img
																src="https://fakeimg.pl/350x350/?text=World&font=lobster"
																class="w-100">
														</div>
													</div>

													<div class="col-2">

														<br>
														<div>
															<img
																src="https://fakeimg.pl/350x350/?text=World&font=lobster"
																class="w-100">
														</div>
													</div>

													<div class="col-2">

														<br>
														<div>
															<img
																src="https://fakeimg.pl/350x350/?text=World&font=lobster"
																class="w-100">
														</div>
													</div>

													<div class="col-1">
														<div style="text-align: right;">
															<br>
															<div>商品類別 :</div>
															<br>
															<div>商品國家 :</div>
															<br>
															<div>商品定價 :</div>
															<br>
															<div>商品剩餘 :</div>

														</div>
													</div>

													<div class="col-1">
														<div style="text-align: left;">
															<br>
															<div>${item.item_typeBean.itemType}</div>
															<br>
															<div>${item.countryBean.countryName}</div>
															<br>
															<div>${item.itemPrice}</div>
															<br>
															<div>${item.itemQty}</div>

														</div>
													</div>

													<div class="col-2">
														<br>
														<div>
															商品描述 : <br> <br>${item.itemDes}
														</div>
													</div>

													<div class="col-2">
														<br>
														<div>
															<button id="editM" value="/Id=${itemId}"
																class="btn btn-primary"
																<%-- 							onclick="location.href='merchandiseModify/get/Id=${item.itemId}'">編輯商品</button> --%>
							onclick="location.href='Id=${item.itemId}'">編輯商品</button>
														</div>
														<br>
														<div>
															<button id="deleteM" value="/Id=${itemId}"
																class="btn btn-primary"
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
															<button id="manageFeedback" class="btn btn-primary"
																onclick="location.href='manageFeedback/Id=${item.itemId}'">管理留言</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<hr>
		<!-----------定位----------------------------------------------------------------------------->
	</div>
	<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
	<!-- --------------------------------------------------------------------------------------->
	<script>
		const theFile = document.getElementById('itemPic1');

		theFile.addEventListener('change', function() {
			console.log('ok');
			showImg(theFile);
		})

		function showImg(imgFile) {
			var file = imgFile.files[0];

			// 建立FileReader物件
			var fr = new FileReader();

			let photo = document.getElementById('photo');
			//註冊load事件
			fr.addEventListener('load', function(e) {
				photo.src = e.target.result;
			});
			//readAsDataURL去讀 file 把檔案轉成 URL
			fr.readAsDataURL(file);
		}
	</script>

</body>
</html>
