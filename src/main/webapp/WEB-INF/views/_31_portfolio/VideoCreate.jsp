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

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- <link rel="stylesheet" href="./css/button.css"> -->

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
<!--  地圖搜尋CSS -->
<style>
#viedo_name {
	font-size: 1.5rem;
}

#title {
	font-size: 2rem;
}

/* searchMap 覆蓋在上 */
#searchMap {
	display: none; /*先隱藏 */
	position: fixed;
	z-index: 5;
	width: 600px;
	height: 550px;
	background-color: rgb(248, 243, 236);
}
</style>
<!-- --------------------------------------------------------------------------------------------------------->
<title>影片新增與編輯</title>
</head>

<body>
	<!--header=================================================================================  -->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<!-----------定位----------------------------------------------------------------------------->
	<div class="BodyPosition">
		<!------------------------------------------------------------------------------------------->
		<div class="container " id="container_VideoCreate">
			<!-- 標題:影片新增 -------------------------------------------------------------------------------------->
			<div class="row">
				<div class="col">
					<c:if test="${portfolioId==null}">
						<div id="title">影片新增</div>
					</c:if>
					<c:if test="${portfolioId!=null}">
						<div id="title">影片編輯</div>
					</c:if>
				</div>
			</div>
			<!-- ==============================================================================================-->
			<div class="row row-cols-1 row-cols-md-2">
				<div class="col"></div>

				<div class="col">
					<i class="fas fa-map-marker-alt"></i> 位置:
					<button id="slideButton" style="margin-bottom: 5px;">Click
						Me To Search</button>
					<button id="sendData">確認位置</button>
					<button id="cancelData">重選位置</button>
				</div>
			</div>
			<!-- ==========================================================================================================-->
			<form action="createPortfolio" method="post"
				enctype="multipart/form-data">
				<!-- ==========================================================================================================-->
				<div class="row row-cols-1 row-cols-md-2">
					<div class="col SpotName">
						影片名稱: <input type="text" name="portfolioName"
							placeholder="請輸入影片名稱">
					</div>


					<!---------------------------------------------------------------------------------------------------------- -->
					<div class="col LocationInformation">
						<!-- 地圖搜尋框 --------------------------------------------------------------------------->
						<div id="searchMap">
							<div class="row row-cols-1 row-cols-md-2">
								<div class="col google-map">
									<h5>Search：</h5>
									<div class="form-group">
										<input type="text" id="address" class="form-control"
											ref="site" v-model="site">
									</div>
								</div>
							</div>
							<!-- 放google map的div ------------------------------------------------------------->
							<div class="row">
								<div class="col google-map">
									<h5>Google Map：</h5>
									<div id="map" class="embed-responsive embed-responsive-16by9"></div>
								</div>
							</div>
							經度<input id="lng" type="textbox"> 緯度<input id="lat"
								type="textbox">
						</div>
						<input id="display_address" name="pAddress" type="text"
							placeholder="請輸入位置資訊"> <input type="text"
							name="longitude" placeholder="經度" id="longitude"> <input
							type="text" name="latitude" placeholder="緯度" id="latitude">
					</div>
					<div>
						城市: <select class="form-select" name="cityId"
							aria-label="Default select example"
							style="font-size: 15px; width: 35%; margin-top: 2px; margin-bottom: 10px;">
							<option selected>選擇城市</option>
							<c:forEach items="${cityList}" var="row">
								<option value="${row.cityId}">${row.cityName}</option>
							</c:forEach>
						</select> 影片類型: <select class="form-select" name="placeTypeId"
							aria-label="Default select example"
							style="font-size: 15px; width: 35%; margin-top: 2px; margin-bottom: 10px;">
							<option selected>選擇影片類型</option>
							<c:forEach items="${placeTypeList}" var="row">
								<option value="${row.placeTypeId}">${row.placeType}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<!-- ======================================================================================================= -->
				<!-- 				<div class="row row-cols-1 row-cols-md-2"> -->

				<!-- 					<div class="col"> -->
				<!-- 						經度:<input type="text" name="longitude" placeholder="經度" id="longitude">  -->
				<!-- 						緯度:<input type="text" name="latitude" placeholder="緯度" id="latitude"> -->
				<!-- 					</div> -->

				<!-- 				</div> -->
				<!-- =================================================================================================== -->
				<div class="row row row-cols-1 row-cols-md-2">
					<div class="col">
						<video src="/a.mp4" controls class="w-100"></video>

					</div>

					<div class="col ViedoDescription">
						<div>影片描述:</div>
						<div>
							<input type="text" name="portfolioText" placeholder="請輸入影片描述">
						</div>
					</div>
				</div>
				<!-- =================================================================================================== -->
				<div class="row row row-cols-1 row-cols-md-2 ">
					<div class="col-md-6">
						上傳影片預覽圖: <input type="file" name="videoPic" /><br> 上傳影片: <input
							type="file" name="videoFile" /><br>
					</div>
					<div class="col-md-3" align="left">
						<select class="form-select" aria-label="Default select example">
							<option selected>選擇預覽方式</option>
							<option value="time">預覽</option>
							<option value="look">播放頁預覽</option>
							<option value="good">世界地圖資訊預覽</option>
						</select>
					</div>
					<div class="col-md-3" align="right">
						<button class="Bt_blue" type="submit"
							style="min-width: 100%; width: 40px">儲存</button>
					</div>
				</div>
			</form>
			<div class="row row row-cols-1 row-cols-md-2 ">
				<div class="col-md-6"></div>
				<div class="col-md-3" align="left"></div>
				<div class="col-md-3" align="right">
					<button class="Bt_blue" style="min-width: 100%; width: 40px"
						onclick="location.href='${pageContext.request.contextPath}/personalPortfolio'">取消</button>
				</div>
			</div>
			<!-- =================================================================================================== -->

		</div>

		<!-----------定位----------------------------------------------------------------------------->
	</div>
	<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
	<!-- --------------------------------------------------------------------------------------->
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
	<!-- jquery cdn + 兩個檔案能使用 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>

	<!-- Google Map 將 YOUR_API_KEY 替換成你的 API Key 即可 -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_YJF33PnZP3fjYIJXflZ_Y4K7a3VQSSQ&libraries=places"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.10/vue.min.js"></script>
	<script>
                
            $(document).ready(function(){
                //click Click Me To Search的功能
                $('#slideButton').click(function(){
                    $('#searchMap').stop(true, false).slideToggle(1200,'easeInOutBack');  
				});
			});		

            //blur的功能
            $(document).mouseup(function (e) {
            var container =$("#searchMap"); // 這邊放你想要排除的區塊
            if (!container.is(e.target) && container.has(e.target).length === 0) {
            container.hide(); 
            }
            //確認位置功能
            $('#sendData').click(function(){
                //JQ獲取input值
                 address_val=$('#address').val();
                 lng_val=$('#lng').val();//抓畫面的經度
                 lat_val=$('#lat').val();//抓畫面的緯度
               //jq賦值到input
                $('#display_address').val(address_val);
                $('#longitude').val(lng_val);
                $('#latitude').val(lat_val);
               //可修改 id val等
               $('#searchMap').hide();
			});   

              //重選位置功能
              $('#cancelData').click(function(){
                
                //JQ獲取input值
                $('#address').val("");
                 $('#lng').val("");//抓畫面的經度
                $('#lat').val("");//抓畫面的緯度
               //jq賦值到input
                $('#display_address').val("");
                $('#longitude').val("");
                $('#latitude').val("");

			}); 

            
        });

	</script>
	<!-- map -->
	<script>
        var address_val ;
        const googleMap = new Vue({
          el: '#app',
          data: {
            map: null,
            autocomplete: null,
            site: '', // place API要綁定的搜尋框
            place: null // 存place確定後回傳的資料
          },
          methods: {
            // init google map
            initMap() {
  
              let location = {
                lat: 25.0374865,
                lng: 121.5647688
              };
  
              this.map = new google.maps.Map(document.getElementById('map'), {
                center: location,
                zoom: 4
              });
              
              
            },
            // 地址自動完成 + 地圖的中心移到輸入結果的地址上
            siteAuto() {
              let infowindow = new google.maps.InfoWindow();
              let marker = new google.maps.Marker({ map: map });
              this.autocomplete = new google.maps.places.Autocomplete(this.$refs.site);

             

              this.autocomplete.addListener('place_changed', () => {
                infowindow.close();
                this.place = this.autocomplete.getPlace();
             
                if(this.place.geometry) {
                  let searchCenter = this.place.geometry.location;
                  this.map.panTo(searchCenter); // panTo是平滑移動、setCenter是直接改變地圖中心
                  this.map.setZoom(18); //放大目前搜尋的位置   
                  marker.setVisible(false);
                  // 放置標記
                  marker = new google.maps.Marker({
                    position: searchCenter,
                    map: this.map
                  });
                  marker.setVisible(true);             
                  // info window
                  infowindow = new google.maps.InfoWindow({
                    content: this.place.formatted_address +
                          "<br> <strong >我在這裡喔！</strong>  "
                          +searchCenter
                  });
                
                  
                  
                  infowindow.open(this.map, marker);
                  marker.addListener("click", () => {
                    infowindow.open(map, marker);
                  });
                  

                  //抓目前搜尋位置的經緯度
                  document.getElementById("lat").value=searchCenter.lat(); //抓緯度
                  document.getElementById("lng").value=searchCenter.lng(); //抓經度
                  
                }
                
              });
            
               //點擊地圖選位置
              this.map.addListener("click", (mapsMouseEvent) => {
                 
                let geocoder = new google.maps.Geocoder();
                infowindow.close();
                marker.setVisible(false); 
                 this. map.panTo(mapsMouseEvent.latLng);// panTo是平滑移動、setCenter是直接改變地圖中心
                 this.map.setZoom(18); //放大目前搜尋的位置  
                 geocoder.geocode({ location: mapsMouseEvent.latLng }, (results, status) => {
                if (status === "OK") {
                    if (results[0]) {
                     marker = new google.maps.Marker({
                    position: mapsMouseEvent.latLng,
                    map: this.map
                    });
                    
                    document.getElementById("address").value=results[0].formatted_address;
                // info window
                infowindow = new google.maps.InfoWindow({
               content: results[0].formatted_address+
                         "<br> <strong >我在這裡喔！</strong>  "
                         +mapsMouseEvent.latLng
                 });
   
                 marker.setVisible(true);             
                  infowindow.open(this.map, marker);
                  marker.addListener("click", () => {
                    infowindow.open(map, marker);
                  });
                    } else {
                    window.alert("No results found");
                    }
                } else {
                    window.alert("Geocoder failed due to: " + status);
               }            
            });
            //抓目前搜尋位置的經緯度
            document.getElementById("lat").value=mapsMouseEvent.latLng.lat(); //抓緯度
            document.getElementById("lng").value=mapsMouseEvent.latLng.lng(); //抓經度
             

            });

  
            }
  
          },
          mounted() {
              window.addEventListener('load', () => {
                  this.initMap();
                  this.siteAuto();
                  
                });
          }
        })
      </script>
</body>

</html>