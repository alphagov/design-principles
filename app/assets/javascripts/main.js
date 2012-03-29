jQuery(document).ready(function() {

  //sectionToggles("why");
  sectionToggles("examples");

  function sectionToggles(section){
    $("."+section+" h2").on("click", function(){
        $(this).parent(".examples").toggleClass("open-section");
    });
  }
});


