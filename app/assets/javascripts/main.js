jQuery(document).ready(function() {
  
  exampleToggles("examples");
  sectionToggles("sections");

  function exampleToggles(section){
  	$("."+section+" h2").each(function(){

  		var text = $(this).html("<a href=''>"+$(this).text()+"</a>");

  	})
    $("."+section+" h2").on("click", function(e){
        $(this).parent(".examples").toggleClass("open-section");
        e.preventDefault();
        return false;
    });
  }


  function sectionToggles(section){
    
  }
});


