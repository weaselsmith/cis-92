import os
import psutil

from django.shortcuts import render
from django.http import HttpResponse

def index(request):
    return HttpResponse("Hello, world. You're at the poll index.")

def site_index(request):
    template_data = {
            'user': os.environ.get('STUDENT_NAME', "(No Username)"),
            'host': os.environ.get('SITE_NAME', "localhost.localdomain"),
            'net_if_addrs': psutil.net_if_addrs(),
            'disk_usage': psutil.disk_usage('/'),
            'loadavg': psutil.getloadavg(),
    }
    return render(request, "index.html", template_data)
