function init(latitude, longitude, hotelinfo, bool) {
    var centre = new google.maps.LatLng(43.69, 7.27); // Correspond au coordonnées central

// Options de la maps
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 12,
        zoomControl: true,
        zoomControlOptions: {
            style: google.maps.ZoomControlStyle.DEFAULT
        },
        center: centre,
        mapTypeControl: true,
        mapTypeControlOptions: {
            style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
        },
        navigationControl: true,
        navigationControlOptions: {
            style: google.maps.NavigationControlStyle.MEDIUM,
            position: google.maps.ControlPosition.TOP_RIGHT
        },
        scaleControl: true,
        streetViewControl: true,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });
    var infowindow = new google.maps.InfoWindow({
    });
    var marker, i;
    for (i = 0; i < latitude.length; i++) {
// Placer un point sur la carte

        marker = new google.maps.Marker({
            position: new google.maps.LatLng(latitude[i], longitude[i]),
            map: map,
            title: "Les hotels",
           icon: 'js/icon_hotel.png' // Chemin de l'image du marqueur
        });
        if (bool == 1) { // Créer une info-bulle
            google.maps.event.addListener(marker, 'click', (function(marker, i) {
                return function() {
                    infowindow.setContent(htmlDecode(hotelinfo[i]));
                    infowindow.open(map, marker);

                };
            })(marker, i));
        }
    }
}

function htmlDecode(input) {
    var e = document.createElement('p');
    e.innerHTML = input;
    return e.childNodes[0].nodeValue;
}
