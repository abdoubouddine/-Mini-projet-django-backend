# Generated by Django 3.1.2 on 2021-02-15 19:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('compteBancaire', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='client',
            name='address',
            field=models.TextField(null=True),
        ),
    ]
