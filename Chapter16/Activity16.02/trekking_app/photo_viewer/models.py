from django.db import models

# Create your models here.

class Country(models.Model):
    name = models.CharField(max_length=20)
    
    def __str__(self):
        return self.name

class Photo(models.Model):
    title = models.CharField(max_length=255)
    body = models.TextField()
    photo = models.ImageField(upload_to='images/', default='Null')
    created_on = models.DateTimeField(auto_now_add=True)
    last_modified = models.DateTimeField(auto_now=True)
    country = models.ManyToManyField('Country', related_name='photo')

    def __str__(self):
        return self.title
