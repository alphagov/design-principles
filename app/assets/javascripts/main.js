jQuery(document).ready(function() {

  sectionToggles("examples");

  function sectionToggles(section){
  	$("."+section+" h2").each(function(){

  		var text = $(this).html("<a href=''>"+$(this).text()+"</a>");

  	})
    $("."+section+" h2").on("click", function(e){
        $(this).parent(".examples").toggleClass("open-section");
        e.preventDefault();
        return false;
    });
  }

  $(".content-types > a").on("click", function(e) {
    $(this).parent(".content-types").toggleClass("open-section");
    e.preventDefault();
    return false;
  });
});


