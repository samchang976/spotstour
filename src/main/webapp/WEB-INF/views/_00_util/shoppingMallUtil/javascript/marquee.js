function doFirst(){
}

window.addEventListener('load',doFirst);

$(function () {
    setInterval(function(){
    $('#news li:first-child').slideUp(function(){
        $(this).appendTo($('#news')).slideDown();
    });
    
    },1000);
    
});