import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:mapas_mau/models/places_models.dart';
import 'package:mapas_mau/service/traffic_service2.dart';
import 'package:http/http.dart' as http;

class Search extends ChangeNotifier {
  List<PlacesResponce> listaDireccion2 = [];

  TrafficService2 trafficService = TrafficService2();

  final String _basePlaces = 'https://api.locationiq.com/v1/autocomplete.php';
  //cambiar a tu propia key
  static const accesToken = 'pk.2769150a5b92d668096b7ea65e1dccbd';

  Future getReseultByQuery(String query) async {
    List<PlacesResponce> listaDireccion = [];

    if (query.isEmpty) return [];
    final url = '$_basePlaces?q=$query&key=$accesToken';
    var response = await http.get(
      Uri.parse(url),
    );

    var resp = await json.decode(response.body);

    for (var i = 0; i < resp.length; i++) {
      var as = PlacesResponce.fromMap(resp[i]);
      listaDireccion.add(as);
    }

    // for (var i = 0; i < resp.length; i++) {
    //   var as = PlacesResponce.fromMap(resp.length[i]);
    //   listaDireccion.add(as);
    // }

    return listaDireccion;
  }

  getDatos(String query) async {
    listaDireccion2 = [];
  if (query.isEmpty) return [];
    var res = await getReseultByQuery(query);
    listaDireccion2 = res;

    notifyListeners();
  }
}
