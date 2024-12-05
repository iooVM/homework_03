# fastapi_ping_app/main.py

from fastapi import FastAPI

app = FastAPI()

@app.get("/ping/")
async def ping():
    return {"message": "pong"}
