from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.conf import settings
from django.db.models import Q
from django.core.files.storage import FileSystemStorage
from .models import student, section, department, semester
from django.contrib import messages
from django.db import connection


# Create your views here.
def login(request):
    context = {
        "message": "Please Log in",
        "error": False
    }
    if(request.method == "POST"):
        try:
            getStudent = student.objects.get(student_reg_id=request.POST['student_reg_id'])
            context['msg'] = getStudent
        except Exception, e:
            context['message'] = "Wrong studentname" + str(e)
            context['error'] = True
            return render(request,'student-login.html', context)
        if(getStudent.student_password == request.POST['password']):
            request.session['authenticated'] = True
            request.session['user_level_id'] = 2
            request.session['student_id'] = getStudent.student_id
            request.session['student_first_name'] = getStudent.student_first_name
            return redirect('student_dashboard')
        else:
            context['message'] = "Wrong Password"
            context['error'] = True
            return render(request,'student-login.html', context)
    else:
        return render(request,'student-login.html', context)

def student_listing(request, studentId):
    if(request.session.get('authenticated', False) != True):
        return redirect('/')
    try:
        studentlist =  student.objects.filter(Q(student_level_id=studentId))
    except Exception, e:
        return HttpResponse('Something went wrong. Error Message : '+ str(e))

    context = {
        "showmsg": True,
        "message": "Student Updated Successfully",
        "studentlist": studentlist
    }
    # Message according Student Role #
    if(studentId == "1"):
        context['heading'] = "Tutor Report";
    if(studentId == "2"):
        context['heading'] = "Students Report";
    return render(request,'student-report.html',context)

def student_dashboard(request):
    return render(request,'student-dashboard.html')

def forgot(request):
    return render(request,'forgotpass.html')

def update(request, studentId):
    studentDetails = student.objects.get(student_id=studentId)

    context = {
    "fn":"update",
    "sectionlist": getDropDown('section', 'section_id'),
    "semesterlist": getDropDown('semester', 'semester_id'),
    "departmentlist": getDropDown('department', 'department_id'),
    "studentdetails":studentDetails
    }
    currentStudentDetails = student.objects.get(student_id = studentId)
    context['sub_heading'] = "Update Details of "+currentStudentDetails.student_first_name;
    if (request.method == "POST"):
        try:
            addStudent = student(
            student_id = studentId,
            student_first_name = request.POST['student_first_name'],
            student_last_name = request.POST['student_last_name'],
            student_reg_id = request.POST['student_reg_id'],
            student_password = request.POST['student_password'],
            student_cgpa = request.POST['student_cgpa'],
            student_semester = request.POST['student_semester'],
            student_section = request.POST['student_section'],
            student_department = request.POST['student_department'])
            
            addStudent.save()
        except Exception, e:
            return HttpResponse('Something went wrong. Error Message : '+ str(e))

        if (request.session.get('student_level_id', None) == 1):    
            messages.add_message(request, messages.INFO, "Student Updated Successfully !!!")
            return redirect('/student/report/'+request.POST['student_level_id'])
    
        context["studentdetails"] = student.objects.get(student_id=studentId)
        messages.add_message(request, messages.INFO, "Your Account Updated Successfully !!!")
        return render(request,'student.html', context)
    else:
        return render(request,'student.html', context)

def getData(id):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM student_student where student_reg_id = '" + id +"'")
    dataList = dictfetchall(cursor)
    if (dataList):
        return dataList[0]
    else:
        return 0

def add(request):
    context = {
    "fn":"add",
    "sectionlist": getDropDown('section', 'section_id'),
    "semesterlist": getDropDown('semester', 'semester_id'),
    "departmentlist": getDropDown('department', 'department_id'),
    "heading":'Student',
    "sub_heading": 'Student',
    }

    if (request.method == "POST"):
        #### Check the User Registration Number exits or not ####
        studenData =  getData(request.POST['student_reg_id'])
        if (studenData):
            messages.add_message(request, messages.ERROR, "User Registration number already exits !!!")
            return render(request,'student.html', context)
        try:
            addStudent = student(
            student_first_name = request.POST['student_first_name'],
            student_last_name = request.POST['student_last_name'],
            student_reg_id = request.POST['student_reg_id'],
            student_password = request.POST['student_password'],
            student_cgpa = request.POST['student_cgpa'],
            student_semester = request.POST['student_semester'],
            student_section = request.POST['student_section'],
            student_department = request.POST['student_department']
            )
            addStudent.save()
            context = { 
            "message" : "Your account has been registered successfully. Login to your account !!!",
            "error": True
            }
        except Exception, e:
            return HttpResponse('Something went wrong. Error Message : '+ str(e))

        return render(request,'login.html', context)

    else:
        return render(request,'student.html', context)

def logout(request):
    request.session['authenticated']= False
    request.session['student_id'] = False
    request.session['user_level_id']= False
    request.session['student_first_name']= False
    return redirect('/')

def changepassword(request):
    if (request.method == "POST"):
        try:
            addStudent = student(
                student_id = request.session.get('student_id', None),
                student_password = request.POST['student_new_password']
            )
            addStudent.save(update_fields=["student_password"])
        except Exception, e:
            return HttpResponse('Something went wrong. Error Message : '+ str(e))
        messages.add_message(request, messages.INFO, "Your Password has been changed successfully !!!")
        return render(request,'change-password.html')

    else:
        return render(request,'change-password.html')
    return render(request,'change-password.html')

def delete(request, studentId):
    try:
        deleteStudent = student.objects.get(student_id = studentId)
        deleteStudent.delete()
    except Exception, e:
        return HttpResponse('Something went wrong. Error Message : '+ str(e))
    messages.add_message(request, messages.INFO, "Student Deleted Successfully !!!")
    return redirect('/student/report/1')

def getDropDown(table, condtion):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM " + table + " WHERE " + condtion)
    dropdownList = dictfetchall(cursor)
    return dropdownList;

def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]