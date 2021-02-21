<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <!-- icon cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

    <link rel="stylesheet" href="../css/button.css">

    <style>
        #viedo_name {
            font-size: 1.5rem;
        }

        .title {
            font-size: 2rem;
        }
        textarea{
            width: 100%;
        }
    </style>

    <title>編輯影片</title>
</head>

<body>

<!-- header -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/header.jsp" />
    <div class="container">
        <!-- 編輯影片 -->
        <div class="row">
            <div class="col">
                <div class="title">編輯影片</div>
            </div>
        </div>

        <div class="row row-cols-1 row-cols-md-2">
            <div class="col"></div>
            <div class="col">
                <div id="viedo_name">枕頭山</div>
            </div>
        </div>

        <div class="row row-cols-1 row-cols-md-2">
            <div class="col">
                觀看次數 :<span>123456</span>次

                <i class="fas fa-bookmark"></i>
                收藏(<span>1234</span>次)

            </div>
            <div class="col">
                <i class="fas fa-map-marker-alt"></i>
                位置: <span>732臺灣臺南市白河區</span>
            </div>
        </div>

        <div class="row row row-cols-1 row-cols-md-2">
            <div class="col">
                <video src="/a.mp4" controls class="w-100"></video>
            </div>
            <div class="col">
                <div>影片描述:</div>
                <div>
                    <form action="">
                        <textarea name="" id="" rows="10">
只要從白河或附近的沖積平原往關仔嶺 
方向遠眺,就可以看到一座形狀像枕頭一樣的山頭,
那就是枕頭山啦~
由於開礦與雨水沖刷的因素,
使得枕頭山崖面上呈現出三條大而明顯的沖刷痕跡,
因此,有些人把這些沖刷痕跡稱作為「三條龍」。</textarea>
                    </form>
                </div>
            </div>
        </div>
        <div class="row ">
            <div class="col-md-6"></div>
            <div class="col">
                <select class="form-select" aria-label="Default select example">
                    <option selected>選擇預覽方式</option>
                    <option value="time">預覽</option>
                    <option value="look">播放頁預覽</option>
                    <option value="good">世界地圖資訊預覽</option>
                </select>
            </div>
            <div class="col">
                <button class="Bt_blue" type="submit">儲存</button>
                <button class="Bt_blue" type="reset">取消</button>

            </div>
        </div>
    </div>


	<jsp:include page="/WEB-INF/views/_00_util/allUtil/footer.jsp" />
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
        crossorigin="anonymous"></script>
</body>

</html>