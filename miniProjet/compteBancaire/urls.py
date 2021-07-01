from django.urls import path
from . import views
from .views import AccountGenericApi,ClientGenericApi,OperationsGenericApi
from rest_framework.authtoken.views import obtain_auth_token 

urlpatterns = [
    path('account/',views.AccountGenericApi.as_view()),
    path('account/<int:code>/',views.AccountGenericApi.as_view()),
    path('operations/',views.OperationsGenericApi.as_view()),
    path('operations/<int:id_op>/',views.OperationsGenericApi.as_view()),
    path('operations/<slug:date>/',views.OperationsGenericApi.as_view()),
    path('operations/<str:type>/',views.OperationsGenericApi.as_view()),
    path('operations/<str:type>/<slug:date>/',views.OperationsGenericApi.as_view()),
    path('client/',views.ClientGenericApi.as_view()),
    path('client/<str:NoClient>/',views.ClientGenericApi.as_view()),
    path('client/<str:lastName>/<str:firstName>',views.ClientGenericApi.as_view()),
    #path('api-token-auth/', obtain_auth_token, name='api_token_auth'),
]