from django.shortcuts import render, redirect
from .models import Login
from django.http import HttpResponse

def register(request):
    if request.method == 'POST':
        u = request.POST.get('username')
        p = request.POST.get('password')
        if u and p:
            Login.objects.create(username=u, password=p)
            return redirect('login')
    return render(request, 'register.html')

def login_view(request):
    if request.method == 'POST':
        u = request.POST.get('username')
        p = request.POST.get('password')
        try:
            user = Login.objects.get(username=u, password=p)
            request.session['username'] = user.username
            return redirect('home')
        except Login.DoesNotExist:
            return render(request, 'login.html', {'error': 'Invalid credentials'})
    return render(request, 'login.html')

def home(request):
    username = request.session.get('username')
    if not username:
        return redirect('login')
    return render(request, 'home.html', {'username': username})

def logout_view(request):
    try:
        del request.session['username']
    except KeyError:
        pass
    return redirect('login')
