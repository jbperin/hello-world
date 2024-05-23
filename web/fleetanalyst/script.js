$(document).ready(function() {
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
            ]);
        });
        table.draw(); // Redessiner la table après ajout des données
    }

    // Afficher les données initiales
    displayData(components);

    // Fonction pour filtrer les composants par date d'installation
    window.filterInstallation = function() {
        var filtered = components.filter(function(component) {
            var fabricationDate = new Date(component.date_fabrication);
            var installationDate = new Date(component.date_installation);
            var diffTime = installationDate - fabricationDate;
            var diffDays = diffTime / (1000 * 60 * 60 * 24);
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

    // Fonction pour afficher/masquer les colonnes
    $('.column-toggle').on('change', function(e) {
        var column = table.column($(this).attr('data-column'));
        column.visible($(this).is(':checked'));
    });

    // Initialiser la visibilité des colonnes
    $('.column-toggle').each(function() {
        var column = table.column($(this).attr('data-column'));
        column.visible($(this).is(':checked'));
    });

    // Fonction pour exporter les données visibles en CSV
    function exportTableToCSV(filename) {
        var csv = [];
        var headers = [];
        var visibleColumns = [];

        // Get the headers
        $('#componentsTable thead th').each(function(index) {
            if (table.column(index).visible()) {
                headers.push($(this).text());
                visibleColumns.push(index);
            }
        });
        csv.push(headers.join(','));

        // Get the data from visible rows
        table.rows({ search: 'applied' }).every(function(rowIdx, tableLoop, rowLoop) {
            var row = this.data();
            var rowData = [];
            visibleColumns.forEach(function(index) {
                rowData.push(row[index]);
            });
            csv.push(rowData.join(','));
        });

        // Download CSV file
        var csvFile = new Blob([csv.join('\n')], { type: 'text/csv' });
        var downloadLink = document.createElement('a');
        downloadLink.download = filename;
        downloadLink.href = window.URL.createObjectURL(csvFile);
        downloadLink.style.display = 'none';
        document.body.appendChild(downloadLink);
        downloadLink.click();
        document.body.removeChild(downloadLink);
    }

    // Event listener for export button
    $('#exportButton').on('click', function() {
        exportTableToCSV('composants.csv');
    });
});
