from django.db import models

# Create your models here.

class Client(models.Model):
    class Meta:
        db_table = 'clients'

    NoClient = models.CharField(primary_key=True,max_length=8,db_column='CIN')
    lastname = models.CharField(max_length=100)
    firstName = models.CharField(max_length=100,db_column='prenom')
    address = models.TextField(null=True)
   

    def __str__(self):
        return "{} - {}".format(self.NoClient,self.lastname)
        
class Account(models.Model):
    class Meta:
        db_table = 'accounts'

    code = models.AutoField(primary_key=True,db_column='code')
    balance = models.FloatField(default=0,db_column='solde')
    clients = models.ManyToManyField(Client,related_name='comptes')

    def __str__(self):
        return "{}".format(self.code)


class Operations(models.Model):
    class Meta:
        db_table = 'operations'

    DEBIT = 'D'
    CREDIT = 'C'
    TYPE = [(DEBIT,'D'),(CREDIT,'C'),]
    id_op = models.AutoField(primary_key=True,db_column='id')
    type = models.CharField(max_length=1,choices=TYPE,default=DEBIT)
    date = models.DateField(auto_now=True)
    amount = models.FloatField(default=0)
    account = models.ForeignKey(Account,default=0,on_delete=models.CASCADE,related_name='operations')

    def __str__(self):
        return "{} - {}".format(self.id_op,self.type)
    
    

    
