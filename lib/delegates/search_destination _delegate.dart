import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapas_mau/models/places_models.dart';
import 'package:mapas_mau/models/searh_resul.dart';
import 'package:mapas_mau/provider/search/search.dart';
import 'package:provider/provider.dart';

class SearchDestinationDelegate extends SearchDelegate<SearchResut> {
  SearchDestinationDelegate() : super(searchFieldLabel: 'Buscar...');
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            //el cuery ya biene el searh delegate
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          //close biene en SearchDelegate
          final result = SearchResut(cancel: true);
          close(context, result);
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    final providerSearch = Provider.of<Search>(context, listen: false);
    providerSearch.getDatos(query);

    return Builder(
      builder: (context) {
        final providerSearch = Provider.of<Search>(context);
        return providerSearch.listaDireccion2.isEmpty
            ? Container()
            : ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final PlacesResponce place =
                      providerSearch.listaDireccion2[index];
                  return ListTile(
                    title: Text(place.displayPlace!),
                    subtitle: Text(
                      place.displayName,
                      style: const TextStyle(fontSize: 12),
                    ),
                    leading: const Icon(
                      Icons.place_outlined,
                      color: Colors.black,
                    ),
                    onTap: () {
                      final result = SearchResut(
                          cancel: false,
                          manual: false,
                          position: LatLng(
                              double.parse(place.lat), double.parse(place.lon)),
                          description: place.displayName,
                          name: place.displayName);
                      print('direccion ${result.position}');
                        close(context, result);
                    },
                  );
                },
                itemCount: providerSearch.listaDireccion2.length,
              );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //refrencia al state searBloc
    // final historia = BlocProvider.of<SearchBloc>(context).state.history;

    return ListView(
      children: const [
        ListTile(
            // leading: const Icon(
            //   Icons.location_on_outlined,
            //   color: Colors.black,
            // ),
            // title: const Text('Colocar la ubicacion manual mente',
            //     style: TextStyle(color: Colors.black)),
            // onTap: () {
            //   final result = SearchResut(cancel: false, manual: true);

            //   close(context, result);
            // },
            ),
      ],
    );
  }
}
