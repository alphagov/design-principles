jQuery(document).ready(function() {
  
  $("body").addClass("js-enabled");

  $("ol li.principle").slide()

});



/* 

Call .slide() on an set of elements
Expects you to do the full width / shadows etc. in your own CSS

*/
(function($) {
  
  $.fn.slide = function () {

    var portHeight = $(document).height();
    var deck = this; // this is the whole set of pages

//    var deck = $(".principle .content");
    
    // private methods for doing stuff
    var _setupElements = function() {
      // on load, set the first one as moving if there's no fragment
      $(deck[0]).css("position", "absolute");
      $(deck[0]).addClass("current"); 

      // 1. set heights, we want them at least as tall as a view port
    
      $(deck).css("min-height", portHeight+"px");

      // 2. this'll set the z-indexes of our pages, so they stack in the correct order
      var i = deck.length,
        j = 1;

      while(i--){
        $(deck[i]).css("z-index", j);
        j++;
      }

      // 3. set body height so we can keep on scrolling
      // get all principle heights, add them up, set as body height
      var bodyHeight = 0;
      $(deck).each(function(){
        bodyHeight = bodyHeight + $(this).height();
      })

      $("body").height(bodyHeight+"px");
      _bindScroll();
    }

    var _checkPosition = function(){
      var current = $('.current');
      // for now, track how many have already been seen by checking pos
      var totalPassed = 0;
      $(deck).each(function(){
        if($(this).css("position") != "fixed"){
          totalPassed = totalPassed + $(this).height();
        }
      })
      var checkPosition = current.offset().top+totalPassed;


      if($(window).scrollTop() > totalPassed){
          // unbind for this screen
          $(window).unbind('scroll.topin', _bindScroll);
          // go off and set the next one, and let it know how far down we've got for position
          _setNext(totalPassed);
      }
    }

    var _bindScroll = function(){
      $(window).bind('scroll.topin', _checkPosition);
    }

    var _bindKeyEvents = function(){
      // on next or back
      // check current, use set next/prev
      // scroll to position with nice easing
    }

    var _manageURL = function(){
      // replace hashed with pushstate for those that can
    }

    var _setNext = function(totalPassed) {
     // stop when there's no more nexts
      var next = $(".current").next();

      $(next).addClass("next");
  
      $(".next").css("position", "absolute");
      $(".next").css("top", totalPassed+"px");

      // class shuffle // needs cleanup
      $(".current").removeClass("current");
      $(".next").addClass("current");
      $(".next").removeClass("next");


      _bindScroll();
    }

    var _setPrev = function() {

    }

    _setupElements();

    return $(this);
  }

})(jQuery);
