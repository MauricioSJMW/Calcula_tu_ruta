import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyLocation extends ChangeNotifier {
  LatLng? position;
  MyLocation() {
    getCurrentPosition();
  }

//obtiene las coordenadas de la ubicacion actual
  Future getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    this.position = LatLng(position.latitude, position.longitude);
    notifyListeners();
    print('esta es la localizacion ${position.toString()}');

    //debe de retornar un valor de tipo LatLong
  }
}
