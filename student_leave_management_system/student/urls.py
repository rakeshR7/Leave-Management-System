from django.conf.urls import url
from . import views

urlpatterns = [
    #url(r'^$', views.index, name="signin"),
    url(r'^$', views.login, name="login"),
    url(r'^report$', views.student_listing, name="student_listing"),
    url(r'^dashboard$', views.student_dashboard, name="student_dashboard"),
    url(r'^report/(?P<studentId>\w{0,50})/$', views.student_listing, name="student_listing"),
    url(r'^update/(?P<studentId>\w{0,50})/$', views.update, name="update"),
    url(r'^add$', views.add, name="add"),
    url(r'^forgot$', views.forgot, name="forgot"),
    url(r'^logout$', views.logout, name="logout"),
    url(r'^changepassword$', views.changepassword, name="changepassword"),
    url(r'^delete/(?P<studentId>\w{0,50})/$', views.delete, name="delete"),
]