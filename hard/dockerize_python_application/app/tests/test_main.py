from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_index():
    response = client.get("/")
    assert response.status_code == 200

def test_image():
    response = client.get("/image")
    assert response.status_code == 200
    assert response.headers["Content-Type"] == "image/png"