import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:mapas_mau/models/places_models.dart';

import 'package:http/http.dart' as http;

class TrafficService2 {
  final String _basePlaces = 'https://api.locationiq.com/v1/autocomplete.php';
  static const accesToken = 'pk.2769150a5b92d668096b7ea65e1dccbd';

  Future getReseultByQuery(String query) async {
    List<PlacesResponce> listaDireccion = [];

    if (query.isEmpty) return [];
    final url = '$_basePlaces?q=$query&key=$accesToken';
    var response = await http.get(Uri.parse(url), );

   var resp = json.decode(response.body);

      for (var element in resp) {
        var as = PlacesResponce.fromMap(element);
        listaDireccion.add(as);
      }
    return listaDireccion;
  }
}
