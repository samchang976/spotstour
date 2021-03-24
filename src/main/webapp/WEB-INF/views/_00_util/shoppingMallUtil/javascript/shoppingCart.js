function doFirst() {
    //先跟畫面產生關聯，再建事件聆聽功能
    //全選======================================================================
    document.getElementById('checkedALL').onclick = function checkAll() {
        checkedALL = document.getElementsByName('checkboxs');
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


//多項刪除鈕，取得多項cartId

//放大鏡會有商品詳細資訊頁面

//庫存數量<商品選擇數量 ==>x
//庫存數量>=於商品選擇數量 ==>v
//更新商品小計

function newQtyChange(id,index,itemId,mId) {
    // alert(index);
    var x = "Qty"+index; //index=迴圈執行次數
    var newQty = document.getElementById(x).value; //取得數量
    // alert(newQty);
    document.forms[0].action="shoppingCart/updateQty?sc_Id=" + id + "&s_ordQty=" + newQty +"&mId="+mId+"&itemId="+itemId;
    document.forms[0].method="POST";
    document.forms[0].submit();

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