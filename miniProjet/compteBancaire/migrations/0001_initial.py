# Generated by Django 3.1.2 on 2021-02-15 19:12

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Account',
            fields=[
                ('code', models.IntegerField(primary_key=True, serialize=False)),
                ('balance', models.FloatField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Operations',
            fields=[
                ('id_op', models.IntegerField(primary_key=True, serialize=False)),
                ('type', models.CharField(max_length=1)),
                ('date', models.DateField(auto_now=True)),
                ('amount', models.FloatField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Client',
            fields=[
                ('NoClient', models.IntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=100)),
                ('firstName', models.CharField(max_length=100)),
                ('address', models.TextField()),
                ('accounts', models.ManyToManyField(blank=True, related_name='clients', to='compteBancaire.Account')),
            ],
        ),
        migrations.AddField(
            model_name='account',
            name='operations',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='compteBancaire.operations'),
        ),
    ]
