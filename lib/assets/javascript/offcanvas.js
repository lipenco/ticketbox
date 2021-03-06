(function(e) {
  e.fn.offcanvas = function(t) {
    var n = e.extend({
      hasSidebarLeft: !0,
      hasSidebarRight: !1,
      animated: !0,
      oldPhones: !0,
      enableTouch: !0,
      enableKeys: !0
    }, t),
        r = e.extend({
        sidebarLeft: "#sidebarLeft",
        sidebarRight: "#sidebarRight",
        mainPage: "#page",
        leftBurger: "#leftBurger",
        rightBurger: "#rightBurger"
      }, t);
    return this.each(function() {
      function o(n, s) {
        switch (n) {
        case "right":
          e(r.sidebarRight).removeClass("show");
          e(r.mainPage).addClass("slidRight");
          e(r.sidebarLeft).addClass("slidRight show");
          e(r.leftBurger).addClass("pressed");
          t = 1;
          break;
        case "left":
          e(r.sidebarLeft).removeClass("show");
          e(r.mainPage).addClass("slidLeft");
          e(r.sidebarRight).addClass("slidLeft show");
          e(r.rightBurger).addClass("pressed");
          i = 1;
          break;
        case "shutLeft":
          e(r.leftBurger).removeClass("pressed");
          e(r.mainPage).removeClass("slidRight");
          e(r.sidebarLeft).removeClass("slidRight");
          var o = setTimeout(function() {
            e(r.sidebarLeft).removeClass("show")
          }, 300);
          clearTimeout(o);
          t = 0;
          break;
        case "shutRight":
          e(r.rightBurger).removeClass("pressed");
          e(r.mainPage).removeClass("slidLeft");
          e(r.sidebarRight).removeClass("slidLeft");
          var o = setTimeout(function() {
            e(r.sidebarRight).removeClass("show")
          }, 300);
          clearTimeout(o);
          i = 0
        }
      }
      e(this).addClass("offcanvas");
      e.each(r, function(t, r) {
        n.animated && e(r).addClass("animatedSlide")
      });
      n.oldPhones && e(".scrollableArea").addClass("overthrow");
      var t = 0,
          i = 0,
          s = setTimeout(function(t) {
          e(t).removeClass("show")
        }, 400);
      n.hasSidebarLeft && e(".slideRight").on("click", function(e) {
        t ? o("shutLeft") : o("right");
        return !1
      });
      n.hasSidebarRight && e(".slideLeft").on("click", function(e) {
        i ? o("shutRight") : o("left");
        return !1
      });
      n.hasSidebarLeft && e(".shutLeft").on("click", function(e) {
        o("shutLeft");
        return !1
      });
      n.hasSidebarRight && e(".shutRight").on("click", function(e) {
        o("shutRight");
        return !1
      });
      n.enableKeys && e(this).keydown(function(e) {
        if (e.keyCode === 39) {
          !t && !i && n.hasSidebarLeft ? o("right") : o("shutRight");
          return !1
        }
        if (e.keyCode === 37) {
          !t && !i && n.hasSidebarRight ? o("left") : o("shutLeft");
          return !1
        }
      });
      n.enableTouch && e(this).hammer({
        drag: !1,
        prevent_default: !1,
        css_hacks: !1
      }).on("swipe", function(e) {
        if (e.direction === "right") {
          !t && !i && n.hasSidebarLeft ? o("right") : o("shutRight");
          return !1
        }
        if (e.direction === "left") {
          !t && !i && n.hasSidebarRight ? o("left") : o("shutLeft");
          return !1
        }
      })
    })
  }
})(jQuery);
