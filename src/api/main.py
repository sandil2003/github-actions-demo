from flask import Flask, abort, request
from weather import get_weather

app = Flask(__name__)

@app.route("/", methods=["GET"])
def handle_request():
    city = request.args.get("city")
    if not city:
        return abort(404, "Please provide a city.")

    success, response = get_weather(city)
    if success:
        return response
    else:
        return abort(500, response)

# This runs the server when launched via `python main.py`
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
