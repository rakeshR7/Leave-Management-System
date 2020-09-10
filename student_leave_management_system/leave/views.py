from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.conf import settings
from django.db.models import Q
from django.core.files.storage import FileSystemStorage
from django.contrib import messages
from django.db import connection


# Create your views here.

def listing(request):
    student_id = str(request.session.get('student_id', None))
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM `leave`, `status`, `type` WHERE leave_type_id = type_id and leave_status = status_id AND leave_student_id = "+student_id)
    leavelist = dictfetchall(cursor)

    context = {
        "leavelist": leavelist
    }

    # Message according medicines Role #
    context['heading'] = "Leave Details";
    return render(request, 'leave-details.html', context)

def lists(request):
    cursor = connection.cursor()
    user_id = str(request.session.get('user_id', None))
    cursor.execute("SELECT * FROM `leave`, `status`, `type` WHERE leave_type_id = type_id and leave_status = status_id AND leave_student_id IN (SELECT student_id FROM `student_student`, `users_user` WHERE student_section = user_section AND student_department = user_department AND student_semester = user_semester AND user_id = "+user_id+")")
    leavelist = dictfetchall(cursor)

    context = {
        "leavelist": leavelist
    }

    # Message according medicines Role #
    context['heading'] = "Leave Details";
    return render(request, 'leave-list.html', context)

def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]

def getData(id):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM `leave`, `student_student`,`section`,`semester`,`department` WHERE leave_student_id = student_id AND student_section = section_id AND student_department = department_id AND student_semester = semester_id AND leave_id = " + id)
    dataList = dictfetchall(cursor)
    return dataList[0];

def getTotalLeave(id):
    cursor = connection.cursor()
    cursor.execute("SELECT SUM(leave_days) as total_leaves FROM `leave` WHERE leave_status = 2 AND leave_student_id = " + id)
    dataList = dictfetchall(cursor)
    return dataList[0];

def update(request, leaveId):
    context = {
        "fn": "update",
        "leaveDetails": getData(leaveId),
        "heading": 'Update Leave',
    }
    if (request.method == "POST"):
        cursor = connection.cursor()
        cursor.execute("""
                   UPDATE leave
                   SET leave_name=%s, leave_desc=%s WHERE leave_id = %s
                """, (
            request.POST['leave_name'],
            request.POST['leave_desc'],
            leaveId
        ))
        context["leaveDetails"] =  getData(leaveId)
        messages.add_message(request, messages.INFO, "Leave updated succesfully !!!")
        return redirect('leave-listing')
    else:
        return render(request, 'leave-detail.html', context)


def add(request):
    student_id = request.session.get('student_id', None)
    totalLeaves = getTotalLeave(str(student_id))
    if (totalLeaves['total_leaves']):
        totalLeaves = 5 - int(totalLeaves['total_leaves'])
    else:
        totalLeaves = 5
    context = {
        "fn": "add",
        "totalLeaves": totalLeaves,
        "typelist": getDropDown('type', 'type_id'),
        "heading": 'Add Leave'
    };
   
    if (request.method == "POST"):
        cursor = connection.cursor()
        cursor.execute("""
		   INSERT INTO `leave`
		   SET leave_student_id=%s, leave_reason=%s, leave_type_id=%s, leave_from_date=%s, leave_to_date=%s, leave_days=%s, leave_description=%s
		""", (
            student_id,
            request.POST['leave_reason'],
            request.POST['leave_type_id'],
            request.POST['leave_from_date'],
            request.POST['leave_to_date'],
            request.POST['leave_days'],
            request.POST['leave_description']
            ))
        return redirect('leave-listing')
    return render(request, 'leave.html', context)

def delete(request, id):
    cursor = connection.cursor()
    sql = 'DELETE FROM leave WHERE leave_id=' + id
    cursor.execute(sql)
    messages.add_message(request, messages.INFO, "Leave Deleted succesfully !!!")
    return redirect('leave-listing')

def approve(request, id):
    cursor = connection.cursor()
    sql = 'UPDATE `leave` set leave_status = 2 WHERE leave_id=' + id
    cursor.execute(sql)
    messages.add_message(request, messages.INFO, "Leave Approved succesfully !!!")
    return redirect('leave-lists')

def disapprove(request, id):
    cursor = connection.cursor()
    sql = 'UPDATE `leave` set leave_status = 3 WHERE leave_id=' + id
    cursor.execute(sql)
    messages.add_message(request, messages.INFO, "Leave Disapproved succesfully !!!")
    return redirect('leave-lists')

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