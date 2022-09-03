import 'dart:ffi';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:mapas_mau/models/places_models.dart';

class RouteDestination {
  final List<LatLng> points;
  final double duration;
  final double distance;
  final PlacesResponce endPlace;

  RouteDestination({
    required this.points,
    required this.duration,
    required this.distance,
    required this.endPlace,
  });
}
