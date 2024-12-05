# Dockerfile для FastAPI приложения
#
# Чтобы собрать и запустить контейнер, выполните следующие команды:
# 1. Соберите образ:
#    docker build -t fastapi_ping_app .
# 2. Запустите контейнер:
#    docker run -d --name fastapi_app -p 8000:8000 fastapi_ping_app

# Используем официальный образ Python
FROM python:3.9-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файл зависимостей в контейнер
COPY pyproject.toml poetry.lock* ./

# Устанавливаем Poetry
RUN pip install poetry

# Устанавливаем зависимости
RUN poetry install --no-root --no-dev

# Копируем все модули приложения в контейнер
COPY . .

# Указываем, что контейнер слушает на порту 8000
EXPOSE 8000

# Указываем команду для запуска приложения
CMD ["poetry", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
