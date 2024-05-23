$(document).ready(function() {
    // Initialiser DataTable
    var table = $('#componentsTable').DataTable();

    // Fonction pour afficher les données dans la table
    function displayData(data) {
        table.clear();
        data.forEach(function(component) {
            table.row.add([
                component.id,
                component.date_fabrication,
                component.date_installation,
                component.nombre_utilisation,
                component.pays_installation
            ]).draw();
        });
    }

    // Afficher les données initiales
    displayData(components);

    // Fonction pour filtrer les composants par date d'installation
    window.filterInstallation = function() {
        var filtered = components.filter(function(component) {
            var fabricationDate = new Date(component.date_fabrication);
            var installationDate = new Date(component.date_installation);
            var diffDays = (installationDate - fabricationDate) / (1000 * 60 * 60 * 24);
            return diffDays > 58;
        });
        displayData(filtered);
    }

    // Fonction pour filtrer les composants par nombre d'utilisation
    window.filterUsage = function() {
        var filtered = components.filter(function(component) {
            return component.nombre_utilisation > 12;
        });
        displayData(filtered);
    }
});
