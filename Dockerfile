FROM python:3.12-slim
WORKDIR /app
RUN useradd --create-home --uid 1000 app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN mkdir -p /app/output && chown -R app:app /app
ENV OUTPUT_DIR=output
USER app
CMD ["python", "-m", "app.main"]
