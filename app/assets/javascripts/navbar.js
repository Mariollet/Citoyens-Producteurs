var prevScrollpos = window.pageYOffset;

window.onscroll = function() {

  var currentScrollPos = window.pageYOffset;
  if (document.getElementById("navbar") != null ) {
    if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
      document.getElementById("navbar").style.backgroundColor = "rgba(255,255,255,1)";
      document.getElementById("navbar").style.borderBottom = "3px solid #9F9B30";
    } else {
      document.getElementById("navbar").style.backgroundColor = "rgba(255,255,255,0.3)";
      document.getElementById("navbar").style.borderBottom = "3px solid transparent";
    }
    if (prevScrollpos > currentScrollPos) {
      document.getElementById("navbar").style.top = "0px";
    } else {
      document.getElementById("navbar").style.top = "-80px";
    }
    prevScrollpos = currentScrollPos;
  }
}
