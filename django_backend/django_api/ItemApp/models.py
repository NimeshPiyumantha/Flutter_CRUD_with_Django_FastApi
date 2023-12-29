from django.db import models

# Create your models here.
class Item(models.Model):
    code = models.AutoField(primary_key=True)
    description = models.CharField(max_length=100)
    unitPrice = models.CharField(max_length=100)
    qtyOnHand = models.CharField(max_length=100)