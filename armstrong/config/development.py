# Development settings for armstrong
from config.defaults import *

DEBUG = True
TEMPLATE_DEBUG = DEBUG

# Change this to work with your default development database
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': './armstrong.db',
        'USER': '',
        'PASSWORD': '',
        'HOST': '',
        'PORT': '',
    }
}

# Attempt to load any settings from config.local_development, but ignore any
# errors complaining about them not being present.
try:
    from config.local_development import *
except ImportError, e:
    pass
