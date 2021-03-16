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

<title>管理退貨商品列表</title>

</head>
<style>
#form {
	margin: 50px auto;
	padding: 20px;
	text-align: left;
	/* border: 1px solid #cccccc; */
	width: 1000px;
	height: 1350px;
	font-size: 20px;
}

.auto {
	line-height: 20px;
	text-align: left;
	padding: 20px;
	margin: 5px;
	border: #ccc 1px solid;
	font-size: 20px;
}
</style>
<body>
<!--header=================================================================================  -->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
<!-----------定位----------------------------------------------------------------------------->
	<div class="BodyPosition">
<!------------------------------------------------------------------------------------------->	
	
		<div class="container">
			<div id="form">
				<div style="text-align: center;"><h3>關於商品資訊</h3></div>
<!-- 				<div>&nbsp;&nbsp;&nbsp;&nbsp;退換貨</div> -->
<!-- 				<div>&nbsp;&nbsp;&nbsp;&nbsp;配送方式</div> -->

				<!-- 從DB抓資料填上 -->
<!-- 				<div class="auto"> -->
<!-- 					<input type="hidden" id="pnumber" name="商品編號"> -->
<!-- 				</div> -->
<!-- 				<br> -->
				<!-- 從DB抓資料填上 -->
<!-- 				<div class="auto"> -->
<!-- 					<input type="hidden" id="pname" name="商品名稱"> -->
<!-- 				</div> -->
				<div class="shadow p-3 mb-5 bg-body rounded">
					<div id="rule">
					
						<ul>
							<li>猶豫期說明＊</li>
							<li>猶豫期相關規範，請參考「 七天猶豫期退貨規範 」。</li>
							<li>＊商品訂購＊</li>
							<li>1.	訂購完成將寄送訂購資訊通知函至您的E-Mail，提醒您！資訊通知函僅代表收到您的訂購資訊，不代表本筆訂單已生效，後續確認您的訂單內容及交易資訊無誤後，成立訂單並為您安排出貨。</li>
							<li>2.	每件商品每個會員帳號限購買3件，超出購買數量或訂購收件資料不正確、無人收件、拒絕收件…等情況，spotstour買東西購物中心有權拒絕接受訂單或取消您的訂單。</li>
							<li>3.	本公司對於所販售具遞延性之商品或服務，消費者權益均受保障，如因合作廠商無法提供商品或服務，本公司聯繫您辦理退貨並全額退款。</li>
							<li>4.	本商品優惠活動因數量有限及相關廠商配合因素，將以消費者下單訂購當時實際回饋或優惠折扣為主，且本公司保留活動更正及終止活動內容的權利。</li>
							<li>5.	當您訂購多筆商品並選擇以信用卡或信用卡分期付款時，spotstour買東西購物中心將就各筆訂單分別向銀行取得授權，惟可能會因信用卡額度不足、發卡行或收單行限制、本公司授信控管或其他系統因素…等問題，導致發生當次的訂單無法全部取得銀行授權成功之情形。如您仍有需要時，請您另循其他方式訂購。</li>
							<li>6.	spotstour買東西購物中心基於網站營運及與供應商之間合約關係，係以終端消費者為銷售商品對象，您認知並聲明您係以終端消費者之身分進行消費。如您購買商品之目的主要供執行業務或投入生產使用，並非單純供最終消費者使用者，spotstour買東西購物中心有權拒絕提供您一般消費者得享有之權益或優惠（包含但不限於提供購物金與信用卡無息分期或折價券及贈品回饋、抽獎、滿額贈活動、快速到貨延遲申訴、七天猶豫期間…等），並得暫停您原以消費者身分註冊帳號之使用。如您有非終端消費者採購之需求者，請您與客服中心聯絡咨詢大宗採購方案。</li>
							<li>7.	spotstour買東西購物中心基於商業經營策略、風險控管與整體消費者權益之保護，有權拒絕特定消費者之交易，包括但不限於：拒絕接受會員登錄、暫停或終止會員帳號、限制會員消費金額或優惠、回饋之使用。如會員有違反本公司相關條款或濫用本公司服務者，並得收回或取消相關回饋點數，並請求因此所生之損害賠償。</li>
							<li>＊商品配送＊</li>
							<li>1.	訂購的商品可能會由不同的廠商供應出貨，故可能無法統一於同一個時段配達，也可能會分箱配送。</li>
							<li>2.	如您訂購的為「快速出貨」商品，且符合「快速到貨服務說明」中服務保證範圍內，於服務承諾時間送達至您指定的地點；如為一般商品，將於確認交易條件無誤且有庫存後的3個工作天出貨（特殊商品需依網頁說明時間出貨），目前暫不提供離島地區配送。</li>
							<li>3.	宅配人員在配送前可能會與您聯絡，請您保持聯絡電話暢通。</li>
							<li>4.	針對大型商品(包括：大型家電、家具床墊、健身按摩器材、機車類...等)，我們將於完成收款確認後，由專人與您確認相關配送細節等聯繫。偏遠區、樓層費及其它加價費用，皆由廠商於約定配送時一併告知，廠商將保留出貨與否的權利。</li>
							<li>5.	超商取貨商品送達指定門市後，將發送簡訊及E-Mail通知您，請在指定的期限內完成取貨。</li>
							<li>6.	本公司配合環保署廢四機回收服務，環保署資源回收專線(0800-000000)，本公司廢四機回收專線(客服專線02-00000000，服務時間：週一至週五（不含例假日）09:00 ~ 18:00)</li>
<!-- 							<li>＊商品退貨＊</li> -->
<!-- 							<li>1.	商品到貨享七天猶豫期之權益（注意！猶豫期非試用期），辦理退貨時，商品必須保持原廠外盒及包裝、商品本體、配件、附隨文件（含贈品及加價購商品），是全新狀態且包裝完整，否則將會影響您的退貨權利。</li> -->
<!-- 							<li>2.	商品退貨時，請以原外箱退回，勿於原廠包裝上黏貼紙張及書寫文字。</li> -->
<!-- 							<li>3.	冷凍及冷藏食品、生鮮商品，容易腐敗、保存期限較短或即將到期之商品，除商品本身有瑕疵或於配送過程失溫導致變質外，將不提供退貨服務。</li> -->
<!-- 							<li>4.	個人衛生用品如：內衣褲、塑身衣、泳裝、襪子、紙尿褲、刮鬍刀、美體刀…等，已拆封 (如剪標、下水等情形…)，除商品本身有瑕疵外，因有影響衛生之虞，無法受理退貨。</li> -->
<!-- 							<li>5.	經拆封之影音商品及智慧財產權保護商品或電腦軟體、電子書、線上遊戲…等非以有形媒介提供之數位內容或一經提供即為完成之線上服務，無法受理退貨。</li> -->
<!-- 							<li>6.	客製化商品、報紙、期刊、雜誌類商品皆無法受理退貨。</li> -->
<!-- 							<li>7.	3C家電用品於猶豫期內請保留原「運送外箱」，勿讓配送人員收走，以便退貨返還時保護商品使用。</li> -->
<!-- 							<li>8.	大型家電如：(冰箱、洗衣機、烘衣機…等。)除商品本身故障或瑕疵外，一經使用將會影響退貨權利。</li> -->
<!-- 							<li>9.	如您購買的商品需要安裝或自行組裝，除商品本身有瑕疵外，欲辦理退貨，可能衍生額外的拆機、整新費用，且無法退回已回收之舊機。</li> -->
<!-- 							<li>10.	發票一經開立不得任意更改或改開發票，請參考「 電子發票說明 」。</li> -->
<!-- 							<li>11.	本網站未提供換貨服務。</li> -->
						</ul>
					</div>
				</div>
				<div style="text-align: center;">
					<button type="submit" class="btn btn-primary"
						onclick="location.href='${pageContext.request.contextPath}/merchandiseIndex'">回商城首頁</button>
				</div>
			</div>
		</div>

<!-----------定位----------------------------------------------------------------------------->
	</div>
<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
<!-- --------------------------------------------------------------------------------------->

</body>
</html>
