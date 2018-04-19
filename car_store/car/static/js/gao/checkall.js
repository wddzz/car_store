$(function(){
    var checkall = $("#checkall2");
    checkall.click(function(){
        if(checkall.prop('checked')){
            $("[name='date']").prop("checked","checked");
        }else{
            $("[name='date']").prop("checked","");
        }
    });

});




