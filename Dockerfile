FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip==26.2.0 \
    && pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir --upgrade \
        msgpack==1.2.1 \
        setuptools==83.0.0 \
        urllib3==2.8.0

COPY app.py .

RUN useradd --create-home --shell /bin/bash appuser \
    && chown -R appuser:appuser /app

USER appuser

CMD ["python", "app.py"]