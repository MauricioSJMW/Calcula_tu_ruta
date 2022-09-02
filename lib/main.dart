import 'package:flutter/material.dart';
import 'package:mapas_mau/provider/location/location.dart';
import 'package:mapas_mau/provider/map/map_controller.dart';
import 'package:mapas_mau/screen/acces_screen.dart';
import 'package:mapas_mau/screen/map_screeen.dart';
import 'package:provider/provider.dart';

import 'provider/perisos/Permisos_location.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MapController()),
        ChangeNotifierProvider(create: (_) => MyLocation()),
        ChangeNotifierProvider(create: (_) => PermisosLocation()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Calcula tu ruta',
          home: Builder(builder: (context) {
            final provider = Provider.of<PermisosLocation>(context);

            return provider.permisos
                ? const MapScreen()
                : const GpsAccessScreen();
          })),
    );
  }
}
