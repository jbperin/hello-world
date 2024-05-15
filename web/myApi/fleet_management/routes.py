from flask import Blueprint, jsonify, request
from fleet_management.models import vehicles

api = Blueprint('api', __name__)

@api.route('/vehicles', methods=['GET'])
def get_vehicles():
    return jsonify(vehicles)

@api.route('/vehicles/<int:vehicle_id>', methods=['GET'])
def get_vehicle(vehicle_id):
    vehicle = next((v for v in vehicles if v['id'] == vehicle_id), None)
    if vehicle is None:
        return jsonify({'error': 'Vehicle not found'}), 404
    return jsonify(vehicle)

@api.route('/vehicles', methods=['POST'])
def add_vehicle():
    new_vehicle = request.json
    new_vehicle['id'] = vehicles[-1]['id'] + 1 if vehicles else 1
    vehicles.append(new_vehicle)
    return jsonify(new_vehicle), 201

@api.route('/vehicles/<int:vehicle_id>', methods=['PUT'])
def update_vehicle(vehicle_id):
    vehicle = next((v for v in vehicles if v['id'] == vehicle_id), None)
    if vehicle is None:
        return jsonify({'error': 'Vehicle not found'}), 404

    data = request.json
    vehicle.update(data)
    return jsonify(vehicle)

@api.route('/vehicles/<int:vehicle_id>', methods=['DELETE'])
def delete_vehicle(vehicle_id):
    global vehicles
    vehicles = [v for v in vehicles if v['id'] != vehicle_id]
    return '', 204
