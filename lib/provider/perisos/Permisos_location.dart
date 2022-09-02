import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class PermisosLocation extends ChangeNotifier {
  bool isGranted = false;
  bool permisos = false;
  bool isEnable = false;
  StreamSubscription? gpsServiceSubcription;

  PermisosLocation() {
    init();
  }

  init() async {
    final a = await _isPermissionGranted();
    final b = await _checkGpsStatus();
    permisos = a && b;
    print(permisos);
    notifyListeners();
  }

  Future<bool> _isPermissionGranted() async {
    isGranted = await Permission.location.isGranted;
    print('este es el perimiso $isGranted');
    notifyListeners();
    return isGranted;
  }

  Future<void> askGpsAccess() async {
    final status = await Permission.location.request();
    switch (status) {
      case PermissionStatus.granted:
        isGranted = true;
        permisos=true;

        notifyListeners();
        break;

      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
        isGranted = true;
        notifyListeners();
        //abre la ventana de operaciones
        openAppSettings();
        break;
    }
  }

  Future<bool> _checkGpsStatus() async {
    final isEnable = await Geolocator.isLocationServiceEnabled();
    this.isEnable = isEnable;

    Geolocator.getServiceStatusStream().listen((event) {
      final isEnable = (event.index == 1) ? true : false;
      //actualiza el estado de laplicacion con este evento
      this.isEnable = isEnable;
      init();
      notifyListeners();
      print('este es el gps: $isEnable');
    });
    return isEnable;
  }

   Future<void> close() async {
    gpsServiceSubcription?.cancel();
    // return super.close();
  }
}
