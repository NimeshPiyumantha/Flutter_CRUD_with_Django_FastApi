from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse

from ItemApp.models import Item
from ItemApp.serializers import ItemSerializer

# Create your views here.
@csrf_exempt
def itemApi(request,id=0):
    if request.method=='GET':
        items = Item.objects.all()
        items_serializer = ItemSerializer(items, many=True)
        return JsonResponse(items_serializer.data, safe=False)
    elif request.method=='POST':
        item_data=JSONParser().parse(request)
        item_serializer = ItemSerializer(data=item_data)
        if item_serializer.is_valid():
            item_serializer.save()
            return JsonResponse("Added Successfully!!", safe=False)
        return JsonResponse("Failed to Add.",safe=False)
    elif request.method=='PUT':
        item_data = JSONParser().parse(request)
        item=Item.objects.get(code=item_data['code'])
        item_serializer=ItemSerializer(item,data=item_data)
        if item_serializer.is_valid():
            item_serializer.save()
            return JsonResponse("Updated Successfully!!", safe=False)
        return JsonResponse("Failed to Update.", safe=False)
    elif request.method=='DELETE':
        item=Item.objects.get(code=id)
        item.delete()
        return JsonResponse("Deleted Succeffully!!", safe=False)