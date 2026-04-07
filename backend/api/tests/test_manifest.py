from fastapi.testclient import TestClient

from backend.api.main import app


def test_manifest_endpoint() -> None:
    client = TestClient(app)
    response = client.get("/v1/models/manifest")

    assert response.status_code == 200
    payload = response.json()
    assert payload["encryption_required"] is True
    assert "lite" in payload["bundles"]
