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
    let Quantity = document.querySelectorAll(`input[name="Quantity"]`);
    // alert(Quantity);
    for (i = 0; i < Quantity.length; i++) {
        Quantity[i].addEventListener('change', function() {
            let QuantityInfo = document.querySelector(`#${this.id}`).value;          
            // alert(`${this.id}`);
            var xhr1 = new XMLHttpRequest();
            xhr1.open("PUT","<c:url value=''></c:url>">+pk,true)
            var jsonQty={};
            xhr1.setRequestHeader("Content-Type","application/json;charset=UYF-8");
            xhr1.send(JSON.stringify(jsonQty))
            alert(QuantityInfo);
        });
        // alert(yourCheck);
    }
    //========================================================================
    anountMethod();
    totalAmount();

}

//多項刪除鈕，取得多項cartId

//放大鏡會有商品詳細資訊頁面

//庫存數量<商品選擇數量 ==>x
//庫存數量>=於商品選擇數量 ==>v
//更新商品小計

function newQtyChange() {
    alert('hi');
}

//商品小計計算==========================================================================
function anountMethod() {

    var items = document.querySelectorAll(".CartItem");

    for (i = 0; i < items.length; i++) {
        Qty = parseInt(document.getElementById("Qty" + i).value); //商品選擇數量
        price = parseInt(document.getElementById("uniPrice" + i).innerText); //商品選擇數量
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