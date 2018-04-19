
/*$(function(){
    $("#addToCart").bind('click',
            function(){
                //var carcount_elem = $("#carcount");
                //var carcount = carcount_elem.val();
                $.ajax({
                    url:"/car/addcart/", 
                    type:"POST", 
                    dataType:"json", 
                    data:{"carcount":1,"carname":"BMW"},
                    success:function(arg){alert("addToCart ok")}
                })
            }
        )
})
*/

$(document).ready(function(){
  $("#addToCart").click(function(){
    var carcount_elem = $("#carcount");
    var carcount = carcount_elem.val();

    var car_id = $("#car_id").val();
    var carname = $("#carname").html();
    var carprice = $("#carprice").html();

    if(carcount==''){carcount="1"};
    $.ajax({
        url:"/car/addcart/",
        type:"POST",
        dataType:"json",
        data:{"carcount":carcount,"car_id":car_id,"carname":carname,"carprice":carprice,},
        success:function(result){
                //$('#result').html(ret.result)
                console.log(result);
                alert("添加至购物车成功！")
                $(location).attr('href', '/car/cart/');
        }
    })
  });
});