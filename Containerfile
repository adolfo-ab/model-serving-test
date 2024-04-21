FROM python:3.9

WORKDIR /app

COPY app.py /app
COPY requirements.txt /app
COPY mymodel.pkl /app

RUN pip install -r requirements.txt

EXPOSE 8000
ENTRYPOINT ["gunicorn", "-b", "0.0.0.0:8000", "--access-logfile", "-", "--error-logfile", "-", "--timeout", "120"]
CMD ["app:app"]