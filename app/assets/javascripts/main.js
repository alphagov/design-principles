jQuery(document).ready(function() {
  
  $("body").addClass("js-enabled");

  //$("ol li.principle").slidedeck({navigation: "nav a", keyevents: true, urls: false, fullheight: true});

  $(".content").css("display", "none")
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


