$(document).ready(function(){
  $("#search_submit").click(function(){
    var tosearch = $("#search").val();
    if(tosearch==''){return;}
    $.ajax({
        url:"/car/search/",
        type:"POST",
        dataType:"json",
        data:{"tosearch":tosearch},
        success:function(result){
                //$('#result').html(ret.result)
                console.log(result);               
                $(location).attr('href', '/car/search_out/');
        }
    })
  });
});