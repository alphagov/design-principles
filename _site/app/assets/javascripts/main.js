jQuery(document).ready(function() {
	$("body").addClass("js-enabled");


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
	function setNext(){

		var next = $(".current").next()

		$(next).addClass("next");
		
		$(".current").removeClass("current");

    $(".next").addClass("current").removeClass("next");

    $(".current").css("position", "absolute");

    bindMovement();
	};

	function bindMovement(){

		var current = $('.current');

		$(window).bind('scroll', function(){

    	

    	if($(window).scrollTop() > (current.offset().top+current.height())){
      	  console.log('out');

      	  $(window).unbind("scroll");

        	setNext();
    	}
		});

	}


	// currently viewed needs to be absolutely positioned
	// anything after should remain fixed, anything before can stay absolute

	// on load, set the first one as moving if there's no fragment
	$("ol li.principle:first").css("position", "absolute");
	$("ol li.principle:first").addClass("current");	

	// blaaah.. need to fix this next. it's working through too much stuff. blargh.	
	//bindMovement();


	// if fragment, set that one moving, all previous abs too

	// on scroll, if the current scrolls out of view, set next as abs

	// on scroll, if prev in view, set next as fixed

});