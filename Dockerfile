FROM docker.io/python:3.11.2

# activate virtual environment
ENV VIRTUAL_ENV=/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# install necessary software
RUN pip install --upgrade pip
RUN pip install Django==4.2.7 psutil

# copy mysite directory and call it
COPY mysite /mysite
ENV PORT=8000
WORKDIR /mysite

# environmental variables
ENV STUDENT_NAME="Noah Panec"
ENV SITE_NAME="Django Unchained"
ENV DEBUG=1
ENV DATA_DIR="/data"
ENV DJANGO_SUPERUSER_USERNAME="admin"
ENV DJANGO_SUPERUSER_PASSWORD="badpassword"

# run server
RUN mkdir $DATA_DIR
RUN python ./manage.py migrate
RUN python ./manage.py createsuperuser --noinput --email nmpanec@duck.com
CMD python ./manage.py runserver 0.0.0.0:$PORT
