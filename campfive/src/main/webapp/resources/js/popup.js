$(document).ready(function(){
    $("#contents").click(function(){
        $("#popup").fadeIn();
    });
    $(".exit").click(function(){
        $("#popup").fadeOut();
    });
    $(".sub").click(function(){
        $("#popup").fadeOut();
    });
});


$(document).ready(function(){
    $("#1a").change(function(){
        if($("#1a").is(":checked")){
            document.getElementById('ak1').innerHTML += '#1a';
            
        }
    });
});
