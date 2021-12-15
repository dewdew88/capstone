import 'dart:io';

import 'package:capstone/common/styles.dart';
import 'package:capstone/provider/preferences_provider.dart';
import 'package:capstone/screens/help_page.dart';
import 'package:capstone/screens/vaccination_requirements_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: ListView(
          children: [
            const SizedBox(height: 50),
            ListTile(
              leading: const Icon(Icons.medical_services, color: Color.fromRGBO(217, 136, 13, 1),),
              title: const Text('Ketentuan Vaksin'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Requirements(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.brightness_6_rounded, color: Color.fromRGBO(217, 136, 13, 1),),
              title: const Text('Mode Gelap'),
              trailing: Consumer<PreferencesProvider>(
                builder: (context, provider, child) {
                  return Switch.adaptive(
                    value: provider.isDarkTheme,
                    onChanged: (value) {
                      provider.enableDarkTheme(value);
                    },
                    activeColor: const Color.fromRGBO(217, 136, 13, 1),
                  );
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info_rounded, color: Color.fromRGBO(217, 136, 13, 1),),
              title: const Text(
                'Bantuan',
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HelpPage(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent,),
              title: const Text('Keluar'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => exit(0),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
