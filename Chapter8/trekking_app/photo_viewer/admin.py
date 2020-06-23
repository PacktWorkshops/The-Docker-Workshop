from django.contrib import admin
from photo_viewer.models import Photo, Country

# Register your models here.

class PhotoAdmin(admin.ModelAdmin):
    pass

class CountryAdmin(admin.ModelAdmin):
    pass

admin.site.register(Photo, PhotoAdmin)
admin.site.register(Country, CountryAdmin)
