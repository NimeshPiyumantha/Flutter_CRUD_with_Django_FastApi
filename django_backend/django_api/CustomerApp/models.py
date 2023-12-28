from django.db import models

# Create your models here.
class Customer(models.Model):
   id = models.AutoField(primary_key=True)
   name = models.CharField(max_length=100)
   address = models.CharField(max_length=100)
   phone = models.CharField(max_length=100)