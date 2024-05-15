document.addEventListener('DOMContentLoaded', function() {
    const vehicleList = document.getElementById('vehicle-list');
    const addVehicleForm = document.getElementById('add-vehicle-form');

    // Fetch and display vehicles
    function fetchVehicles() {
        fetch('/api/vehicles')
            .then(response => response.json())
            .then(data => {
                vehicleList.innerHTML = '';
                data.forEach(vehicle => {
                    const vehicleDiv = document.createElement('div');
                    vehicleDiv.innerHTML = `
                        <strong>${vehicle.make} ${vehicle.model}</strong> (${vehicle.year})
                        <button onclick="deleteVehicle(${vehicle.id})">Delete</button>
                    `;
                    vehicleList.appendChild(vehicleDiv);
                });
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
