/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* Requete a sauvegarder : 
 * Pour latitude : 
 * for $var in doc('data/entries_hotels.xml') /entries/entry/latitude 
 * return data($var)
 * pour longitude :
 *for $var in doc('data/entries_hotels.xml') /entries/entry/longitude 
 * return data($var)
 */
var map;
var initialize;

initialize = function() {
    var latLng = new google.maps.LatLng(43.69, 7.27); // Correspond au coordonnées de Lille
    var myOptions = {
        zoom: 14,
        center: latLng,
        mapTypeId: google.maps.MapTypeId.HYBRID, // Type de carte, différentes valeurs possible HYBRID, ROADMAP, SATELLITE, TERRAIN
        maxZoom: 20
    };

    map = new google.maps.Map(document.getElementById('map'), myOptions);

    var marker = new google.maps.Marker({// Creer des marquer
        position: latLng,
        map: map,
        title: "Nice"
                //icon     : "marker_Nice.gif"
    });
    //Creation d'un marqueur
    var contentMarker = 'Coucou de Nice';
 
    var infoWindow = new google.maps.InfoWindow({
            content  : '<h1>' + contentMarker + '</h1>',
            position: latLng
    });
    // Listener du clique sur le Marker
    google.maps.event.addListener(marker, 'click', function() {
        infoWindow.open(map, marker);
    });
};
initialize();


                