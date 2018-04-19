$(function(){
    // 初始化计算购物车每类物品的价格
    function getprice(){
    var aa = $(".tprice")
    for (var i =0;i<aa.length ;  i++) { 
         var price = parseInt(aa[i].previousElementSibling.previousElementSibling.innerHTML)
         console.log(price)
         var number = parseInt(aa[i].previousElementSibling.children[1].value)
         var tprice = price*number
         aa[i].innerHTML = tprice
     }     
     };
     getprice()


     // 计算总价格
    function getTotalprice(){
    var aa = $(".tprice")
    var sum = 0;
    for (var i =0;i<aa.length ;  i++) { 
         var total = parseInt(aa[i].innerHTML)
         sum += total
     }
     console.log(total)
     return sum
     };
    $('#play').html(getTotalprice())


    // 将页面数据数量，商品名字传入后台
    $(document).on("blur","#change",function(){
        var amount = $(this).children(".input").val()
        var carname = $(this).prev().prev().prev().html()
        if(amount == ""){
            return;
        }
        $.ajax({
            url:"/car/cart/",
            data:{"amount":amount,"carname":carname},
            type:"POST",
            async:"true",
            success: function(data,status,xhr){
                console.log(status)

            },
            error: function(xhr,status,error){
                console.log(status)
            }
        })
    });

    // 进行商品数量增加的运算
    $(document).on("click",".add",function(){
        var amount = Number($(this).prev().val())
        var pay = $(this).parent().next()
        var price = $(this).parent().prev().html()
        if(amount<10){
            amount+=1
            $(this).prev().val(amount)
            pay.text(amount*price)
        }else{
            amount=10
            $(this).prev().val(amount)
            pay.text(amount*price)
        }
        function getTotalprice(){
        var aa = $(".tprice")
        var sum = 0;
        for (var i =0;i<aa.length ;  i++) { 
             var total = parseInt(aa[i].innerHTML)
             sum += total
         }
         console.log(total)
         return sum
         };

        $('#play').html(getTotalprice())
    });


    // 进行商品数量减少的运算
    $(document).on("click",".sub",function(){
        var amount = Number($(this).next().val())
        var pay = $(this).parent().next()
        var price = $(this).parent().prev().html()
        if(amount>1){
            amount-=1
            $(this).next().val(amount)
            pay.text(amount*price)
        }else{
            amount=1
            $(this).next().val(amount)
            pay.text(amount*price)
        }
        function getTotalprice(){
        var aa = $(".tprice")
        var sum = 0;
        for (var i =0;i<aa.length ;  i++) { 
             var total = parseInt(aa[i].innerHTML)
             sum += total
         }
         console.log(total)
         return sum
         };

        $('#play').html(getTotalprice())
    });

    // 结算操作，数据传后台，删除页面数据
    $('#doplay').click(function(){
        var doplay = $('.carname');
        var carcount = $("#carcount").val();
        console.log(doplay);
        var carnamelist = "";
        for (var i = 0; i <doplay.length; i++) {
             var pp = doplay[i].innerHTML
             carnamelist+=(pp+",")
        }
        console.log(carnamelist);
        $.ajax({
            url:"/car/deleteall/",
            data:{"carcount":carcount},
            type:"POST",
            async:"true",
            success: function(result){
                console.log(result);
                alert("结算成功！");
                $(location).attr('href', '/car/order/');
            },
        });
        //var all = $('.cartbox')
        //all.remove()
    })
});


$(document).ready(function(){
  $("#deletecart").click(function(){
    var carname = $("#carname").html();
    $.ajax({
        url:"/car/delete_cart/",
        type:"POST",
        dataType:"json",
        async:"true",
        data:{"carname":carname},
        success:function(result){
                //$('#result').html(ret.result)
                console.log(result);
                alert("删除成功")
                $(location).attr('href', '/car/cart/');
        }
    })
  });
});