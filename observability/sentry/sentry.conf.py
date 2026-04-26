import os
SECRET_KEY = os.environ['SENTRY_SECRET_KEY']
SENTRY_USE_SSL = True
SENTRY_FEATURES = {
    'organizations:performance-view': True,
}
