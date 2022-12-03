var myVar = setInterval(myTimer, 1000);
function myTimer() {
    var d = new Date();
    var t = d.toLocaleTimeString();
    $("#timeClock").html(t);
}
  
export { myTimer };