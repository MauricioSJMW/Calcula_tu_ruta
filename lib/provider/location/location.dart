import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyLocation extends ChangeNotifier {
  LatLng? position;
  MyLocation() {
    getCurrentPosition();
  }

//obtiene las coordenadas de la ubicacion actual

  Future<LatLng> getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    print('llllllllllllllllllll');
    print('Mi posicion actual : ${position.toString()}');
    return LatLng(position.latitude, position.longitude);
  }
}
