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

    
        // 修改
       /* let Quantity = document.querySelectorAll(`input[type="number"]`); //取得所有input數量(商品數量)
        // alert(Quantity.length);
        // alert(Quantity[0]);

        for (i = 0; i < Quantity.length; i++) {
            // alert("aa");
            Quantity[i].addEventListener('change', function () { //input的change事件
                // let QuantityInfo = document.querySelector(`#${this.id}`).value;
                // alert(QuantityInfo);
                // QuantityInfo = document.getElementById("sc_Id=2").value;
                // alert(QuantityInfo);
                // alert(`${this.id}`)
                // `${this.id}`; //input的id
                sc_Id = `${this.id}`; //被點到的input的id
                QuantityInfo = document.getElementById(`${sc_Id}`).value; //修改的數量值

                // alert(sc_Id);
                // alert(QuantityInfo);
                //如何把轉乘json==========================================================================================
                json = { sc_Id: sc_Id, s_ordQty: QuantityInfo };
                // alert(json);
                alert(JSON.stringify(json));
                // alert(`${this.id}`);
                var xhr1 = new XMLHttpRequest();
                xhr1.open("PUT","shoppingCart/put/Id",true)

                xhr1.setRequestHeader("Content-Type","application/json;charset=UTF-8");
                xhr1.send(JSON.stringify(json)); 
                xhr.onreadystatechange = function() {
                    if (xhr.status == 200 && xhr.readyState == 4)
                    //alert(xhr.responseText); //把這個資料傳成html文件
                    alert(xhr.responseText);
                       
                
                //======================================================================================================
            });
            // alert(yourCheck);

            //========================================================================
        }}*/
        anountMethod();
        totalAmount();
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

function newQtyChange2(sc_Id,index) {
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
                // newQty.value = xhr.responseText;	
                alert(`商品數量已修改為${newQty}`)	;
                anountMethod();
                totalAmount();
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


//商品小計計算==========================================================================
function anountMethod() {

    var items = document.querySelectorAll(".CartItem");
    for (i = 0; i < items.length; i++) {
        Qty = parseInt(document.getElementById("Qty"+i).value); //商品選擇數量
        // alert(Qty);
        price = parseInt(document.getElementById("uniPrice" + i).innerText); //商品小計
        anount = price * Qty;
        // alert(anount);
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