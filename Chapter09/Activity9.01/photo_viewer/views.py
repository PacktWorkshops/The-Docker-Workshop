from django.shortcuts import render
from photo_viewer.models import Photo

# Create your views here.

def photo_index(request):
    photos = Photo.objects.all().order_by('-created_on')
    context = {
        "photos": photos,
    }

    return render(request, "photo_index.html", context)

def photo_country(request, country):
    photos = Photo.objects.filter(
        country__name__contains=country
    ).order_by(
        '-created_on'
    )
    context = {
        "country": country,
        "photos": photos
    }
    return render(request, "photo_category.html", context)

def photo_detail(request, pk):
    photo = Photo.objects.get(pk=pk)
    context = {"photo": photo}
    return render(request, "photo_detail.html", context)
