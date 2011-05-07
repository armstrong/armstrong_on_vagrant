DEBUG = True
TEMPLATE_DEBUG = True

ROOT_URLCONF = "config.urls"

INSTALLED_APPS = (
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.sites",
    "armstrong.core.arm_content",
    "armstrong.core.arm_wells",
    "armstrong.apps.embedded_videos",
)
