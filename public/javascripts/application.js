// Put your application scripts here
window.addEventListener("load", function() { 
  /*window.onscroll = scrolling();
  function scrolling() {*/
    if (window.scrollTop > 150) {
      document.getElementById("nav").style.top = "0";
      document.getElementById("nav").style.position = "absolute";
    } else {
      document.getElementById("nav").style.top = "27rem";
      document.getElementById("nav").style.position = "absolute";
      document.getElementById("nav").style.lineHeight = "2.3rem";
     // $("#nav").css("top", "0").css("position", "relative").css("line-height", "2rem");
    }
 // }
})
