from django.contrib import admin
from .models import Account,Operations,Client

# Register your models here.
admin.site.register(Account)
admin.site.register(Operations)
admin.site.register(Client)