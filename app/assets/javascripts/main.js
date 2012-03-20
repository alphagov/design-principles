jQuery(document).ready(function() {
  
  $("body").addClass("js-enabled");

  $("ol li.principle").slide({navigation: "nav a"});

});



/* 

Call .slide() on an set of elements
Expects you to do the full width / shadows etc. in your own CSS

*/
(function($) {
  
  $.fn.slide = function (options) {

    // global vars for plugin
    var portHeight = $(document).height();
    var deck = this,
        slideRegister = new Array; // form of: 0 = id, 1 = height, 2 = position
    
    // private methods for doing stuff
    var _setupElements = function() {
      // Get everything going
      $(deck[0]).css("position", "absolute");
      $(deck[0]).addClass("current"); 
    
      // Force out the min-heights, for a nicer effect 
      // TODO: make this optional
      $(deck).css("min-height", portHeight+"px");

      var i = deck.length,
        j = 1;

      // Stack the deck in the right order, and max out the body
      while(i--){
        $(deck[i]).css("z-index", j);
        j++;
      }

      var bodyHeight = 0;

      $(deck).each(function(){
        bodyHeight = bodyHeight + $(this).height();
      })

      $("body").height(bodyHeight+"px");

      // get the scroll events going
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
      $(options.navigation).on("click", function(e){

        var hopTo = $(this).attr("href");
        var match = hopTo.split("#");
      
        // TODO: need to set each along the way, until match?
        $.each(slideRegister, function(){
          if(match[1] == this[0]){
            $("html, body").animate({scrollTop: this[2]},1000);
     
          }
        })

        
      });

      //TODO: keyboard events
     
    }

    var _manageURL = function(){
      // replace hashed with pushstate for those that can
    }


    
    var _registerSlides = function(){
      var position = 0,
          height = 0;

      $(deck).each(function(i){
        /*if(i == 1){

          $(this).css("clear", "both");
          $(this).css("height", "100%");

          console.log($(this).height())
          console.log($(this).innerHeight())
          console.log($(this).css("height"))
          var elem = document.getElementById($(this).attr("id"));  
          var calcheight = window.getComputedStyle(elem,null).getPropertyValue("height"); 
          console.log(calcheight) 
        }*/

        height = $(this).height();
        position = position + height;

        slideRegister.push([$(this).attr("id"), height, position])
      })

    }

    // lets go!
    _setupElements();
    _registerSlides();

    // if a nav is specified, set up events for it
    if(options.navigation && $(options.navigation).length != 0){
      _bindKeyEvents();
    }

    return $(this);
  }

})(jQuery);
