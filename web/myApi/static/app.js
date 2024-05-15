document.addEventListener('DOMContentLoaded', function() {
    const vehicleList = document.getElementById('vehicle-list');
    const addVehicleForm = document.getElementById('add-vehicle-form');
    let vehiclesTable;

    // Fetch and display vehicles
    function fetchVehicles() {
        fetch('/api/vehicles')
            .then(response => response.json())
            .then(data => {
                vehicleList.innerHTML = '';
                data.forEach(vehicle => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${vehicle.make}</td>
                        <td>${vehicle.model}</td>
                        <td>${vehicle.year}</td>
                        <td><button onclick="deleteVehicle(${vehicle.id})">Delete</button></td>
                    `;
                    vehicleList.appendChild(row);
                });

                if (vehiclesTable) {
                    vehiclesTable.destroy();
                }
                vehiclesTable = $('#vehicles-table').DataTable();
            });
    }

    // Add vehicle
    addVehicleForm.addEventListener('submit', function(event) {
        event.preventDefault();
        const formData = new FormData(addVehicleForm);
        const newVehicle = {
            make: formData.get('make'),
            model: formData.get('model'),
            year: formData.get('year'),
        };

        fetch('/api/vehicles', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(newVehicle)
        })
        .then(response => response.json())
        .then(() => {
            fetchVehicles();
            addVehicleForm.reset();
        });
    });

    // Delete vehicle
    window.deleteVehicle = function(vehicleId) {
        fetch(`/api/vehicles/${vehicleId}`, {
            method: 'DELETE'
        })
        .then(() => {
            fetchVehicles();
        });
    };

    // Initial fetch of vehicles
    fetchVehicles();
});
