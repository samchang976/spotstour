<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%-- <% --%>
<!--  	request.setCharacterEncoding("UTF-8"); -->
<%-- %> --%>
<html>
<head>
<meta charset="UTF-8">
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

<!-- 按鈕樣式 -->
<link rel="stylesheet" href="../css/button.css">

<link rel="stylesheet" href="../css/08_.css">

<title>訂購成功</title>
</head>
<body>
<!-- header -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />

 <div class="container" >
      <!-- 訂單編號區塊 -->
        <div class="row">
            <div class="col-12">
                <div class="orderNumber">
                  <span>訂單編號 : </span> <span>FSWE1233245</span>
                </div>
            </div>
        </div>
            
      <!--訂購成功  -->
            <div class="row">
              <div class="col-12" >
                <div>
                      <i class="fas fa-check-circle"></i>
                      <span id="success_Text">
                        訂購成功!
                      </span>
                </div>
              </div>
            </div>
      <!--感謝詞  -->
            
      <div id="thanks">謝謝您!歡迎下次再光臨</div>
          
          <button class="Bt_blue"
          onclick="window.open('MyOrderList') ">我的訂單</button>

    </div>
    









	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>



</body>
</html>