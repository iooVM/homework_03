# test_main.py

from fastapi import FastAPI
from fastapi.testclient import TestClient
from main import app  # Импортируем ваше приложение

client = TestClient(app)

def test_ping():
    response = client.get("/ping/")
    assert response.status_code == 200
    assert response.json() == {"message": "pong"}
