import 'package:latlong2/latlong.dart';

class MapMarker {
  // final String? image;
  // final String? title;
  // final String? address;
  // final int? rating;
  final LatLng? location;

  MapMarker({
    // required this.image,
    // required this.title,
    // required this.address,
    // required this.rating,
    required this.location,
  });
}

final mapMarkers = [
  MapMarker(
    // image: 'assets/images/restaurant_1.jpg',
    // title: 'Alexander The Great Restaurant',
    // address: '8 Plender St, London NW1 0JT, United Kingdom',
    // rating: 4),
    location: LatLng(27.6808, 85.3357),
  ),
  MapMarker(
    // image: 'assets/images/restaurant_2.jpg',
    // title: 'Mestizo Mexican Restaurant',
    // address: '103 Hampstead Rd, London NW1 3EL, United Kingdom',
    // rating: 5),
    location: LatLng(27.6807, 85.3253),
  ),
  MapMarker(
    // image: 'assets/images/restaurant_3.jpg',
    // title: 'The Shed',
    // address: '122 Palace Gardens Terrace, London W8 4RT, United Kingdom',
    // rating: 2),
    location: LatLng(27.6764, 85.3259),
  ),
  MapMarker(
    // image: 'assets/images/restaurant_4.jpg',
    // title: 'Gaucho Tower Bridge',
    // address: '2 More London Riverside, London SE1 2AP, United Kingdom',// rating: 3),
    location: LatLng(27.6722, 85.3148),
  ),
  MapMarker(
    // image: 'assets/images/restaurant_5.jpg',
    // title: 'Bill\'s Holborn Restaurant',
    // address: '42 Kingsway, London WC2B 6EY, United Kingdom',
    // rating: 4,
    location: LatLng(27.6809, 85.3173),
  ),
];
