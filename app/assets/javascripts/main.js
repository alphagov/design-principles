jQuery(document).ready(function() {
  
  $("body").addClass("js-enabled");

  sectionToggles("why");
  sectionToggles("examples");

  function sectionToggles(section){
    $("."+section+" h2").on("click", function(){
        $(this).next().toggle("slow", function(){

        });
    });
    $("."+section+" h2").hover(
      function () {
        $(this).addClass("hover");
      },
      function () {
        $(this).removeClass("hover");
      }
    );
  }
  
});


