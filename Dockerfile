FROM python:3.11-slim

RUN useradd -m -u 1001 appuser

WORKDIR /app

RUN python3 -m pip install --no-cache-dir --force-reinstall --upgrade "setuptools==78.1.1" "wheel" "msgpack>=1.2.1" "pip"

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY --chown=appuser:appuser . .

RUN chmod 755 /app

EXPOSE 5000

USER appuser

CMD ["python3", "app.py"]
