from rest_framework import serializers
from .models import Account,Client,Operations

class OperationsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Operations
        fields = '__all__'
        extra_kwargs= {'id_op':{'required':False}}
        depth = 1

class AccountSerializer(serializers.ModelSerializer):
    operations = serializers.SlugRelatedField(many=True,queryset=Operations.objects.all(),
    slug_field='id_op')
    class Meta:
        model = Account
        fields = '__all__'
        extra_kwargs= {'code':{'required':False}}

class ClientSerializer(serializers.ModelSerializer):
    accounts = AccountSerializer(many=True)
    class Meta:
        model = Client
        fields = '__all__'
        depth = 1
