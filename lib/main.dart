import 'package:capstone/data/models/article.dart';
import 'package:capstone/data/preferences/preferences_helper.dart';
import 'package:capstone/provider/preferences_provider.dart';
import 'package:capstone/screens/article_detail_page.dart';
import 'package:capstone/screens/article_page.dart';
import 'package:capstone/screens/main_page.dart';
import 'package:capstone/screens/type_vaccine_details_page.dart';
import 'package:capstone/widgets/article_web_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/models/type_vaccine.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
      ],
      child: Consumer<PreferencesProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            initialRoute: MainPage.routeName,
            theme: provider.themeData,
            routes: {
              MainPage.routeName: (context) => MainPage(),
              ArticlePage.routeName: (context) => ArticlePage(),
              ArticleDetailPage.routeName: (context) => ArticleDetailPage(
                    article:
                        ModalRoute.of(context)?.settings.arguments as Article,
                  ),
              ArticleWebView.routeName: (context) => ArticleWebView(
                    url: ModalRoute.of(context)?.settings.arguments as String,
                  ),
              TypeVaccineDetails.routeName: (context) => TypeVaccineDetails(
                    vaccine: ModalRoute.of(context)?.settings.arguments as TypeVaccine),
            },
          );
        },
      ),
    );
  }
}
