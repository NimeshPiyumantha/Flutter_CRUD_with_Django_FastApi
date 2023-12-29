from django.urls import path
from ItemApp import views

from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
                    path('', views.itemApi),
                    path('/<int:id>', views.itemApi),
]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)