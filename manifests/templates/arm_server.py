from django.core.handlers.wsgi import WSGIHandler
import os
import sys

os.environ['DJANGO_SETTINGS_MODULE'] = 'config.development'

sys.path.insert(0, os.path.dirname(__file__))

application = WSGIHandler()
