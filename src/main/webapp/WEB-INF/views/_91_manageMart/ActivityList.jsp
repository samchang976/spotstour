<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>活動管理清單</title>
<link rel="stylesheet" href="button.css">
<link rel="stylesheet" href="font.css">
<style>
body {
	margin: 0px;
	font-size: 20px;
}

#first { /*最外層的div，包含所有*/
	/* border: rgb(219, 67, 67) solid 1px; */
	/* background: #000; */
	text-align: center;
	margin: auto;
	width: 60%;
}

/* #scoend{   div，檢舉類型選單
           border: rgb(32, 4, 4) solid 1px;
           height: 30px;
           text-align: left;
        }*/
button { /*確定、送出的按鈕排版*/
	padding: 10px;
	color: rgb(24, 24, 168);
	border: 1px rgb(24, 24, 168) solid;
	background-color: rgb(245, 241, 242);
	border-radius: 5px;
}

#confirm {
	text-align: right;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<div id="first">
		<h2>編輯文章標題</h2>
		<form>
			<div>
				<input type="text" name="Reportdescription" placeholder="請輸入內容"
					style="font-size: 20px; font-family: 'Tahoma'; padding: 6px; width: 100%; padding-bottom: 300px;">


				<!-- <div id="scoend">
                    <form >
                        <select name="Report" id="Report" 
                            style="background-color: rgb(208, 210, 212);
                            border-radius: 3px; 
                            border:  1px solid rgb(0, 0, 0);
                            ">
                            <option value="violence">血腥暴力</option>
                            <option value="pornography">色情內容</option>
                            <option value="ImproperPofit">不當營利</option>
                        </select>
                    </form>
                </div>   -->

				<div id="confirm" style="background: #fff;">
					<button>儲存</button>
					<button>返回</button>
				</div>
			</div>

		</form>
	</div>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />

</body>
</html>