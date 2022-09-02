import 'package:flutter/material.dart';
import 'package:mapas_mau/provider/map/map_controller.dart';

import 'package:mapas_mau/views/map_view.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MapController>(context);

    return Scaffold(
      body: provider.position == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  children: const [
                    MapView(),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Calcula tu ruta'),
        icon: const Icon(Icons.route),
      ),
    );
  }
}
