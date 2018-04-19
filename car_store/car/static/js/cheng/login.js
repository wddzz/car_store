$(function(){
    /*验证　name属性值为Phone的元素的值的长度必须为13位*/
    $("[name='phone']").blur(function(){
        if(this.value.length != 11){
            $("#phone-show").html('手机号必须是11位')
        }else{
            $("#phone-show").html('');
        }
    });
});