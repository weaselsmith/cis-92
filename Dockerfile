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
ENV STUDENT_NAME="Noah Panec"
ENV SITE_NAME="Django Unchained"
ENV DEBUG=1

# run server
CMD python ./manage.py migrate
CMD python ./manage.py createsuperuser
CMD python ./manage.py runserver 0.0.0.0:$PORT
