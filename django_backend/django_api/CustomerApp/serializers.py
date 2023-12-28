from rest_framework import serializers
from CustomerApp.models import Customer

class CustomerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Customer
        fields = ('id',
                  'name',
                  'address',
                  'phone')