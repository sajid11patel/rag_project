FROM python:3.12-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt

COPY backend ./backend
COPY routing ./routing
COPY retrieval ./retrieval
COPY ingestion ./ingestion
COPY generation ./generation
COPY vectorstore ./vectorstore
COPY frontend ./frontend
COPY README.md ./README.md

EXPOSE 8000 8501

CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8000"]