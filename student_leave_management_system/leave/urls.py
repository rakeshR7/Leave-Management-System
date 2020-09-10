from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.listing, name="leave-listing"),
    url(r'^list$', views.lists, name="leave-lists"),
    url(r'^add$', views.add, name="add"),
    url(r'^delete/(?P<id>\w{0,50})/$', views.delete, name="delete"),
    url(r'^approve/(?P<id>\w{0,50})/$', views.approve, name="approve"),
    url(r'^disapprove/(?P<id>\w{0,50})/$', views.disapprove, name="disapprove"),
    url(r'^update/(?P<leaveId>\w{0,50})/$', views.update, name="update"),
    url(r'^details/(?P<leaveId>\w{0,50})/$', views.update, name="update"),
]

