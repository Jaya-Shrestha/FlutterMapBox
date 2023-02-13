import 'package:latlong2/latlong.dart';

class MapMarker {
  final String? image;
  final String? title;
  final String? address;
  final int? rating;
  final LatLng? location;

  MapMarker({
    required this.image,
    required this.title,
    required this.address,
    required this.rating,
    required this.location,
  });
}

final mapMarkers = [
  MapMarker(
    image: 'assets/images/restaurant_1.jpeg',
    title: 'Main Tandoor Restaurant',
    address: 'Jawalakhel,Lalitpur,Bagmati Province,Nepal',
    rating: 4,
    location: LatLng(27.6808, 85.3357),
  ),
  MapMarker(
    image: 'assets/images/restaurant_2.jpeg',
    title: 'DownTown Restaurant',
    address: 'Harihar Bhawan,Lalitpur,Bagmati Province,Nepal',
    rating: 5,
    location: LatLng(27.6807, 85.3253),
  ),
  MapMarker(
    image: 'assets/images/restaurant_3.jpg',
    title: 'Kumbeshwor Restaurant',
    address: 'Kumbeshwor,Bangalamukhi,Lalitpur,Bagmati Province,Nepal',
    rating: 2,
    location: LatLng(27.6764, 85.3259),
  ),
  MapMarker(
    image: 'assets/images/restaurant_4.jpg',
    title: 'Bimala',
    address: 'Sankhamul,Kathmandu,Bagmati Province,Nepal',
    rating: 3,
    location: LatLng(27.6722, 85.3148),
  ),
  MapMarker(
    image: 'assets/images/restaurant_5.jpg',
    title: 'Alisha Foods and Restaurant',
    address: 'Chakupat,Lalitpur,Bagmati Province,Nepal',
    rating: 4,
    location: LatLng(27.6809, 85.3173),
  ),
];
