# 1. Base image kiválasztása
FROM python:3.11-slim

# Környezeti változók a hatékony Python futáshoz konténerben
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    APP_ENV=production

WORKDIR /app

# Függőségek telepítése
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Biztonsági best practice: nem-root felhasználó létrehozása
RUN adduser --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# Alkalmazáskód másolása a létrehozott felhasználó jogosultságaival
COPY --chown=appuser:appuser app/ ./app

EXPOSE 8000

# Docker beépített egészségellenőrzése
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8000/health')" || exit 1

# Alkalmazás indítása
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]