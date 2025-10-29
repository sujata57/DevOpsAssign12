FROM python:3.10-slim
WORKDIR /app
COPY ../../django_app/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt
COPY ../../django_app /app
ENV PYTHONUNBUFFERED=1
CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8000"]
