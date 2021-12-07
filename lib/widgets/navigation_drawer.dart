import 'dart:io';

import 'package:capstone/common/styles.dart';
import 'package:capstone/provider/preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: ListView(
          children: [
            SizedBox(height: 50),
            ListTile(
              leading: Icon(Icons.medical_services),
              title: Text('Ketentuan Vaksin'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.brightness_6_rounded),
              title: Text('Mode Gelap'),
              trailing: Consumer<PreferencesProvider>(
                builder: (context, provider, child) {
                  return Switch.adaptive(
                    value: provider.isDarkTheme,
                    onChanged: (value) {
                      provider.enableDarkTheme(value);
                    },
                  );
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.info_rounded),
              title: Text(
                'Bantuan',
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Keluar'),
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
