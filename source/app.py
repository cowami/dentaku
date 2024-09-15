from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route('/')
def hello():
    env = os.environ.get('FLASK_ENV', 'development')
    return jsonify({"message" : f"Hello, CI/CD! Environmnent: {env}", "status" : "success"})

@app.route('/health')
def health():
    return jsonify({"status" : "healthy"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)