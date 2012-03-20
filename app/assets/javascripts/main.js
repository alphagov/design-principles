jQuery(document).ready(function() {
  
  $("body").addClass("js-enabled");

  $("ol li.principle").slide({navigation: "nav"});

});



/* 

Call .slide() on an set of elements
Expects you to do the full width / shadows etc. in your own CSS

*/
(function($) {
  
  $.fn.slide = function (options) {

    var portHeight = $(document).height();
    var deck = this; // this is the whole set of pages
    
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
      
      $.each(slideRegister, function(i){
        if($(window).scrollTop() >= this[2]){
          var pos = (this[2] - this[1]);
     
          $("#"+this[0]).next().css("position", "absolute");
          $("#"+this[0]).next().css("top", this[2]+"px");
        }
        else {
          $("#"+this[0]).next().css("position", "fixed");
          $("#"+this[0]).next().css("top", "0px");
        }

      })

    }

    var _bindScroll = function(){
      $(window).bind('scroll.slider', _checkPosition);
    }

    var _bindKeyEvents = function(){
      $("nav a").on("click", function(e){
        console.log(this);
        console.log($(".current").attr("id"));



        e.preventDefault();
        return false;
      });
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
     // $(".previous").removeClass("previous");
      $(".current").removeClass("current");
      $(".next").addClass("current");
      $(".next").removeClass("next");


      _bindScroll();
    }

    var _setPrev = function(previous) {
      //$(previous).css("background-color", "pink");
   
      $(".previous").removeClass("previous");
      //$(".current").css("position", "fixed")
      _bindScroll();
    }

    var slideRegister = new Array; // form of: 0 = id, 1 = height, 2 = position
    var _registerElements = function(){
      var position = 0,
        height = 0;

      // go through deck
      $(deck).each(function(i){

        height = $(this).height(); // 1020

        //if(i != 0){
          position = position + height;
        //}
       
       slideRegister.push([$(this).attr("id"), height, position])
      })
      
      // create an array of id + top position + height
      // on scroll, go through each until top position found within bounds
      // position abs match, and any matches before match
      // position fixed post
    }
    _setupElements();
    _registerElements();
    // if a nav is specified, set up events for it
    if(options.navigation && $(options.navigation).length != 0){
      _bindKeyEvents();
    }

    return $(this);
  }

})(jQuery);
