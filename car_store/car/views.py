from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from .models import *
from django.views.decorators.csrf import csrf_exempt
import json

import random

# Create your views here.


# 登录
def login_views(request):

    # 验证码显示 verify ,  验证码判断 verify1
    if request.method == 'POST':
        # 1.获取数据，登录判断
        phone = request.POST.get('phone', '')
        pwd = request.POST.get('upwd', '')
        verify1 = request.POST.get('verify', '')
        yzm = request.POST.get('yzm', '')
        # if yzm==verify1:
        if phone and pwd:
            # 登录验证  数据库中查找有无符合 user_phone user_password的数据
            uList = User.objects.filter(uphone=phone, upassword=pwd)
            # 判断uList是否有数据
            if uList:
                # 存入session
                user = uList[0]
                request.session['uid'] = user.id
                request.session['phone'] = user.uphone  # 取对应的键值

                # 判断是否保存密码
                if request.POST.get('isSave', ''):
                    # 将数据保存进cookie
                    response = HttpResponseRedirect('/car/index/')
                    response.set_cookie('uid', user.id, 60 * 60 * 24 * 31)
                    response.set_cookie(
                        'phone', user.uphone, 60 * 60 * 24 * 31)

                #  跳转登录成功页面
                return response
            else:
                errors = '用户名或密码不正确'
                return render(request, 'login.html', locals())
        else:
            errors = '用户名或密码不能为空'
            return render(request, 'login.html', locals())

    else:
        isquit = request.GET.get('quit', '')
        if isquit == 'yes':
            return HttpResponseRedirect('/car/logout/')
        # get请求，做各种判断
        # 1.从session中获取　uid and phone
        uid = request.session.get('uid', '')
        phone = request.session.get('phone', '')
        if uid and phone:
            return HttpResponseRedirect('/car/index')
        else:
            # session中没有值，先判断cookie中是否有值
            uid = request.COOKIES.get('uid', '')
            phone = request.COOKIES.get('phone', '')
            if uid and phone:
                # cookie有值，则保存进session
                request.session['uid'] = uid
                request.session['phone'] = phone
                return HttpResponseRedirect('/car/index')
            else:
                # cookie没值，则重新登录
                data = request.GET
                return render(request, 'login.html', locals())

        return render(request, 'login.html')
        # else :
        #      verify2 = '验证码错误'
        #      return render(request, 'login.html', locals())


def logout_views(request):
    response = HttpResponseRedirect('/car/login/')
    response.delete_cookie('uid')
    response.delete_cookie('phone')
    del request.session["uid"]
    del request.session["phone"]
    return response


# 注册
def sign_views(request):
    errors = []
    # 1．判断请求方式是否为ＰＯＳＴ，如果是，则执行注册操作，否则，则响应给模板
    if request.method == 'POST':
        # 1.1 判断　uname 并获取 判断 uname是否在post中传输，和是否传递了空值
        if 'uname' in request.POST and request.POST['uname']:
            uname = request.POST['uname']
        else:
            errors.append('请输入用户名称')
        # 1.2　判断　upass 并获取
        if 'upass' in request.POST and request.POST['upass']:

            if request.POST['upass'] == request.POST['passWordAgain']:

                upass = request.POST['upass']
            else:
                errors.append('2次输入的密码不一致')
        else:
            errors.append('请输入密码')
        # 1.3　判断uphone 并获取
        if 'uphone' in request.POST and request.POST['uphone']:
            uphone = request.POST['uphone']
        else:
            errors.append('请输入手机号')

        if not errors:
            # 手机号码重复验证
            RepetitionPhone = User.objects.filter(uphone=uphone)
            if RepetitionPhone:
                errors.append('该手机号已经被注册')
                return render(request, 'sign.html', {'errors': errors})
            # 判断 RepetitionPhone 是否有数据
            # 将以上数据保存进数据库
            else:
                User.objects.create(
                    uname=uname, upassword=upass, uphone=uphone, isActive=True)
                return HttpResponse("注册成功<a href='/car/login/'>去登录</a>")
        else:
            return render(request, 'sign.html', {'errors': errors})

    else:
        return render(request, 'sign.html')  # 页面开始时通过get方法


def list_views(request):

    if request.method == 'GET':
        return render(request, 'list.html')


def index_views(request):
    user_id = request.COOKIES.get('uid', '')
    if user_id:
        user = User.objects.get(id=user_id)
    # 首页
    cartype = CarType.objects.get(id=1)
    smallcars = cartype.car_set.all()

    cartype = CarType.objects.get(id=2)
    middlecars = cartype.car_set.all()

    cartype = CarType.objects.get(id=3)
    bigcars = cartype.car_set.all()
    return render(request, 'index.html', locals())


@csrf_exempt
def search_views(request):
    tosearch = request.POST.get('tosearch')
    print("tosearch-->", tosearch)

    searchallcars = []  # 将searchcars置空
    if tosearch != '':
        for s in tosearch:
            if s == ' ':
                continue
            searchcars = Car.objects.filter(carname__icontains=s)
            # print("searchcars--->", searchcars)
            for searchcar in searchcars:
                if searchcar not in searchallcars:
                    searchallcars.append(searchcar)
        # print("searchallcars-->", searchallcars)

    cars = []
    for car in searchallcars:
        # print(car)
        # print("car.carimage-->", car.carimage)
        cars.append(car.id)
    # print(cars)

    request.session['searchcars'] = cars

    if tosearch:
        return_json = {'result': tosearch}
    # print("return_json:", return_json)
    result = json.dumps(return_json)
    # print("result:", result)
    return HttpResponse(result, content_type='application/json')


def search_out_views(request):
    car_ids = request.session.get('searchcars')
    cars = []
    for car_id in car_ids:
        car = Car.objects.get(id=car_id)
        cars.append(car)
    return render(request, 'search_out.html', locals())


def car_info_views(request):
    # print(request.GET)
    user_id = request.COOKIES.get('uid', '')
    if user_id:
        user = User.objects.get(id=user_id)
    car_id = request.GET['car_id']
    car = Car.objects.get(id=car_id)
    comments = car.comment_set.all()
    return render(request, 'car_info.html', locals())
    # else:
    #     return HttpResponseRedirect("/car/login/")


@csrf_exempt
def addcart_views(request):
    add_carcount = int(request.POST.get('carcount'))
    print(add_carcount)
    # request.session['carcount'] = carcount
    # print("session['carcount']:", request.session.get('carcount', ''))

    add_carname = request.POST.get('carname')
    add_carprice = float(request.POST.get('carprice').split("￥")[1])
    add_car_id = request.POST.get('car_id')
    car = Car.objects.get(id=add_car_id)
    print(car)

    user_id = request.COOKIES.get('uid', '')
    if user_id:
        user = User.objects.get(id=user_id)
        carts = user.cart_set.all()

        # for cart in carts:
        #     if cart.carname == add_carname:
        cart = carts.filter(carname=add_carname)

        # print("cart-->", cart)
        # print("cart[0]-->", cart[0])
        # print("cart[0].carcount-->", cart[0].carcount)
        print("cart.value-->", cart.values())

        if cart:
            print("true")
            cart[0].carcount += add_carcount
            # cart.carcount += add_carcount
            cart[0].save()
        else:
            cart = Cart(user=user, uname=user.uname, carimage=car.carimage,
                        carname=add_carname, carprice=add_carprice,
                        carcount=add_carcount)
            cart.save()
    # print("request.body:", request.body)
    # print("request.POST:", request.POST)
    return_json = {'result': [add_carcount,
                              add_carname, add_carprice, add_car_id]}
    print("return_json:", return_json)
    result = json.dumps(return_json)
    print("result:", result)
    return HttpResponse(result, content_type='application/json')


@csrf_exempt
def cart_views(request):
    user_id = request.COOKIES.get('uid', '')
    if user_id:
        user = User.objects.get(id=user_id)
        carts = user.cart_set.all()
        if request.method == 'GET':
            return render(request, 'cart_info.html', locals())
        else:
            carcount = request.POST.get('amount')
            carname = request.POST.get('carname')
            cart = Cart.objects.filter(user_id=user_id, carname=carname)
            cart.update(carcount=carcount)
            return render(request, 'cart_info.html', locals())
    else:
        return HttpResponseRedirect("/car/login/")
    # if request.method == 'GET':
    #     user_id = request.COOKIES.get('uid', '')
    #     if user_id:
    #         user = User.objects.get(id=user_id)
    #         carts = user.cart_set.all()
    #         # for cart in carts:
    #         #     car = Car.objects.get(carname=cart.carname)
    #         #     cart.carimage = car.carimage
    #         return render(request, 'cart_info.html', locals())
    #     else:
    #         return HttpResponseRedirect("/car/login/")
    # else:
    #     user_id = request.COOKIES.get('uid', '')
    #     user = User.objects.get(id=user_id)

    #     carcount = request.POST.get('amount')
    #     carname = request.POST.get('carname')
    #     carts = user.cart_set.all()
    #     cart = Cart.objects.filter(user_id=user_id, carname=carname)
    #     cart.update(carcount=carcount)
    #     # for cart in carts:
    #     #     # print(cart.car)
    #     #     print(cart.user)
    #     #     if cart == Cart.objects.get(carname=carname):
    #     #         cart.carcount = carcount
    #     # else:
    #     #     Cart.objects.create(user=user, carcount=amount,
    #     #                         car=car, uname=user.uname, 
    #     #                         carname=car.carname,
    #     #                         carprice=car.carprice)
    #     return render(request, 'cart_info.html', locals())


@csrf_exempt
# 删除单条购物车
def delete_cart_views(request):
    user_id = request.COOKIES.get('uid', '')
    # user = User.objects.get(id=user_id)
    # carts = user.cart_set.all()

    delcarname = request.POST.get('carname')
    print("delcarname-->", delcarname)
    # for cart in carts:
    #     if cart == Cart.objects.get(carname=delcarname):
    #         print(cart)
    #         cart.delete()
    #         break
    cart = Cart.objects.filter(user_id=user_id, carname=delcarname)
    cart.delete()
    # user_id = 1
    # cart_id = request.GET.get('id')
    # cart = Cart.objects.filter(id=cart_id)
    # cart.delete()
    # return render(request, 'cart_info.html')
    return_json = {'result': delcarname}
    result = json.dumps(return_json)
    print("result:", result)
    return HttpResponse(result, content_type='application/json')


@csrf_exempt
# 结算，删除所有购物车
def deleteall_views(request):
    user_id = request.COOKIES.get('uid', None)
    user = User.objects.get(id=user_id)
    carts = user.cart_set.all()
    print("carts-->", carts)

    # carnamelist = request.POST.get('carnamelist')
    # aa = carnamelist.split(",")
    # print(aa)

    carcount = request.POST.get('carcount')
    for cart in carts:
        print("cart-->", cart)
        carname = cart.carname
        car = Car.objects.filter(carname=carname)[0]
        print("car-->", car)
        order = Order(car_id=car.id, carname=cart.carname,
                      carprice=cart.carprice, carcount=carcount,
                      carimage=cart.carimage, address_id=1,
                      user=user)
        order.save()
        cart.delete()
        # for x in aa:
        #     if x:
        #         car = Car.objects.get(carname=x)
        #         print("car-->", car)
        #         if cart == Cart.objects.filter(carname=car.carname):
        #             print("cart-->", cart)
    return_json = {'result': carcount}
    result = json.dumps(return_json)
    print("result:", result)
    return HttpResponse(result, content_type='application/json')


@csrf_exempt
def delete_order_views(request):
    order_id = int(request.POST.get("order_id", ''))
    print("order_id-->", order_id)
    order = Order.objects.get(id=order_id)
    order.delete()

    return_json = {'result': order_id}
    result = json.dumps(return_json)
    print("result:", result)
    return HttpResponse(result, content_type='application/json')


def order_views(request):
    user_id = request.COOKIES.get('uid', '')
    if user_id:
        user = User.objects.get(id=user_id)
        orders = user.order_set.all()
        # orders = orders.filter('-createdat')
        return render(request, 'order.html', locals())
    else:
        return HttpResponseRedirect("/car/login/")


@csrf_exempt
def givecomment_views(request):
    commentcarname = request.POST.get('carname')
    print(commentcarname)
    car = Car.objects.get(carname=commentcarname)
    print("car-->", car)
    car_id = car.id
    request.session['car_id'] = car_id
    print("request.session['car_id']", request.session['car_id'])
    return_json = {'result': car_id}
    result = json.dumps(return_json)
    print("result:", result)
    return HttpResponse(result, content_type='application/json')


def comment_views(request):
    user_id = request.COOKIES.get('uid', '')
    if user_id:
        user = User.objects.get(id=user_id)
    car_id = request.session.get('car_id', '')
    car = Car.objects.get(id=car_id)
    print(car)
    return render(request, 'comment.html', locals())


@csrf_exempt
def add_car_comment_views(request):
    user_id = request.COOKIES.get('uid', '')
    if user_id:
        user = User.objects.get(id=user_id)
    commentcarname = request.POST.get('carname')
    commentcontent = request.POST.get('content')
    print(commentcarname, commentcontent)
    car = Car.objects.filter(carname=commentcarname)[0]
    print(car)
    comment = Comment(uname=user.uname, comment=commentcontent,
                      carname=car.carname, car=car, user=user)
    print(comment)
    comment.save()
    return_json = {'result': commentcontent}
    result = json.dumps(return_json)
    print("result:", result)
    return HttpResponse(result, content_type='application/json')
