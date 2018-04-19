$(document).ready(function(){
  $("#submitcomment").click(function(){
    var content_elem = $("#content");
    var content = content_elem.val();
    var carname = $("#carname").html();

    $.ajax({
        url:"/car/add_car_comment/",
        type:"POST",
        dataType:"json",
        data:{"carname":carname,"content":content,},
        success:function(result){
                //$('#result').html(ret.result)
                console.log(result);
                alert("评价成功！感谢您的评价");
                $(location).attr('href', '/car/order/');
        }
    })
  });
});