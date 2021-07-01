from django.shortcuts import render,get_object_or_404
from rest_framework.response import Response
from .serializers import AccountSerializer,ClientSerializer,OperationsSerializer
from .models import Account,Client,Operations
from rest_framework import generics,mixins
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated


class MultipleFieldLookupMixin:
   
    def get_object(self):
        queryset = self.get_queryset()             # Get the base queryset
        queryset = self.filter_queryset(queryset)  # Apply any filter backends
        filter = {}
        for field in self.lookup_fields:
            if self.kwargs[field]: # Ignore empty fields.
                filter[field] = self.kwargs[field]
        obj = get_object_or_404(queryset, **filter)  # Lookup the object
        self.check_object_permissions(self.request, obj)
        return obj

# Create your views here.
class AccountGenericApi(mixins.ListModelMixin,
mixins.RetrieveModelMixin,mixins.CreateModelMixin,
mixins.UpdateModelMixin,generics.DestroyAPIView):
    serializer_class = AccountSerializer
    queryset = Account.objects.all()
    lookup_field = 'code'
    permission_classes = [IsAuthenticated]

    def get(self,request,code=None):
        if code:
            return self.retrieve(request)
        else:
            return self.list(request)

    def post(self,request):
        return self.create(request)

    def put(self,request,code=None):
        return self.update(request)


class ClientGenericApi(mixins.ListModelMixin,
mixins.RetrieveModelMixin,mixins.CreateModelMixin,
mixins.UpdateModelMixin,generics.DestroyAPIView,MultipleFieldLookupMixin):
    serializer_class = ClientSerializer
    queryset = Client.objects.all()
    lookup_field = 'NoClient'
    lookup_fields = ['lastName','firstName']
    permission_classes = [IsAuthenticated]
        
    def get(self,request,NoClient=None):
        if NoClient:
            return self.retrieve(request)
        elif lastName!=None or firstName!=None:
            obj = self.get_object()
            serializer = self.get_serializer(instance=obj)
            return Response(serializer.data)
        else:
            return self.list(request)

    def post(self,request):
        return self.create(request)

    def put(self,request,NoClient=None):
        return self.update(request)

class OperationsGenericApi(generics.GenericAPIView,mixins.ListModelMixin,
mixins.RetrieveModelMixin,mixins.CreateModelMixin,MultipleFieldLookupMixin):
    serializer_class = OperationsSerializer
    queryset = Operations.objects.all()
    lookup_field = 'id_op'
    lookup_fields = ['type','date']
    permission_classes = [IsAuthenticated]

    def get(self,request,id_op=None,type=None,date=None):
        if id_op:
            return self.retrieve(request)
        elif type!=None or date!=None:
            obj = self.get_object()
            serializer = self.get_serializer(instance=obj)
            return Response(serializer.data)
        else:
            return self.list(request)

    def crediter(self,request):
        code = request.data['account']
        account = Account.objects.get(code = int(code))
        account.balance += float(request.data['amount'])
        account.save()

    def debiter(self,request):
        code = request.data['account']
        account = Account.objects.get(code = int(code))
        if(account.balance>=request.data['amount']):
            account.balance -= float(request.data['amount'])
        else: 
            return Response('Opération impossible !!')
        account.save()

    def post(self,request):
        if request.data['type'] == 'D':
            self.debiter(request)
        elif request.data['type'] == 'C':
            self.crediter(request)
        return self.create(request)
