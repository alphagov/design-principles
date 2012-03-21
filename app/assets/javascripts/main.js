jQuery(document).ready(function() {
  
  $("body").addClass("js-enabled");

  $("ol li.principle").slidedeck({navigation: "nav a"});

});



/* 

Call .slidedeck() on a set of elements
Expects you to do the full width / shadows etc. in your own CSS.
For nav to work, your anchors should match your hrefs (which'll still be useful sans JS).
For best results, specify image heights in CSS/attr to make sure heights are best calced
*/

(function($) {
  
  $.fn.slidedeck = function (options) {

    var portHeight = $(document).height();
    var deck = this,
        slideRegister = new Array,
        hasNavigation = false; // form of: 0 = id, 1 = height, 2 = position
    
    if(options.navigation && $(options.navigation).length != 0){
      hasNavigation = true;
    }
    /*
      This sets up each of the slide pages, making them at least as tall as the viewport.
      It also also sets the bodyHeight to be the total of all pages, so it still scrolls,
      and uses z-index to stack the pages in the right order.
    */
    var _setupElements = function() {

      $(deck[0]).css("position", "absolute"); 
    
      // TODO: make this optional
      $(deck).css("min-height", portHeight+"px");

      var i = deck.length,
        j = 1;

     
      while(i--){
        $(deck[i]).css("z-index", j);
        j++;
      };

      var bodyHeight = 0;

      $(deck).each(function(){
        bodyHeight = bodyHeight + $(this).height();
      })

      $("body").height(bodyHeight+"px");

      _bindScroll();
    };

    /*
      Each time a scroll event is fired, it looks through our registered slides, 
      and positions accordingly.
    */
    var _checkPosition = function(){
      
      $.each(slideRegister, function(i){
        if($(window).scrollTop() >= this[2]){
          var pos = (this[2] - this[1]);
          $("#"+this[0]).next().css({"position": "absolute", "top": this[2]+"px"});
        }
        else {
          $("#"+this[0]).next().css({"position": "fixed", "top": "0px"});
        };

      });

    };

    /*
      This just binds the event for scrolling.
    */
    var _bindScroll = function(){
      $(window).bind('scroll.slider', _checkPosition);
    };

    /*
      If we have a nav element specified, we bind events for those links.
    */
    var _bindNavEvents = function(){
      $(options.navigation).on("click", function(e){
        $(options.navigation).removeClass("sd-selected");
        $(this).addClass("sd-selected");
        var hopTo = $(this).attr("href");
        var match = hopTo.split("#");
      
        $.each(slideRegister, function(){
          if(match[1] == this[0]){
            $("html, body").animate({scrollTop: this[2] - this[1]},1000);
          }
        });

        e.preventDefault();
       
      });
    };

    // TODO: keyboard events. Make this optional.
    var _bindKeyEvents = function(){
      // TODO: up / down should fast skip to next slide. Maybe also space?

      $(document.documentElement).keyup(function (event) {
          if (event.keyCode == 37) {
            $(".sd-selected").parent().prev().children("a").trigger("click");
          } else if (event.keyCode == 39) {
            $(".sd-selected").parent().next().children("a").trigger("click");
          }
      });
      $(document.documentElement).keydown(function (event) {
          if (event.keyCode == 32) {
           $(".sd-selected").parent().next().children("a").trigger("click");
           event.preventDefault();
          }
      });
    };

    var _manageURL = function(){
      // TODO: replace hashed with pushstate for those that can.  
      // TODO: make this optional.
    };
    
    var _registerSlides = function(){
      var position = 0,
          height = 0;

      $(deck).each(function(i){
        height = $(this).height();
        position = position + height;
        slideRegister.push([$(this).attr("id"), height, position])
      });
    };

    // lets go!
    _setupElements();
    _registerSlides();

    
    if(hasNavigation){
      _bindNavEvents();
      _bindKeyEvents();
    };

    return $(this);
  };

})(jQuery);
