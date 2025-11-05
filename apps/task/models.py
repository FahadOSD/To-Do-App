from django.db import models

class Task(models.Model):
    task_name = models.CharField(max_length=50, null=False, blank=False)
    descriptions = models.TextField()
    status = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    time = models.DateTimeField(null=True, blank=True)