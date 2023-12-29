from rest_framework import serializers
from ItemApp.models import Item

class ItemSerializer(serializers.ModelSerializer):
        class Meta:
                model = Item
                fields = ('code',
                          'description',
                          'unitPrice',
                          'qtyOnHand')