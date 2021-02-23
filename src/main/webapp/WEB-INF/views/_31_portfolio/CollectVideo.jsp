<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CollectVideo收藏的影片</title>
    <style>
    hr{
    width: 95%;
    }
    .circle{
    margin: 0 auto ;
    width:300px;height:180px;
    background-color:rgb(180, 179, 179);
    }

    div{
        display: inline-block;
        margin: 10px 10px 10px 10px;
    }
    
    
    </style>
</head>
<body>
    <input type="button" value="全選">
    <input type="button" value="全選刪除收藏的影片">
    <br>
    <br>
    <br>
    <div class="content">

        <input type="checkbox" name="history" >
        <div class="circle"></div>
        <div>
        <span>台北101 跨年煙火影片</span><br>
        <span>觀看次數:  123,456次</span><br>
        <span>上傳日期: 2021年01月01日</span><br>
        </div>
        <input type="button" value="刪除觀看紀錄">
        
    </div>
    <hr>
    <div class="content">

        <input type="checkbox" name="history" >
        <div class="circle"></div>
        <div>
        <span>台北101 跨年煙火影片</span><br>
        <span>觀看次數:  123,456次</span><br>
        <span>上傳日期: 2021年01月01日</span><br>
        </div>
        <input type="button" value="刪除觀看紀錄">
        
    </div>
   
</body>
</html>