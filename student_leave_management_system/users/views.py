from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.conf import settings
from django.db.models import Q
from django.core.files.storage import FileSystemStorage
from .models import role, user, city, state, country
from django.contrib import messages
from django.db import connection
from student_leave_management_system.utils import getDropDown, dictfetchall


# Create your views here.
def index(request):
    if(request.session.get('authenticated', False) == True):
        return redirect('/users/report')

    context = {
        "message": "Please Log in",
        "error": False
    }
    if(request.method == "POST"):
        try:
            getUser = user.objects.get(user_username=request.POST['username'])
            context['msg'] = getUser
        except Exception, e:
            context['message'] = "Wrong username" + str(e)
            context['error'] = True
            return render(request,'login.html', context)
        if(getUser.user_password == request.POST['password']):
            request.session['authenticated'] = True
            request.session['user_id'] = getUser.user_id
            request.session['user_level_id'] = getUser.user_level_id
            request.session['user_first_name'] = getUser.user_first_name
            return redirect('dashboard')
        else:
            context['message'] = "Wrong Password"
            context['error'] = True
            return render(request,'login.html', context)
    else:
        return render(request,'login.html', context)

def dashboard(request):
    return render(request,'dashboard.html')

def forgot(request):
    return render(request,'forgotpass.html')
def logout(request):
    request.session['authenticated']= False
    request.session['user_id'] = False
    request.session['user_level_id']= False
    request.session['user_first_name']= False
    return redirect('/')

def changepassword(request):
    if (request.method == "POST"):
        try:
            addUser = user(
                user_id = request.session.get('user_id', None),
                user_password = request.POST['user_new_password']
            )
            addUser.save(update_fields=["user_password"])
        except Exception, e:
            return HttpResponse('Something went wrong. Error Message : '+ str(e))
        messages.add_message(request, messages.INFO, "Your Password has been changed successfully !!!")
        return render(request,'change-password.html')

    else:
        return render(request,'change-password.html')
    return render(request,'change-password.html')

def delete(request, userId):
    try:
        deleteUser = user.objects.get(user_id = userId)
        deleteUser.delete()
    except Exception, e:
        return HttpResponse('Something went wrong. Error Message : '+ str(e))
    messages.add_message(request, messages.INFO, "User Deleted Successfully !!!")
    return redirect('/users/report/1')