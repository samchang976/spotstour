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
<!-- --------------------------------------------------------------------------------------------------------->
<title>作品播放</title>
<style>
  textarea{
            border-radius: 15px;
            width:100%;
        }
  .title{
  font-size:2rem;
  }
  
  #messageBoard{
   font-size:2rem;
  }
  .message{
            margin: 10px 0px;
            font-size:1rem;
          	min-height:200px;
          	width: 300px;
           
/*          border: 1px solid grey; */
        }
 .message:hover{
 color:grey;
 border: 1px solid grey;
 transition:color 2s;
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
        <div class="row" style="text-align: center;" >
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
   	    </div>       
<!-- ------------------------------------------------------------------- -->
        <div class="row row-cols-1 row-cols-md-2">
            <div class="col">
                <div>觀看次數: <span>123456</span>次</div>
                <div>上傳日期: <span><c:set var="pCreateTime" value="${row.p_createTime}" />
						<fmt:formatDate type="both" dateStyle="long"
						timeStyle="medium" value="${pCreateTime}" /></span></div>
                 	<!--按讚次數-->
				<div id="great">
					<a href="#"> <i class="far fa-thumbs-up"></i></a> <span>103</span>
					<a href="#"> <i class="far fa-thumbs-down"></i></a> <span>1</span>
				</div>		
            </div>
         <div class="col">
                <div id="tag">#${row.continentName}#${row.countryName}#${row.cityName}#${row.portfolioName}</div>
                <div>位置 : <span>${row.pAddress}</span></div>
<!--                 <div>相關連結</div> -->
<!--                 <div><span>台灣</span>(地區一覽表)</div> -->
            </div>
        </div>
   
<!-- ------------------------------------------------------------------- -->  
 </c:forEach>         
<!-----------定位----------------------------------------------------------------------------->       
        <div class="row row-cols-4">     	
        	<div class="col-12 title  my-3"> 留言板</div>
        	<c:forEach items="${pMsgList}" var="msg">
            <div class="col-3 message my-4">
                   <span style="font-size:1.3rem;" class="fw-bold">#${msg.mName}</span>
					<div class="col-11">
						<c:set var="fbCreateTime" value="${msg.pm_createTime}" />
						<fmt:formatDate type="both" dateStyle="long"
						timeStyle="medium" value="${fbCreateTime}" />
						<br>影片留言:${msg.msgText}
					</div>
            </div>     
            </c:forEach> 
        </div>
           
            <div class="row my-3">
                 <div class="col">
                    <div class="title">新增公開留言:</div>
                    <form action="createPortfolioMsg" method="post">
                        <textarea id="feedback" rows="4" maxlength="100" name="msgText"></textarea>
                        <input type="hidden" name="portfolioId" value="${portfolioId}">
                        <button class="btn btn-primary float-end" type="submit">送出</button>
                    </form>
                </div>
            </div>           
        </div>

		
<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
<!-- --------------------------------------------------------------------------------------->

</body>
</html>
<!--------------------------------------------------------------------------->


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%-- 	pageEncoding="UTF-8"%> --%>

<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> --%>
<%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>

<!-- <!doctype html> -->
<!-- <html lang="en"> -->

<!-- <head> -->
<!-- <!-- Required meta tags------------------------------------------------------------------------------------- --> -->
<!-- <meta charset="utf-8"> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <!-- Bootstrap CSS ----------------------------------------------------------------------------------------- --> -->
<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" -->
<!-- 	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" -->
<!-- 	crossorigin="anonymous"> -->
<!-- <!-- icon cdn----------------------------------------------------------------------------------------------- --> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"> -->

<!-- <!-- css連結------------------------------------------------------------------------------------------------ --> -->
<!-- <link rel="stylesheet" -->
<%-- 	href="<c:url value='/_00_util/allUtil/css/utilLayout.css'></c:url>"> --%>

<!-- <link rel="stylesheet" -->
<%-- 	href="<c:url value='/_00_util/shoppingMallUtil/css/shoppingMallLayout.css'></c:url>"> --%>
<!-- <!-- ---------------------------------------------------------------------------------------------------------> -->
<!-- <title>作品播放</title> -->
<!-- <style> -->
<!-- /*   textarea{ */ -->
<!-- /*             border-radius: 15px; */ -->
<!-- /*             width:100%; */ -->
<!-- /*         } */ -->
<!-- /*   .title{ */ -->
<!-- /*   font-size:2rem; */ -->
<!-- /*   } */ -->
  
<!-- /*   #messageBoard{ */ -->
<!-- /*    font-size:2rem; */ -->
<!-- /*   } */ -->
<!-- /*   .message{ */ -->
<!-- /*             margin: 10px 0px; */ -->
<!-- /*             font-size:1rem; */ -->
<!-- /*           	min-height:200px; */ -->
<!-- /*           	width: 300px; */ -->
           
<!-- /* /*          border: 1px solid grey; */ */ -->
<!-- /*         } */ -->
<!-- /*  .message:hover{ */ -->
<!-- /*  color:grey; */ -->
<!-- /*  border: 1px solid grey; */ -->
<!-- /*  transition:color 2s; */ -->
<!-- /*  } */ -->
<!-- </style> -->


<!-- </head> -->
<!-- <body> -->
<!-- <!--header=================================================================================  --> -->
<!-- 	<div class="HeaderPostition"> -->
<%-- 		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" /> --%>
<!-- 	</div> -->
<!-- <!-----------定位-----------------------------------------------------------------------------> -->
<!-- 	<div class="BodyPosition"> -->
<!-- <!------------------------------------------------------------------------------------------->	 -->

<!-- 	<div class="container-flud"> -->
<!--         <div class="row" style="text-align: center;" > -->
<!--             <div class="col-12"> -->
<!--                 <video src="/a.mp4" controls class="w-75"></video> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
    
<!--     <div class="container"> -->
<!--         <div class="row row-cols-1 row-cols-md-2"> -->
<!--             <div class="col-12"> -->
<%--                 <div class="title">台北101煙火${portfolioName}</div> --%>
<!--             </div> -->
      
           
<!--         </div> -->
<!-- <!-- ------------------------------------------------------------------- --> -->
<!--         <div class="row row-cols-1 row-cols-md-2"> -->
<!--             <div class="col"> -->
<!--                 <div>觀看次數: <span>123456</span>次</div> -->
<!--                 <div>上傳日期: <span>2021年01月01日</span></div> -->
<!--                  	按讚次數 -->
<!-- 				<div id="great"> -->
<!-- 					<a href="#"> <i class="far fa-thumbs-up"></i></a> <span>103</span> -->
<!-- 					<a href="#"> <i class="far fa-thumbs-down"></i></a> <span>1</span> -->
<!-- 				</div>		 -->
<!--             </div> -->
<!--          <div class="col"> -->
<!--                 <div id="tag">#亞洲#台北#台北市#台北101</div> -->
<!--                 <div>位置 : <span>台灣台北</span></div> -->
<!--                 <div>相關連結</div> -->
<!--                 <div><span>台灣</span>(地區一覽表)</div> -->
<!--             </div> -->
<!--         </div> -->
<!-- <!-- ------------------------------------------------------------------- -->         -->
       
<!-- <!-- ------------------------------------------------------------------- -->         -->

<!--         <div class="row row-cols-4"> -->
        	
<!--         	<div class="col-12 title  my-3"> 留言板</div> -->
<!--             <div class="col-3 message my-4"> -->
<!--                    <span style="font-size:1.3rem;" class="fw-bold">#1</span> -->
<!--                    <div> -->
<!--                        打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字 -->
<!-- 					   打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字 -->
<!--                    </div> -->
<!--             </div> -->
<!--             <div class="col message my-4 "> -->
<!--                    <span style="font-size:1.4rem;" class="fw-bold">#2</span> -->
<!--                    <div> -->
<!--                        打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字 -->
<!-- 						打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字 -->
                   
<!--                    </div> -->
<!--             </div> -->
<!--             <div class="col message my-4 "> -->
<!--                    <span style="font-size:1.3rem;" class="fw-bold">#3</span> -->
<!--                    <div> -->
<!--                        打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字 -->
<!-- 						打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字 -->
<!--                    </div> -->
<!--             </div> -->
          
<!--             <div class="col message my-4 "> -->
<!--                    <span style="font-size:1.3rem;" class="fw-bold">#3</span> -->
<!--                    <div> -->
<!--                        打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字 -->
<!-- 						打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字 -->
<!--                    </div> -->
<!--             </div> -->
            
<!--               <div class="col message my-4"> -->
<!--                    <span style="font-size:1.3rem;" class="fw-bold">#3</span> -->
<!--                    <div> -->
<!--                        打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字 -->
<!-- 						打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字 -->
<!--                    </div> -->
<!--             </div> -->
            
<!--               <div class="col message my-4"> -->
<!--                    <span style="font-size:1.3rem;" class="fw-bold">#3</span> -->
<!--                    <div> -->
<!--                        打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字 -->
<!-- 						打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字打一百個字 -->
<!--                    </div> -->
<!--             </div> -->
            
         
<!--         </div> -->
           
<!--             <div class="row my-3"> -->
<!--                  <div class="col"> -->
<!--                     <div class="title">新增公開留言:</div> -->
<%--                     <form action=""> --%>
<!--                         <textarea id="" rows="4" maxlength="100"></textarea> -->
<!--                         <button class="btn btn-primary float-end">送出</button> -->
<%--                     </form> --%>
<!--                 </div> -->
<!--             </div> -->
            
<!--         </div> -->
	
	
	
	
	
<!-- <!-----------定位----------------------------------------------------------------------------->        -->
<!--       </div>	 -->
<!-- <!--內嵌footer--------------------------------------------------------------------------------> -->
<!-- 	<div> -->
<%-- 		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" /> --%>
<!-- 	</div> -->
<!-- <!-- ---------------------------------------------------------------------------------------> -->

<!-- </body> -->
<!-- </html> -->



