from django.db import models

# Create your models here.


class User(models.Model):
    uphone = models.CharField(
        max_length=11, null=True, verbose_name='用户电话')
    uname = models.CharField(max_length=20, verbose_name='用户姓名')
    upassword = models.CharField(max_length=20, verbose_name='用户密码')
    isActive = models.BooleanField(default='True', verbose_name='是否启用')

    def __str__(self):
        return self.uname

    class Meta:
        db_table = 'user'
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name


class Address(models.Model):
    aname = models.CharField(max_length=20, verbose_name='收件人')
    aphone = models.CharField(max_length=11, null=True, verbose_name='收件电话')
    address = models.CharField(max_length=50, null=True, verbose_name='收件地址')
    user = models.ForeignKey(User, null=True, verbose_name='买家信息')

    def __str__(self):
        return self.aname

    class Meta:
        db_table = 'address'
        verbose_name = '收件地址'
        verbose_name_plural = verbose_name


class CarType(models.Model):
    cartype = models.CharField(max_length=20, verbose_name='车的类型')

    def __str__(self):
        return self.cartype

    class Meta:
        db_table = 'cartype'
        verbose_name = '车的类型'
        verbose_name_plural = verbose_name


class CarBrand(models.Model):
    carbrand = models.CharField(max_length=20, verbose_name='车的品牌')

    def __str__(self):
        return self.carbrand

    class Meta:
        db_table = 'carbrand'
        verbose_name = '车的品牌'
        verbose_name_plural = verbose_name


class CarColor(models.Model):
    carcolor = models.CharField(max_length=20, verbose_name='车的颜色')

    def __str__(self):
        return self.carcolor

    class Meta:
        db_table = 'carcolor'
        verbose_name = '车的颜色'
        verbose_name_plural = verbose_name


class Car(models.Model):
    carname = models.CharField(max_length=20, null=True, verbose_name='车名')
    carprice = models.FloatField(null=True, verbose_name='价格')
    carimage = models.ImageField(
        upload_to='static/upload/car/title', null=True, verbose_name='图片')
    cartype = models.ForeignKey(CarType, null=True, verbose_name='车的类型')
    carbrand = models.ForeignKey(CarBrand, null=True, verbose_name='车的品牌')
    carcolor = models.ManyToManyField(CarColor, verbose_name='车的颜色')

    def __str__(self):
        return self.carname

    class Meta:
        db_table = 'car'
        verbose_name = '车'
        verbose_name_plural = verbose_name


class Comment(models.Model):
    uname = models.CharField(max_length=20, null=True, verbose_name='用户名')
    comment = models.CharField(max_length=300, verbose_name='评价')
    carname = models.CharField(max_length=20, null=True, verbose_name='车名')
    createdat = models.DateTimeField(
        null=True, verbose_name='评价时间', auto_now=True)
    car = models.ForeignKey(Car, null=True, verbose_name='车的信息')
    user = models.ForeignKey(User, null=True, verbose_name='用户信息')

    def __str__(self):
        return self.comment

    class Meta:
        db_table = 'comment'
        verbose_name = '评论'
        verbose_name_plural = verbose_name


class Image(models.Model):
    image = models.ImageField(upload_to='static/upload/car', verbose_name='图片')
    carname = models.CharField(max_length=20, null=True, verbose_name='车名')
    car = models.ForeignKey(Car, verbose_name='车的信息')

    def __str__(self):
        return self.carname

    class Meta:
        db_table = 'image'
        verbose_name = '图片'
        verbose_name_plural = verbose_name


class Cart(models.Model):
    uname = models.CharField(max_length=20, null=True, verbose_name='用户名')
    carimage = models.ImageField(
        upload_to='static/upload/car/cart', null=True, verbose_name='图片')
    carname = models.CharField(max_length=20, null=True, verbose_name='车名')
    carcount = models.IntegerField(default=1, verbose_name='数量')
    carprice = models.FloatField(null=True, verbose_name='单价')
    createdat = models.DateTimeField(
        null=True, verbose_name='加入购物车时间', auto_now=True)
    user = models.ForeignKey(User, verbose_name='用户')
    # car = models.ForeignKey(Car, verbose_name='车')

    def __str__(self):
        return self.carname

    class Meta:
        db_table = 'cart'
        verbose_name = '购物车'
        verbose_name_plural = verbose_name


class Order(models.Model):
    carname = models.CharField(max_length=20, null=True, verbose_name='车名')
    uaddress = models.CharField(max_length=20, null=True, verbose_name='收货地址')
    car_id = models.IntegerField(default=0, verbose_name='车id')
    carprice = models.FloatField(null=True, verbose_name='车价格')
    carcount = models.IntegerField(default=1, verbose_name='数量')
    carimage = models.ImageField(
        upload_to='static/upload/car/order', null=True, verbose_name='图片')
    createdat = models.DateTimeField(
        null=True, verbose_name='订单创建时间', auto_now=True)
    user = models.ForeignKey(User, verbose_name='用户')
    address = models.ForeignKey(Address, verbose_name='收件地址')

    # def __str__(self):
    #     return self.carname

    class Meta:
        db_table = 'order'
        verbose_name = '订单'
        verbose_name_plural = verbose_name
        ordering = ['-createdat']
