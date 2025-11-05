from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import taskviewset

routers = DefaultRouter()
routers.register(r'tasks', taskviewset, basename='task')

urlpatterns = [
    path('', include(routers.urls)),
]
