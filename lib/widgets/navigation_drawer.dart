import 'dart:io';

import 'package:capstone/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: secondaryColor,
        child: ListView(
          children: [
            SizedBox(height: 50),
            ListTile(
              leading: Icon(Icons.medical_services, color: primaryColor),
              title: Text(
                'Ketentuan Vaksin',
                style: TextStyle(color: primaryColor),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings, color: primaryColor),
              title: Text(
                'Pengaturan',
                style: TextStyle(color: primaryColor),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info_rounded, color: primaryColor),
              title: Text(
                'Bantuan',
                style: TextStyle(color: primaryColor),
              ),
              onTap: () {},
            ),
            Divider(color: Colors.white70),
            ListTile(
              leading: Icon(Icons.logout, color: primaryColor),
              title: Text(
                'Keluar',
                style: TextStyle(color: primaryColor),
              ),
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
