from django.urls import path
from . import views

urlpatterns = [
    path("", views.photo_index, name="photo_index"),
    path("<int:pk>/", views.photo_detail, name="photo_detail"),
    path("<country>/", views.photo_country, name="photo_country"),
]
