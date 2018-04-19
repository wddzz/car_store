from django.conf.urls import url
from .views import *


urlpatterns = [
    url(r'^login/$', login_views, name='login'),
    url(r'^logout/$', logout_views, name='logout'),
    url(r'^sign/$', sign_views, name='sign'),
    url(r'^list/$', list_views, name='list'),
    url(r'^index/$', index_views),
    url(r'^search/$', search_views),
    url(r'^search_out/$', search_out_views),
    url(r'^car_info/$', car_info_views),
    url(r'^addcart/$', addcart_views),
    url(r'^order/$', order_views),
    url(r'^delete_order/$', delete_order_views),
    url(r'^givecomment/$', givecomment_views),
    url(r'^comment/$', comment_views, name='comment'),
    url(r'^add_car_comment/$', add_car_comment_views),
]


urlpatterns += [
    url(r'^cart/$', cart_views, name='cart'),
    url(r'^delete_cart/$', delete_cart_views, name='delete'),
    url(r'^deleteall/$', deleteall_views),
]
