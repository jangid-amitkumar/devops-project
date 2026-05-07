FROM python:3.14-slim

WORKDIR /app

COPY . .

RUN python -m pip install -r requirements.txt

RUN python manage.py migrate --noinput && \
    python manage.py collectstatic --noinput

EXPOSE 8000

ENTRYPOINT [ "python" ]

CMD [ "manage.py", "runserver", "0.0.0.0:8000" ]