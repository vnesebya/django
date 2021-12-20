FROM  python:3.9.4-slim as builder

RUN   apt-get update \
      && apt-get install -y --no-install-recommends \
            apt-utils \
            postgresql-client \
            libpq-dev \
            libffi-dev \
            psutils \
      && rm -rf /var/lib/apt/lists/* \
      && groupadd -r django -g 1000 \
      && useradd -r -m -u 1000 -g django django \
      && mkdir -p /app \
      && chown -R django:django /app

# -----------------------------------------------

USER 1000

ENV PATH=/home/django/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

WORKDIR /app

COPY  ./requirements.txt ./

RUN   pip install -r requirements.txt --no-warn-script-location --no-cache-dir && rm -rf requirements.txt \
      && django-admin startproject app /app

RUN   sed -i "s/^ALLOWED_HOSTS = .*/ALLOWED_HOSTS = ['*']/g" app/settings.py

# ADD src/ .

EXPOSE 8080

STOPSIGNAL SIGINT

CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]

