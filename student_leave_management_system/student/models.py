# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.

class student(models.Model):
    student_id = models.AutoField(primary_key=True)
    student_first_name = models.CharField(max_length=255, default = '2')
    student_last_name = models.CharField(max_length=255, default = "")
    student_reg_id = models.CharField(max_length=255, default = "", unique=True)
    student_password = models.CharField(max_length=255, default = "")
    student_cgpa = models.CharField(max_length=255, default = "")
    student_semester = models.EmailField(max_length=255, default = "")
    student_section = models.CharField(max_length=255, default = "")
    student_department = models.CharField(max_length=10, default = "")
    def __str__(self):
        return self.student_first_name

class section(models.Model):
    section_id = models.AutoField(primary_key=True)
    section_title = models.CharField(max_length=255, default = "")
    def __str__(self):
        return self.section_title

class department(models.Model):
    department_id = models.AutoField(primary_key=True)
    department_title = models.CharField(max_length=255, default = "")
    department_description = models.TextField(default = "")
    def __str__(self):
        return self.department_title

class semester(models.Model):
    semester_id = models.AutoField(primary_key=True)
    semester_title = models.CharField(max_length=255, default = "")
    def __str__(self):
        return self.semester_title