import 'package:flutter/material.dart';
import 'package:mapas_mau/provider/map/map_controller.dart';
import 'package:mapas_mau/provider/search/search.dart';

import 'package:mapas_mau/views/map_view.dart';
import 'package:mapas_mau/widget/searchbar.dart';
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MapController>(context);


   

    return Scaffold(
      //Espera a que se termine de calcular tu posicion exacta, no aun lo carga muestra el circular progress
      body: provider.position == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
            child: Stack(
              children: const [
                MapView(),
                const SearchBar(),
              ],
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
