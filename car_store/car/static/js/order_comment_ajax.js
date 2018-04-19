$(document).ready(function(){
  $("#givecomment").click(function(){
    var carname_elem = $("#carname");
    var carname = carname_elem.html();
    $.ajax({
        url:"/car/givecomment/",
        type:"POST",
        dataType:"json",
        data:{"carname":carname},
        success:function(result){
                //$('#result').html(ret.result)
                console.log(result);
                alert("确定现在评价吗？")
                $(location).attr('href', '/car/comment/');
        }
    })
  });
});


$(document).ready(function(){
  $("#delete_order").click(function(){
    var order_id_elem = $("#order_id");
    var order_id = order_id_elem.html();
    $.ajax({
        url:"/car/delete_order/",
        type:"POST",
        dataType:"json",
        data:{"order_id":order_id},
        success:function(result){
                //$('#result').html(ret.result)
                console.log(result);
                alert("订单已删除")
                $(location).attr('href', '/car/order/');
        }
    })
  });
});
