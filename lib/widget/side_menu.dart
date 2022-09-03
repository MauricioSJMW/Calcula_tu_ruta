import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
            leading: const Icon(
              Icons.brightness_5,
              color: Colors.amber,
            ),
            title: const Text('Estilo día'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.nightlight,
              color: Colors.indigo,
            ),
            title: const Text('Estilo noche'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.gradient,
              color: Colors.blueGrey,
            ),
            title: const Text('Estilo gris'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/logo.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
