import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:mapbox/constants.dart';
import 'package:mapbox/models/restaurants.dart';
// ignore: depend_on_referenced_packages
// import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  LocationData? _currentLocation;
  final Location _location = Location();

  @override
  void initState() {
    super.initState();
    _location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _currentLocation = currentLocation;
        // print(_currentLocation);
      });
    });
  }

  var points = <LatLng>[
    LatLng(27.6808, 85.3357),
    LatLng(27.6807, 85.3253),
    LatLng(27.6764, 85.3259),
    LatLng(27.6722, 85.3148),
    LatLng(27.6809, 85.3173),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
              options: MapOptions(
                // onTap: _retPositionMap,
                center:
                    // AppConstants.myLocation,
                    LatLng(_currentLocation!.latitude!,
                        _currentLocation!.longitude!),

                // (LatLng latlng){
                //   print("tapped at ${latLng.latitude},${latLng.longitude}")
                // },
                interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                // minZoom: 13,
                zoom: 6,
              ),
              nonRotatedChildren: [
                AttributionWidget.defaultWidget(
                  source: 'OpenStreetMap contributors',
                  onSourceTapped: null,
                ),
              ],
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/jayashrestha243/cld3xsx7j000301qp6v20xemn/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiamF5YXNocmVzdGhhMjQzIiwiYSI6ImNsZDN3bTN0aDBtcGwzcW9naHM2dnY5YWYifQ.ysE5uaid3P2RaL2wGSJM_w',
                  additionalOptions: const {
                    'accessToken': AppConstants.mapBoxAccessToken,
                    'id': AppConstants.mapBoxStyleId,
                  },
                ),
                MarkerLayerOptions(
                  markers: [
                    for (int i = 0; i < mapMarkers.length; i++)
                      Marker(
                        height: 40,
                        width: 40,
                        point: mapMarkers[i].location ??
                            LatLng(_currentLocation!.latitude!,
                                _currentLocation!.longitude!)
                        //  AppConstants.myLocation,
                        ,
                        //
                        builder: (ctx) {
                          return const Icon(
                            Icons.location_on,
                            color: Color.fromARGB(255, 229, 26, 23),
                          );
                        },
                      ),
                  ],
                ),
                // PolygonLayerOptions(
                //   polygons: [
                //     Polygon(
                //         points: points,
                //         borderStrokeWidth: 4.0,
                //         borderColor: Colors.blue,
                //         color: Colors.blue.withOpacity(0.5),
                //         isFilled: true),
                //   ],
                // ),
              ],
            ),
    );
  }

  // void _retPositionMap(TapPosition tapPosition, LatLng point) {
  //   print(tapPosition.runtimeType);
  //   print(point);
  // }
}
