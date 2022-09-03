import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mapas_mau/models/searh_resul.dart';
import 'package:mapas_mau/provider/search/search.dart';
import 'package:provider/provider.dart';

import '../delegates/search_destination _delegate.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
        duration: const Duration(milliseconds: 300),
        child: const _SearchBarBody());
    // return BlocBuilder<SearchBloc, SearchState>(
    //   builder: (BuildContext context, state) {
    //     return state.displayManualMarker
    //         ? const SizedBox()
    //         : FadeInDown(
    //             duration: const Duration(milliseconds: 300),
    //             child: const _SearchBarBody());
    //   },
    // );
  }
}

class _SearchBarBody extends StatelessWidget {
  const _SearchBarBody({Key? key}) : super(key: key);

  void onSearchResult(BuildContext context, SearchResut result) async {
    // final searchBloc = BlocProvider.of<SearchBloc>(context);
    // final locationhBloc = BlocProvider.of<LocationBloc>(context);
    // final mapBloc = BlocProvider.of<MapBloc>(context);

    if (result.manual == true) {
      // searchBloc.add(OnActivateManualMarkerEvent());
      return;
    }
    if (result.position != null) {
      // final start = locationhBloc.state.lasKnownLocation;

      // if (start == null) return;
      // final end = result.position;
      // if (end == null) return;

      //Confirmar ubicacion
      // ShowLoadingMessage(context);
      // final destination = await searchBloc.getCoorsStartToend(start, end);
      // mapBloc.drawRotatePolyline(destination);
      // Navigator.pop(context);
    }

    //revisar si tienemos el objeto resul,position;
  }

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: GestureDetector(
            onTap: () async {
              final result = await showSearch(
                  context: context, delegate: SearchDestinationDelegate());
              if (result == null) return;
              onSearchResult(context, result);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 5)),
                  ]),
              child: const Text(
                'Donde quieres ir ? ',
                style: TextStyle(color: Colors.black87),
              ),
            )),
      ),
    );
  }
}
