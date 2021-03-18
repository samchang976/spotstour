function doFirst(){
setInterval(function(){
$('#latestNews li:first-child').slideUp(function(){
    $(this).appendTo($('#latestNews')).slideDown();
});

},4000);
}
window.addEventListener('load',doFirst);