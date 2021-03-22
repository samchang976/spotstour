<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>世界地圖</title>
    <!--  Header 嵌入 -->    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
    integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
    crossorigin="anonymous" />
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    
     <!--  Header Style 嵌入 -->  
    <style>
        /* body{
            background: rgb(208, 199, 199);
        } */
         a,i{
             /* text-decoration:none; */
             color: #000;
             font-size: 12px;    
         }
 
         a,i:hover{
             color: rgba(13, 0, 255, 0.845); 
         }
           .menuOuter {
             padding: 5px;
             width: 100%;
         }
 
         #option1 {
             display: inline-block;
             float: left;
           
         }
 
         #option2 {
             float: right;
             display: inline-block;
         }
         #SPOTTOUR{
             display: inline-block;
             font-size: 40px;
             font-family: Tahoma;
             color: #000;
 
         }

         /* 側邊選單ＣＳＳ */
         #mwt_mwt_slider_scroll
        {
            left:-200px;
            width:200px;
            top: 170px;	
            position:fixed;
            z-index:9999;
        }
        
        #mwt_slider_content{
            background:#3c5a98;
            text-align:center;
            padding-top:20px;
            height: 100px;
        }
        
        #mwt_fb_tab {
            position:absolute;
            top:70px;
            right:-24px;
            width:24px;
            height: 180px;
            background:#3c5a98;
            color:#ffffff;
            text-align:center;
            padding:9px 0;
        
            -moz-border-radius-topright:10px;
            -moz-border-radius-bottomright:10px;
            -webkit-border-top-right-radius:10px;
            -webkit-border-bottom-right-radius:10px;	
        }
        #mwt_fb_tab i{
         margin-top: 60px;
        }
        
        #hotel,#spots,#resturant{
        border-radius: 10px;
        box-shadow: rgba(0, 0, 0, 0.3) 0px 0px 4px;
        width: 150px;
        height: 72px;
       margin-top: 30px;
        color: #555;
        background-color: #fff;
        font: bold 25px  Verdana, Tahoma, sans-serif;
        cursor: pointer;
        }   

        #hotel:hover,#spots:hover,#resturant:hover{
            background-color: dodgerblue;
            color: #fff;
        }
        
       
    </style>
    
      <!-- 嵌入世界地圖 -->
    <style type="text/css">
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }

      /* Optional: Makes the sample page fill the window. */
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
    
     <script>
      // This example displays a marker at the center of Australia.
      // When the user clicks the marker, an info window opens.
      // The maximum width of the info window is set to 200 pixels.
      function initMap() {
        // const uluru = { lat: 25.064127, lng: 121.539639 };
        const uluru = { lat: 25.064127, lng: 121.539639 };
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 3,
          center: uluru,
        });
      }
    </script>
    
     <!-- 側邊選單控制 -->
    <script type='text/javascript' src='http://code.jquery.com/jquery-1.9.1.min.js'></script>
    <script>
      // 餐廳Ｍap
         $(document).ready(function(){
              $('#resturant').click(function(){
                var currentInfowindow;
            var currentMarker;
            // This example displays a marker at the center of Australia.
            // When the user clicks the marker, an info window opens.
            // The maximum width of the info window is set to 200 pixels.
        
        
        // const uluru = { lat: 25.064127, lng: 121.539639 };

        const uluru = { lat: 2, lng: 121.539639 };
        const uluru1 = { lat: 29, lng: 27.720900 };
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 3,
          center: uluru,
        });

        const contentString =
          '<div id="content">' +
          '<div id="siteNotice">' +
          "</div>" +
          '<a href="https://www.fooish.com/" target="_blank" style="margin-left: 70%; font-size:20px;">查看全部影片</a>'+
          '<hr color="black" size="4px" align="center" width="98%">'+
          ' <div id="Time" style="font-size: 18px;">幾秒前發佈</div>' +
          '<video width="450" height="300" style="margin-left: 20px" controls  >' +
         '<source src="/videoplayback.mp4" type="video/mp4" />'+
         '</video>'  +
         '<h1 id="firstHeading" class="firstHeading" style="margin-left: 20px">榮星花園</h1> <i class="fas fa-star fa-2x"></i>' +
         '<i class="fas fa-star fa-2x"></i>'+
          '<div id="bodyContent">' +
          "<p style=\"color:red; font-size:22px\"><b>我家</b>, also referred to as <b>什麼都不是</b>, is a large " +
          "sandstone rock formation in the southern part of the " +
          "Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) " +
          "south west of the nearest large town, Alice Springs; 450&#160;km " +
          "(280&#160;mi) by road. （我聽你在扯）"  +
          "Heritage Site.</p>" +
          '<p>Attribution: UlurAAAAu, <a href="h.mm-cg.com">' +
          "https://en.wikipedia.org/w/index.php?title=Uluru</a> " +
          "(last visited June 22, 2009).</p>" +

          '<h1 id="firstHeading" class="firstHeading">榮星花園</h1>' +
          '<video controls>' +
         '<source src="/videoplayback1.mp4" type="video/mp4" />'+
         '</video>'  +
          '<div id="bodyContent">' +
          "<p style=\"color:red; font-size:22px\"><b>我家</b>, also referred to as <b>什麼都不是</b>, is a large " +
          "sandstone rock formation in the southern part of the " +
          "Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) " +
          "south west of the nearest large town, Alice Springs; 450&#160;km " +
          "(280&#160;mi) by road. （我聽你在扯）"  +
          "Heritage Site.</p>" +
          '<p>Attribution: UlurAAAAu, <a href="h.mm-cg.com">' +
          "https://en.wikipedia.org/w/index.php?title=Uluru</a> " +
          "(last visited June 22, 2009).</p>" +

          

          "</div>" +
          "</div>";

          const contentString1 =
          '<div id="content">' +
          '<div id="siteNotice">' +
          "</div>" +
          '<h1 id="firstHeading" class="firstHeading" style="font-size:40px">榮星花園1234567</h1>' +
          '<div id="bodyContent">' +
          "<p style=\"color:red; font-size:22px\"><b>我家</b>, also referred to as <b>什麼都不是</b>, is a large " +
          "sandstone rock formation in the southern part of the " +
          "Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) " +
          "south west of the nearest large town, Alice Springs; 450&#160;km " +
          "(280&#160;mi) by road. （我聽你在扯）"  +
          "Heritage Site.</p>" +
          '<p>Attribution: UlurAAAAu, <a href="h.mm-cg.com">' +
          "https://en.wikipedia.org/w/index.php?title=Uluru</a> " +
          "(last visited June 22, 2009).</p>" +
          "</div>" +
          "</div>";
        const infowindow = new google.maps.InfoWindow({
          content: contentString,
          maxWidth: 520,
        });
        const infowindow1 = new google.maps.InfoWindow({
          content: contentString1,
          maxWidth: 1000,
        });
        const marker = new google.maps.Marker({
          position: uluru,
          map,
          title: "Uluru (Ayers Rock)",
        });
        const marker1 = new google.maps.Marker({
          position: uluru1,
          map,
          title: "Uluruaa (Ayers Rock)",
        });
        marker.addListener("click", () => {
          map.setCenter(uluru, 3); //點擊此marker 世界地圖以此為中心
          infowindow.open(map, marker);
          currentInfowindow=infowindow;
          currentMarker=marker;
          infowindow1.close();
          
        });
        marker1.addListener("click", () => {
          map.setCenter(uluru1, 3);  //點擊此marker 世界地圖以此為中心
          infowindow1.open(map, marker1);
          currentInfowindow=infowindow1;
          currentMarker=marker1;
          infowindow.close();
          
        });

        //點擊地圖關閉目前infowindow
        google.maps.event.addListener(map, 'click', function(){ 
        	debugger
        	
console.log(map.center)
        	
        	console.log(map.center.lat())
        	console.log(map.center.lng())
          currentInfowindow.close(map,currentMarker);
        	

           });


    
               });
            });
    
    // 景點Ｍap
    $(document).ready(function(){
                  $('#spots').click(function(){
                    var currentInfowindow;
                var currentMarker;
            // This example displays a marker at the center of Australia.
            // When the user clicks the marker, an info window opens.
            // The maximum width of the info window is set to 200 pixels.
        
        
        // const uluru = { lat: 25.064127, lng: 121.539639 };

        const uluru = { lat: 25.064127, lng: 121.539639 };
        const uluru1 = { lat: 26.220549, lng: 127.720900 };
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 3,
          center: uluru,
        });

        const contentString =
          '<div id="content">' +
          '<div id="siteNotice">' +
          "</div>" +
          '<a href="https://www.fooish.com/" target="_blank" style="margin-left: 70%; font-size:20px;">查看全部影片</a>'+
          '<hr color="black" size="4px" align="center" width="98%">'+
          ' <div id="Time" style="font-size: 18px;">幾秒前發佈</div>' +
          '<video width="450" height="300" style="margin-left: 20px" controls  >' +
         '<source src="/videoplayback.mp4" type="video/mp4" />'+
         '</video>'  +
         '<h1 id="firstHeading" class="firstHeading" style="margin-left: 20px">榮星花園</h1> <i class="fas fa-star fa-2x"></i>' +
         '<i class="fas fa-star fa-2x"></i>'+
          '<div id="bodyContent">' +
          "<p style=\"color:red; font-size:22px\"><b>我家</b>, also referred to as <b>什麼都不是</b>, is a large " +
          "sandstone rock formation in the southern part of the " +
          "Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) " +
          "south west of the nearest large town, Alice Springs; 450&#160;km " +
          "(280&#160;mi) by road. （我聽你在扯）"  +
          "Heritage Site.</p>" +
          '<p>Attribution: UlurAAAAu, <a href="h.mm-cg.com">' +
          "https://en.wikipedia.org/w/index.php?title=Uluru</a> " +
          "(last visited June 22, 2009).</p>" +

          '<h1 id="firstHeading" class="firstHeading">榮星花園</h1>' +
          '<video controls>' +
         '<source src="/videoplayback1.mp4" type="video/mp4" />'+
         '</video>'  +
          '<div id="bodyContent">' +
          "<p style=\"color:red; font-size:22px\"><b>我家</b>, also referred to as <b>什麼都不是</b>, is a large " +
          "sandstone rock formation in the southern part of the " +
          "Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) " +
          "south west of the nearest large town, Alice Springs; 450&#160;km " +
          "(280&#160;mi) by road. （我聽你在扯）"  +
          "Heritage Site.</p>" +
          '<p>Attribution: UlurAAAAu, <a href="h.mm-cg.com">' +
          "https://en.wikipedia.org/w/index.php?title=Uluru</a> " +
          "(last visited June 22, 2009).</p>" +

          

          "</div>" +
          "</div>";

          const contentString1 =
          '<div id="content">' +
          '<div id="siteNotice">' +
          "</div>" +
          '<h1 id="firstHeading" class="firstHeading" style="font-size:40px">榮星花園1234567</h1>' +
          '<div id="bodyContent">' +
          "<p style=\"color:red; font-size:22px\"><b>我家</b>, also referred to as <b>什麼都不是</b>, is a large " +
          "sandstone rock formation in the southern part of the " +
          "Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) " +
          "south west of the nearest large town, Alice Springs; 450&#160;km " +
          "(280&#160;mi) by road. （我聽你在扯）"  +
          "Heritage Site.</p>" +
          '<p>Attribution: UlurAAAAu, <a href="h.mm-cg.com">' +
          "https://en.wikipedia.org/w/index.php?title=Uluru</a> " +
          "(last visited June 22, 2009).</p>" +
          "</div>" +
          "</div>";
        const infowindow = new google.maps.InfoWindow({
          content: contentString,
          maxWidth: 520,
        });
        const infowindow1 = new google.maps.InfoWindow({
          content: contentString1,
          maxWidth: 1000,
        });
        const marker = new google.maps.Marker({
          position: uluru,
          map,
          title: "Uluru (Ayers Rock)",
        });
        const marker1 = new google.maps.Marker({
          position: uluru1,
          map,
          title: "Uluruaa (Ayers Rock)",
        });
        marker.addListener("click", () => {
          map.setCenter(uluru, 3); //點擊此marker 世界地圖以此為中心
          infowindow.open(map, marker);
          currentInfowindow=infowindow;
          currentMarker=marker;
          infowindow1.close();
          
        });
        marker1.addListener("click", () => {
          map.setCenter(uluru1, 3);  //點擊此marker 世界地圖以此為中心
          infowindow1.open(map, marker1);
          currentInfowindow=infowindow1;
          currentMarker=marker1;
          infowindow.close();
          
        });

        //點擊地圖關閉目前infowindow
        google.maps.event.addListener(map, 'click', function(){ 
          currentInfowindow.close(map,currentMarker);

           });
               });
            });
            
       // 住宿Ｍap
                $(document).ready(function(){
                  $('#hotel').click(function(){
                    var currentInfowindow;
                var currentMarker;
            // This example displays a marker at the center of Australia.
            // When the user clicks the marker, an info window opens.
            // The maximum width of the info window is set to 200 pixels.
        
        
        // const uluru = { lat: 25.064127, lng: 121.539639 };

        const uluru = { lat: 26.064127, lng: 110.539639 };
        const uluru1 = { lat: 28.220549, lng: 110.720900 };
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 3,
          center: uluru,
        });

        const contentString =
          '<div id="content">' +
          '<div id="siteNotice">' +
          "</div>" +
          '<a href="https://www.fooish.com/" target="_blank" style="margin-left: 70%; font-size:20px;">查看全部影片</a>'+
          '<hr color="black" size="4px" align="center" width="98%">'+
          ' <div id="Time" style="font-size: 18px;">幾秒前發佈</div>' +
          '<video width="450" height="300" style="margin-left: 20px" controls  >' +
         '<source src="/videoplayback.mp4" type="video/mp4" />'+
         '</video>'  +
         '<h1 id="firstHeading" class="firstHeading" style="margin-left: 20px">榮星花園</h1> <i class="fas fa-star fa-2x"></i>' +
         '<i class="fas fa-star fa-2x"></i>'+
          '<div id="bodyContent">' +
          "<p style=\"color:red; font-size:22px\"><b>我家</b>, also referred to as <b>什麼都不是</b>, is a large " +
          "sandstone rock formation in the southern part of the " +
          "Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) " +
          "south west of the nearest large town, Alice Springs; 450&#160;km " +
          "(280&#160;mi) by road. （我聽你在扯）"  +
          "Heritage Site.</p>" +
          '<p>Attribution: UlurAAAAu, <a href="h.mm-cg.com">' +
          "https://en.wikipedia.org/w/index.php?title=Uluru</a> " +
          "(last visited June 22, 2009).</p>" +

          '<h1 id="firstHeading" class="firstHeading">榮星花園</h1>' +
          '<video controls>' +
         '<source src="/videoplayback1.mp4" type="video/mp4" />'+
         '</video>'  +
          '<div id="bodyContent">' +
          "<p style=\"color:red; font-size:22px\"><b>我家</b>, also referred to as <b>什麼都不是</b>, is a large " +
          "sandstone rock formation in the southern part of the " +
          "Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) " +
          "south west of the nearest large town, Alice Springs; 450&#160;km " +
          "(280&#160;mi) by road. （我聽你在扯）"  +
          "Heritage Site.</p>" +
          '<p>Attribution: UlurAAAAu, <a href="h.mm-cg.com">' +
          "https://en.wikipedia.org/w/index.php?title=Uluru</a> " +
          "(last visited June 22, 2009).</p>" +

          

          "</div>" +
          "</div>";

          const contentString1 =
          '<div id="content">' +
          '<div id="siteNotice">' +
          "</div>" +
          '<h1 id="firstHeading" class="firstHeading" style="font-size:40px">榮星花園1234567</h1>' +
          '<div id="bodyContent">' +
          "<p style=\"color:red; font-size:22px\"><b>我家</b>, also referred to as <b>什麼都不是</b>, is a large " +
          "sandstone rock formation in the southern part of the " +
          "Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) " +
          "south west of the nearest large town, Alice Springs; 450&#160;km " +
          "(280&#160;mi) by road. （我聽你在扯）"  +
          "Heritage Site.</p>" +
          '<p>Attribution: UlurAAAAu, <a href="h.mm-cg.com">' +
          "https://en.wikipedia.org/w/index.php?title=Uluru</a> " +
          "(last visited June 22, 2009).</p>" +
          "</div>" +
          "</div>";
        const infowindow = new google.maps.InfoWindow({
          content: contentString,
          maxWidth: 520,
        });
        const infowindow1 = new google.maps.InfoWindow({
          content: contentString1,
          maxWidth: 1000,
        });
        const marker = new google.maps.Marker({
          position: uluru,
          map,
          title: "Uluru (Ayers Rock)",
        });
        const marker1 = new google.maps.Marker({
          position: uluru1,
          map,
          title: "Uluruaa (Ayers Rock)",
        });
        marker.addListener("click", () => {
          map.setCenter(uluru, 3); //點擊此marker 世界地圖以此為中心
          infowindow.open(map, marker);
          currentInfowindow=infowindow;
          currentMarker=marker;
          infowindow1.close();
          
        });
        marker1.addListener("click", () => {
          map.setCenter(uluru1, 3);  //點擊此marker 世界地圖以此為中心
          infowindow1.open(map, marker1);
          currentInfowindow=infowindow1;
          currentMarker=marker1;
          infowindow.close();
          
        });

        //點擊地圖關閉目前infowindow
        google.maps.event.addListener(map, 'click', function(){ 
          currentInfowindow.close(map,currentMarker);

           });
               });
            });

    $(function(){
        var w = $("#mwt_slider_content").width();
        $('#mwt_slider_content').css('height', ($(window).height() - 20) + 'px' ); 
        
        $("#mwt_fb_tab").mouseover(function(){
            if ($("#mwt_mwt_slider_scroll").css('left') == '-'+w+'px')
            {
                $("#mwt_mwt_slider_scroll").animate({ left:'0px' }, 600 ,'swing');
            }
        });
        
        
        $("#mwt_slider_content").mouseleave(function(){
            $("#mwt_mwt_slider_scroll").animate( { left:'-'+w+'px' }, 600 ,'swing');	
        });	
    });

</script>


<!-- footer -->
<style>
    .footer{
    height:250px;
    background-color:rgb(92, 91, 91); 
    text-align: center;
    }
    p{
        padding: 5px;
        font-family:sans-serif;
        /* color: rgb(202, 204, 206); */
        font-weight: 700;
    }
    .content{
        padding: 15px;
    }
    </style>
      
    <style>

*{box-sizing: border-box;}


.search{
  position: relative;
  width: 80%;
  float: left;  
  margin-left: 20px;
  margin-top: 5px;
}
.search-bar{

  width: 100%;
  height: 32px;
  font-size: 20px;
  border: 2px solid ;
 
   }
.search-btn{
  width: 36px;
  height: 32px;
  
   color: blanchedalmond;
  outline:none;
  border: 2px solid black;
  cursor: pointer;  
  position: absolute;
  top: 0;
  right: 0;  
}

      
    </style>

</head>
<body>


     <!-- Header遷入 -->
    <div class='menuOuter' style="border-bottom: 1px solid black; text-align: center;">
      <!-- Serch bar -->
        <div id='option1'>
          <div class="search"> 
            <input  class="search-bar" type="text" name="search"  id="search"  placeholder="搜尋地點">
            <button class="search-btn"><i class="fas fa-search"></i></button>
      	 </div>
      
        </div>
        <a href="<c:url value='/' />" target="_parent">
            <div id="SPOTTOUR">
            SPOTS-TOUR</div>
        </a>
        <div id='option2'>
            <!-- 內嵌網站把連結導向父層 -->
            <a href="01_MerchandiseIndex.html" target="_parent">
                 <i class="fas fa-cart-plus fa-3x"></i>
            </a>
           
            <!-- <a href='04_MerchandiseDetail.html'>
                <i class="fas fa-cart-plus fa-3x"></i>
            </a> -->
            <a href="#">
                <i class="fas fa-user-alt fa-3x"></i>
            </a>
            <a href="#">
                <i class="fas fa-align-justify fa-3x"></i>         
            </a>
        </div>
        
    </div>

    <div id="map"></div>
   

    <!-- Async script executes immediately and must be after any DOM elements used in callback. -->
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_YJF33PnZP3fjYIJXflZ_Y4K7a3VQSSQ&callback=initMap&libraries=&v=weekly"
      async
    ></script>

    <!-- 嵌入側邊選單 -->
    <div id="mwt_mwt_slider_scroll" >
      <div id="mwt_fb_tab">
          <i class="fas fa-caret-right fa-3x"></i>
     </div>
     <div id="mwt_slider_content" >
          <button type="button" id="resturant">
              <i class="fas fa-utensils fa-2x"></i>
              <span >餐廳</span>
          </button><br>
          <button type="button" id="spots">
              <i class="fas fa-archway fa-2x"></i>
              <span >景點</span>
          </button><br>
          <button type="button" id="hotel">
              <i class="fas fa-bed fa-2x"></i>
              <span >住宿</span>
          </button>
     </div>
 </div>

    <!-- footer 嵌入 -->
    <div class="footer">
        <div class="content">
        <p>SPOTS-TOUR</p>
        <p>2021 &copy; All Rights Reserved</p>
        <p>Contacts us</p>
        <p>spotstour@gmail.com</p>
        </div>
  
        
    </div>

</body>
</html>