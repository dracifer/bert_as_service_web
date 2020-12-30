from django.urls import path

from . import views

urlpatterns = [
  path('', views.index, name='index'),
  path('compute/', views.compute, name='compute'),
]
