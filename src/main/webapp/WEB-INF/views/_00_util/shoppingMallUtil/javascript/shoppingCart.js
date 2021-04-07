function doFirst() {
    //先跟畫面產生關聯，再建事件聆聽功能
    //全選======================================================================
    checkedALL = document.getElementsByName('deleteItems');
    document.getElementById('checkedALL').onclick = function checkAll() {
        // alert(checkedALL);
        for (var i = 0; i < checkedALL.length; i++) {
            var checkElement = checkedALL[i];
            // 方法一
            // checkElement.setAttribute('checked',' checked');
            // 方法二
            checkElement.checked = "checked";
        }
    }
    //========================================================================
    dels = document.getElementById('delitems');
    dels.addEventListener('click',de);
    //========================================================================

        stockIsOk();
        anountMethod();
        totalAmount();
        // BtcheckIsOk();
    }



    
//判斷庫存
function stockIsOk(){
    let items = document.querySelectorAll(".CartItem");
    for(i=0;i<items.length;i++){
        Qty = parseInt(document.getElementById("Qty"+i).value); //商品選擇數量
        Stock=parseInt(document.getElementById("Stock"+i).innerText);//庫存數量
        // alert(Stock);

        if(Qty > Stock){ //庫存數量不足
            document.getElementById("Stock"+i).innerText = "";
            stock = document.getElementById("Stock"+i);
            var a = document.createElement("i");
            a.setAttribute("class", "fas fa-times");
            stock.appendChild(a);

            // sub = document.getElementById("BtcheckNow");
            // sub.setAttribute("disabled","true");
            // sub.setAttribute("class","btn btn-secondary btn-lg")
            
            alert("庫存數量不足，請修改數量!");
            
            item = document.getElementById('CartItem'+i);
            item.setAttribute("class","row check");
        }
        if(Qty <= Stock){ //庫存足夠
            document.getElementById("Stock"+i).innerText = "";
            stock = document.getElementById("Stock"+i);
            var a = document.createElement("i");
            a.setAttribute("class", "fas fa-check");
            stock.appendChild(a);
        }
    }	
}


//多選刪除
function de(){
    // alert("aaa");
    WereBeDelitems = "";
    for(let d=0; d<checkedALL.length; d++ ){
        WereBeDel =  document.getElementById("de"+d);
        if(WereBeDel.checked === true){
            WereBeDelitems += (WereBeDel.value)+",";
            // alert(WereBeDelitems);
        }
    }
    if(WereBeDelitems==""){
        alert("請選擇要刪除的項目");
    }else{         
        url= "/SpotsTourHSM/shoppingCart/MultipleDelete?items=";
        document.location.href=url+WereBeDelitems ;
                               
        // var xhr = new XMLHttpRequest();
        // xhr.open("GET", "<c:url value='/shoppingCart/MultipleDelete/'/>"+WereBeDelitems, false);

        // xhr.send();

    }

    
    
}

//更新商品小計
function newQtyChange(id,index,itemId,mId) {
    // alert(index);
    var x = "Qty"+index; //index=迴圈執行次數
    var newQty = document.getElementById(x).value; //取得數量
    // alert(newQty);
    // document.forms[0].action="shoppingCart/updateQty?sc_Id=" + id + "&s_ordQty=" + newQty +"&mId="+mId+"&itemId="+itemId;
    document.forms[0].action="shoppingCart/updateQty?sc_Id=" + id + "&s_ordQty=" + newQty ;

    document.forms[0].method="POST";
    document.forms[0].submit();
}

function newQtyChange2(sc_Id,index,Stock) {
    // alert(index);
    var x = "Qty"+index; //index=迴圈執行次數
    var newQty = document.getElementById(x).value; //取得數量

    // ajax的非同步請求
    // 步驟一: 新建XMLHttpRequest物件
    var xhr = new XMLHttpRequest();
    // 步驟二: 經由AJAX提出HTTP請求
    if (xhr != null) {
        xhr.onreadystatechange=function(){
            // if(xhr.readyState==2){
            //     alert("有偵測到送出send()~")	;
            // }
            // if(xhr.readyState==3){
            //     alert("回應資料下載中");
            // }
            if (xhr.readyState == 4 && xhr.status == 200){
                if(newQty>Stock){
                    alert("庫存數量不足，請修改數量!");
                    document.getElementById("Stock"+index).innerText = "";
                    stock = document.getElementById("Stock"+index);
                    var a = document.createElement("i");
                    a.setAttribute("class", "fas fa-times");
                    stock.appendChild(a);

                    item = document.getElementById('CartItem'+index);
                    item.setAttribute("class","row check");
                    BtcheckIsOk();
                }else{
                    alert(`商品數量已修改為${newQty}`)	;
                    document.getElementById("Stock"+index).innerText = "";
                    stock = document.getElementById("Stock"+index);
                    var a = document.createElement("i");
                    a.setAttribute("class", "fas fa-check");
                    stock.appendChild(a);

                    item = document.getElementById('CartItem'+index);
                    item.setAttribute("class","row");

                    anountMethod();
                    totalAmount();
                    // BtcheckIsOk();


                }

            }
        }
        // alert(` <c:url value='shoppingCart/updateQty2?sc_Id=  ${id}  &s_ordQty=  ${newQty} '/>`);
        let url =`shoppingCart/updateQty2?sc_Id=${sc_Id}&s_ordQty=${newQty}`;
        // alert(url);
        xhr.open('GET',url , true);
        // xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");//post方法一定要設
        // let newQtyindex=`${id}+${index}`;
        // xhr.send("sc_Id="+sc_Id+"&s_ordQty"+newQty);
        xhr.send();
        

        
        // 步驟三: 處理伺服器送回的回應資料
    } else {
       alert("您的瀏覽器不支援Ajax");
    }


}
//判斷按鈕可不可按
// function BtcheckIsOk(){
//     let items = document.querySelectorAll(".CartItem");
//     for(i=0;i<items.length;i++){
//         Stock=document.getElementById("Stock"+i).innerHTML;
//         sub = document.getElementById("BtcheckNow");
//         // alert(Stock.length);
//         alert( Stock.slice(17, 22));
//         if(Stock.slice(17, 22)==="times"){
//             alert("x");
//             sub.setAttribute("disabled","true");
//             sub.setAttribute("class","btn btn-secondary btn-lg")
//             }
//         // }else{
//         //     alert("ok");
//         //     // sub.setAttribute("disabled","");
//         //     sub.setAttribute("class","btn btn-primary btn-lg")
//         // }
//     }
// }


//商品小計計算==========================================================================
function anountMethod() {

    var items = document.querySelectorAll(".CartItem");
    alert(items.length);
    for (i = 0; i < items.length; i++) {
        Qty = parseInt(document.getElementById("Qty"+i).value); //商品選擇數量
        alert(Qty);
        price = parseInt(document.getElementById("uniPrice" + i).innerText); //商品小計
        anount = price * Qty;
        alert(anount);
        document.getElementById("Total" + i).innerText = anount;

    }
    // 			alert(Money);
    // document.getElementById("TotalMoney").innerText = Money;

}

//總金額計算功能========================================================================
function totalAmount() {
    var items = document.querySelectorAll(".CartItem");
    // alert(items.length);
    // alert(document.getElementById("TotalMoney").innerText);
    Money = 0; //金額從0開始
    parseInt(Money);
    // alert(typeof Money);
    // alert(Money);
    for (i = 0; i < items.length; i++) {
        Toto = parseInt(document.getElementById("Total" + i).innerText);
        // 				alert(Toto);
        Money = Money + Toto;
    }
    document.getElementById("TotalMoney").innerText = Money;

}

window.addEventListener('load', doFirst);