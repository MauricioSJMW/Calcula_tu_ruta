import 'package:flutter/material.dart';
import 'package:mapas_mau/provider/perisos/Permisos_location.dart';
import 'package:provider/provider.dart';

class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PermisosLocation>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Calcula tu ruta'),
          backgroundColor: Colors.red,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Image(image: AssetImage('assets/logo2.jpeg')),
            Center(
                child: !provider.isEnable
                    ? const _EnableGpsMessage()
                    : const _AccesButton()),
          ],
        )
        // _AccesButton(),
        );
  }
}

class _AccesButton extends StatelessWidget {
  const _AccesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PermisosLocation>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Es nesesario el acceso al GPS',
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 20, color: Colors.red)),
        MaterialButton(
            onPressed: () {
              // //madar a llamar el provider del bloc
              // final gpsBloc = BlocProvider.of<GpsBloc>(context);
              // // final gpsBloc = context.read<GpsBloc>();
              provider.askGpsAccess();
              // gpsBloc.askGpsAccess();
            },
            color: Colors.black,
            shape: const StadiumBorder(),
            elevation: 0,
            splashColor: Colors.transparent,
            child: const Text('Solicitar Acceso',
                style: TextStyle(color: Colors.white)))
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Bienvenido a viajeros nacionales',
            style: TextStyle(
                fontSize: 23, fontWeight: FontWeight.w900, color: Colors.red),
          ),
          Text(
            "Para continuar debes activar el GPS",
            style: TextStyle(fontWeight: FontWeight.w900),
          )
        ],
      ),
    );
  }
}
