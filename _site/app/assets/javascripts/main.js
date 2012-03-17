jQuery(document).ready(function() {
	$("body").addClass("js-enabled");
// on load, set the first one as moving if there's no fragment
	$("ol li.principle:first").css("position", "absolute");
	$("ol li.principle:first").addClass("current");	

	// 1. set heights, we want them at least as tall as a view port
	var portHeight = $(document).height();
		portHeight = portHeight; 
	$("ol li.principle").css("min-height", portHeight+"px");

	var principles = $("ol li.principle");

	// 2. this'll set the z-indexes of our pages, so they stack in the correct order
	var i = principles.length,
		j = 1,
		len = principles.length;

	while(i--){
		$(principles[i]).css("z-index", j);

		j++;
	}

	// 3. set body height so we can keep on scrolling
	// get all principle heights, add them up, set as body height
	var bodyHeight = 0;
	$(principles).each(function(){
		bodyHeight = bodyHeight + $(this).height();
	})

	$("body").height(bodyHeight+"px");



	// 4. now lets get them moving
	function setNext(totalPassed){

		// stop when there's no more nexts
		var next = $(".current").next();

		$(next).addClass("next");
	
		$(".next").css("position", "absolute");
		$(".next").css("top", totalPassed+"px");

    // class shuffle // needs cleanup
    $(".current").removeClass("current");
    $(".next").addClass("current");
    $(".next").removeClass("next");


    bindMovement();
	};


	var scrolling = function(){

    	var current = $('.current');

    	// for now, track how many have already been seen by checking pos
    	var totalPassed = 0;
    	$(".principle").each(function(){
    		if($(this).css("position") != "fixed"){
    			totalPassed = totalPassed + $(this).height();
    		}
    	})
    	var checkPosition = current.offset().top+totalPassed;


    	if($(window).scrollTop() > totalPassed){
    			// unbind for this screen
      	  $(window).unbind('scroll.topin', scrolling);
      	  // go off and set the next one, and let it know how far down we've got for position
        	setNext(totalPassed);
    	}
  }

	function bindMovement(){

		$(window).bind('scroll.topin', scrolling);

	}

	bindMovement();


	// if fragment, set that one moving, all previous abs too

	// on scroll, if the current scrolls out of view, set next as abs

	// on scroll, if prev in view, set next as fixed

});