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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CSS ----------------------------------------------------------------------------------------- -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- icon cdn----------------------------------------------------------------------------------------------- -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<!-- animation --------------------------------------------------------------------------------------------- -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

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

.imageFrame {
	position: relative;
	overflow: hidden;
}

.imageFrame img {
	transform: scale(1, 1);
	transition: all 1s ease-out;
}

.imageFrame img:hover {
	transform: scale(1.5, 1.5);
}

span.error:first-child() {
	text-align: left;
	margin-left: 0;
}

.error {
	letter-spacing: 1px;
	margin-top: 5px;
	display: inline-block;
	color: rgb(255, 0, 0);
	margin-left: 30%;
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


					<div class="animate__animated animate__zoomInDown">
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
												<form:form method="POST" modelAttribute="itemBean"
													enctype="multipart/form-data">

													<div class="form-group row">
														<div class="input-group mb-3">
															<label for="itemHeader" class="col-sm-2 col-form-label"
																style="text-align: right;">商品名稱 :
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
															<div class="col-sm-10">
																<form:input type="text" path="itemHeader"
																	class="form-control" id="itemHeader" maxlength="20"
																	placeholder="限20字以內" aria-label="Username"
																	aria-describedby="basic-addon1" />
															</div>
															<div class="col-sm-10" style="text-align: center;">
																<div class="animate__animated animate__shakeX">
																	<form:errors path="itemHeader" cssClass="error" />
																</div>
															</div>
														</div>
													</div>

													<div class="form-group row">
														<div class="input-group mb-3">
															<label for="itemPrice" class="col-sm-2 col-form-label"
																style="text-align: right;">商品價錢 :
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
															<div class="col-sm-10">
																<div class="input-group">
																	<span class="input-group-text">$</span>
																	<form:input type="text" path="itemPrice"
																		class="form-control" id="itemPrice" />
																</div>
															</div>
															<div class="col-sm-10" style="text-align: center;">
																<div class="animate__animated animate__shakeX">
																	<form:errors path="itemPrice" cssClass="error" />
																</div>
															</div>
														</div>
													</div>

													<div class="form-group row">
														<div class="input-group mb-3">
															<label for="itemQty" class="col-sm-2 col-form-label"
																style="text-align: right;">商品數量 :
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
															<div class="col-sm-10">
																<form:input type="number" path="itemQty" min="0"
																	class="form-control" id="itemQty" />
															</div>
															<div class="col-sm-10" style="text-align: center;">
																<div class="animate__animated animate__shakeX">
																	<form:errors path="itemQty" cssClass="error" />
																</div>
															</div>
														</div>
													</div>

													<div class="form-group row">
														<div class="input-group mb-3">
															<label for="itemDes" class="col-sm-2 col-form-label"
																style="text-align: right;">商品描述 :
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
															<div class="col-sm-10">
																<form:textarea type="text" path="itemDes" min="0"
																	style="padding-bottom: 40px;" class="form-control"
																	id="itemDes" aria-label="With textarea" />
															</div>
															<div class="col-sm-10" style="text-align: center;">
																<div class="animate__animated animate__shakeX">
																	<form:errors path="itemDes" cssClass="error" />
																</div>
															</div>
														</div>
													</div>

													<div class="form-group row">
														<div class="input-group mb-3">
															<label for="itTId" class="col-sm-2 col-form-label"
																style="text-align: right;">商品類型 :
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
															<div class="mb-3 col-10">
																<c:if test="${itemId==null}">
																	<form:select path="item_typeBean.itId"
																		class="form-select"
																		aria-label="Default select example">
																		<form:option value="-1" label="請選擇商品類型" />
																		<form:options items="${item_TypeMap}" />
																	</form:select>
																</c:if>

																<c:if test="${itemId!=null}">
																	<form:select path="item_typeBean.itId"
																		class="form-select">
																		<form:option value="-1" label="請選擇商品類型" />
																		<form:options items="${item_TypeMap}" />
																	</form:select>
																</c:if>
															</div>
															<div class="mb-3 col-10" style="text-align: center;">
																<div class="animate__animated animate__shakeX">
																	<form:errors path="item_typeBean" cssClass="error" />
																</div>
															</div>
														</div>
													</div>

													<div class="form-group row">
														<div class="input-group mb-3">
															<label for="countryTId" class="col-sm-2 col-form-label"
																style="text-align: right;">商品產地 :
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
															<div class="mb-3 col-10">
																<c:if test="${itemId==null}">
																	<form:select path="countryBean.countryId"
																		class="form-select"
																		aria-label="Default select example">
																		<form:option value="-1" label="請選擇國家" />
																		<form:options items="${countryMap}" />
																	</form:select>
																</c:if>
																<!-- 																</div> -->
																<c:if test="${itemId!=null}">
																	<!-- 																<div class="mb-3 col-10" class="col-sm-2 col-form-label"> -->
																	<form:select path="countryBean.countryId"
																		class="form-select">
																		<form:option value="-1" label="請選擇國家" />
																		<form:options items="${countryMap}" />
																	</form:select>
																	<!-- 																</div> -->

																</c:if>
															</div>
															<div class="mb-3 col-10" style="text-align: center;">
																<div class="animate__animated animate__shakeX">
																	<form:errors path="countryBean" cssClass="error" />
																</div>
															</div>
														</div>
													</div>

													<c:if test="${itemId==null}">

														<div id="addItem">
															<div class="col-1"></div>
															<div class="col-1">
																<label style="text-align: right;">商品照片 :</label>
															</div>

															<div class="col-3">
																<!-- 														商品第一張照片 :<br> <img id="photo1" name="photo1" -->
																<%-- 															src="/upload/${itemBean.itemPic1}" class="w-100"> <br> --%>
																<%-- 																<c:set --%>
																<%-- 							value="0" --%>
																<%-- 							var="sum" /> --%>
																<form:input path="itemImage1" type='file' accept=".jpg"
																	class="form-control" />
																<br>

																<form:input path="itemImage2" type='file' accept=".jpg"
																	class="form-control" />
																<br>

																<form:input path="itemImage3" type='file' accept=".jpg"
																	class="form-control" />
																<br>
															</div>

															<div class="col-1">
																<!-- 														商品第二張照片 :<br> <img id="photo2" name="photo2" -->
																<%-- 															src="/upload/${itemBean.itemPic2}" class="w-100"> <br> --%>
																<%-- 														<form:input path="itemImage2" type='file' accept=".jpg" /> --%>
															</div>
															<div class="col-1">
																<label style="text-align: right;">瀏覽照片 :</label>
															</div>

															<div class="col-3">
																<br>
																<%-- 															<c:if test="${ sum == 1}"> --%>
																<img id="photo3" name="photo3"
																	<%-- 																src="/upload/${itemBean.itemPic3}"  --%>
																class="w-100">
																<%-- 															</c:if> --%>
																<br>
																<%-- 														<form:input path="itemImage3" type='file' accept=".jpg" /> --%>
															</div>
															<!-- 一次上傳三張照片 -->
															<!-- 					<div class="mb-3"> -->
															<!-- 						<label for="formFileMultiple" class="form-label">Multiple -->
															<!-- 							一次上傳三張照片</label> <input class="form-control" type="file" -->
															<!-- 							id="formFileMultiple" multiple> -->
															<!-- 					</div> -->
														</div>
													</c:if>




													<div
														class="form-group row  d-flex justify-content-end mt-5">
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
					</div>

					<!-- 					<nav id="navbar-example2" class="navbar navbar-light bg-light px-3"> -->
					<!-- 						<a class="navbar-brand" href="#"></a> -->
					<!-- 						<ul class="nav nav-pills"> -->
					<!-- 							<li class="nav-item"><label for="testInput"> <input -->
					<!-- 									type="text" placeholder="請輸入商品編號" id="testInput" style="height:34px; width:122px;"/> -->
					<!-- 									<button class="submitBtn btn btn-secondary">查詢商品</button> -->
					<!-- 							</label></li> -->
					<!-- 						</ul> -->
					<!-- 					</nav> -->



					<br>
					<!-- 陳列商品 -->
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingTwo">
							<nav id="navbar-example2"
								class="navbar navbar-light bg-light px-3">
								<a class="navbar-brand" href="#"></a>
								<ul class="nav nav-pills">
									<li class="nav-item"><label for="testInput"> <input
											type="text" placeholder="請輸入商品編號" id="testInput"
											style="height: 36px; width: 122px; font-size: 16px;" />
											<button class="submitBtn btn btn-secondary btn-lg">查詢商品</button>
									</label></li>
								</ul>
							</nav>
							<button class="accordion-button" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseTwo"
								aria-expanded="true" aria-controls="collapseTwo">
								<h3 id="searchi">所有商品</h3>
							</button>
						</h2>
						<div id="collapseTwo" class="accordion-collapse collapse show"
							aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
							<div class="accordion-body">

								<c:forEach var='item' items='${items}'>
									<div class="container-fluid">

										<div id="${item.itemId}" style="height: 40px"></div>
										<div data-aos="zoom-out-down">
											<!-- 			增加陰影效果 -->
											<div class="shadow p-3 bg-body rounded">
												<div id="searchSquare">
													<div class="row R_SpCre">
														<!-- 						<div class="col-1"> -->
														<!-- 							<input class="form-check-input" type="checkbox" -->
														<!-- 								id="checkboxNoLabel" value="" aria-label="..."> -->
														<!-- 						</div> -->

														<div style="text-align: right;">
															<div>
																商品編號 : <b>${item.itemId}</b>
															</div>
														</div>
														<div style="text-align: left; font-size: 20px;">商品名稱
															: ${item.itemHeader}</div>

														<div class="col-2">
															<br>
															<div class="imageFrame">
																<img id="pic1" name="pic1"
																	src="/upload/${item.itemPic1}" class="w-100">

															</div>
														</div>

														<div class="col-2">

															<br>
															<div class="imageFrame">
																<img id="pic2" name="pic2"
																	src="/upload/${item.itemPic2}" class="w-100">
															</div>
														</div>

														<div class="col-2">

															<br>
															<div class="imageFrame">
																<img id="pic3" name="pic3"
																	src="/upload/${item.itemPic3}" class="w-100">
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
									</div>
									<!-- =================提示視窗============================================================================================================= -->
									<div class="modal fade" id="deleteItem${item.itemId}"
										tabindex="-1" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">刪除編號${item.itemId}商品</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													確定要刪除 "<b>商品編號${item.itemId}</b>" 商品??
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">取消</button>
													<button type="button" class="btn btn-primary"
														onclick="location.href='merchandiseModify/delete/Id=${item.itemId}'">確定刪除商品</button>
												</div>
											</div>
										</div>
									</div>
									<!-- ============================================================================================================================================ -->
								</c:forEach>
							</div>
						</div>
						<div style="text-align: right;">
							<a
								href="${pageContext.request.contextPath}/merchandiseModify#searchi"><i
								class="far fa-caret-square-up fa-3x"></i></a>
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
		var testInput = document.getElementById("testInput");
		var submitBtn = document.querySelector(".submitBtn");

		function FsubmitBtn(value) {
			var str = "";
			var submitValue = testInput.value;
			str = submitValue;
			location.href = '${pageContext.request.contextPath}/merchandiseModify'
					+ '#' + str;
			// 	  document.forms[0].action = "${pageContext.request.contextPath}/merchandiseModify#1";
			// 	  alert(str);
		}
		submitBtn.addEventListener("click", FsubmitBtn);
		// 	onclick="location.href='${pageContext.request.contextPath}/merchandiseModify#1'"

		const theFile1 = document.getElementById('itemImage1');

		theFile1.addEventListener('change', function() {
			console.log('ok');
			showImg(theFile1);
		})

		function showImg(imgFile1) {
			var file1 = imgFile1.files[0];

			// 建立FileReader物件
			var fr1 = new FileReader();

			let photo1 = document.getElementById('photo1');
			//註冊load事件
			fr1.addEventListener('load', function(e) {
				photo1.src = e.target.result;
			});
			//readAsDataURL去讀 file 把檔案轉成 URL
			fr1.readAsDataURL(file1);
		}

		const theFile2 = document.getElementById('itemImage2');

		theFile2.addEventListener('change', function() {
			console.log('ok');
			showImg(theFile2);
		})

		function showImg(imgFile2) {
			var file2 = imgFile2.files[0];

			// 建立FileReader物件
			var fr2 = new FileReader();

			let photo2 = document.getElementById('photo2');
			//註冊load事件
			fr2.addEventListener('load', function(e) {
				photo2.src = e.target.result;
			});
			//readAsDataURL去讀 file 把檔案轉成 URL
			fr2.readAsDataURL(file2);
		}

		const theFile3 = document.getElementById('itemImage3');

		theFile3.addEventListener('change', function() {
			console.log('ok');
			showImg(theFile3);
		})

		function showImg(imgFile3) {
			var file3 = imgFile3.files[0];

			// 建立FileReader物件
			var fr3 = new FileReader();

			let photo3 = document.getElementById('photo3');
			//註冊load事件
			fr3.addEventListener('load', function(e) {
				photo3.src = e.target.result;
			});
			//readAsDataURL去讀 file 把檔案轉成 URL
			fr3.readAsDataURL(file3);
		}
	</script>
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script>
		AOS.init();
	</script>
</body>
</html>
