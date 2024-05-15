from flask import Flask
from flask import Flask, send_from_directory
from fleet_management.routes import api

def create_app():
    app = Flask(__name__, static_folder='static')


    @app.route('/')
    def index():
        return send_from_directory(app.static_folder, 'index.html')

    @app.route('/<path:path>')
    def static_files(path):
        return send_from_directory(app.static_folder, path)

    app.register_blueprint(api, url_prefix='/api')

    return app

if __name__ == '__main__':
    app = create_app()
    app.run(debug=True)
