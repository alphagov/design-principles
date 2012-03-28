jQuery(document).ready(function() {
  
  $("body").addClass("js-enabled");

  //sectionToggles("why");
  sectionToggles("examples");

  function sectionToggles(section){
    $("."+section+" h2").on("click", function(){
        $(this).parent(".examples").toggleClass("open-section");
    });
  }
});


