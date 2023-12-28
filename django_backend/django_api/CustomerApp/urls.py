from django.urls import path
from CustomerApp import views

from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
                    path('customers', views.customerApi),
                    path('customers/<int:id>', views.customerApi),
]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)