import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapas_mau/provider/map/map_controller.dart';
import 'package:provider/provider.dart';

import '../provider/location/location.dart';

class MapView extends StatelessWidget {
  // final LatLng initialLocation;
  // final Set<Polyline> polylines;
  // final Set<Marker> markers;
  const MapView({
    Key? key,
    // required this.initialLocation,
    // required this.polylines,
    // required this.markers
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final mapBLoc = BlocProvider.of<MapBloc>(context);
    final provider = Provider.of<MapController>(context);
    final providerLocation = Provider.of<MyLocation>(context);
    // ignore: no_leading_underscores_for_local_identifiers
    Completer<GoogleMapController> _controller = Completer();
    // provider.initialCameraPosition = CameraPosition(
    //     target: LatLng(providerLocation.position!.latitude,
    //         providerLocation.position!.longitude),
    //     zoom: 15);

    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        height: size.height,
        child: Listener(
          child: GoogleMap(
            mapType: MapType.normal,
            compassEnabled: false,
            initialCameraPosition: provider.initialCameraPosition,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            markers: provider.markers,
            onTap: provider.onTap,
            onMapCreated: (GoogleMapController controller) {
              controller.setMapStyle(
                  '[{"elementType":"geometry","stylers":[{"color":"#1d2c4d"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#8ec3b9"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#1a3646"}]},{"featureType":"administrative.country","elementType":"geometry.stroke","stylers":[{"color":"#4b6878"}]},{"featureType":"administrative.land_parcel","elementType":"labels.text.fill","stylers":[{"color":"#64779e"}]},{"featureType":"administrative.province","elementType":"geometry.stroke","stylers":[{"color":"#4b6878"}]},{"featureType":"landscape.man_made","elementType":"geometry.stroke","stylers":[{"color":"#334e87"}]},{"featureType":"landscape.natural","elementType":"geometry","stylers":[{"color":"#023e58"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#283d6a"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#6f9ba5"}]},{"featureType":"poi","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},{"featureType":"poi.park","elementType":"geometry.fill","stylers":[{"color":"#023e58"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#3C7680"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#304a7d"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#98a5be"}]},{"featureType":"road","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#2c6675"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#255763"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#b0d5ce"}]},{"featureType":"road.highway","elementType":"labels.text.stroke","stylers":[{"color":"#023e58"}]},{"featureType":"transit","elementType":"labels.text.fill","stylers":[{"color":"#98a5be"}]},{"featureType":"transit","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},{"featureType":"transit.line","elementType":"geometry.fill","stylers":[{"color":"#283d6a"}]},{"featureType":"transit.station","elementType":"geometry","stylers":[{"color":"#3a4762"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#0e1626"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#4e6d70"}]}]');
              _controller.complete(controller);
            },
            onCameraMove: (position) {
              providerLocation.position = position.target;
              //   mapBLoc.mapCenter = position.target;
            },
          ),
        ));
  }
}
