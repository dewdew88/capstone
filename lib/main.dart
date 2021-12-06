import 'package:capstone/data/models/article.dart';
import 'package:capstone/data/models/vaccine.dart';
import 'package:capstone/data/preferences/preferences_helper.dart';
import 'package:capstone/provider/preferences_provider.dart';
import 'package:capstone/screens/article_detail_page.dart';
import 'package:capstone/screens/article_page.dart';
import 'package:capstone/screens/main_page.dart';
import 'package:capstone/screens/type_vaccine_details_page.dart';
import 'package:capstone/screens/vaccination_registration_page.dart';
import 'package:capstone/screens/vaccine_detail_page.dart';
import 'package:capstone/screens/vaccines_page.dart';
import 'package:capstone/widgets/article_web_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/models/type_vaccine.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
            debugShowCheckedModeBanner: false,
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
                  vaccine: ModalRoute.of(context)?.settings.arguments
                      as TypeVaccine),
              VaccinePage.routeName: (context) => const VaccinePage(),
              VaccineDetailPage.routeName: (context) => VaccineDetailPage(
                    vaccineLoc:
                        ModalRoute.of(context)?.settings.arguments as Vaccine,
                  ),
              Registration.routeName: (context) => const Registration(),
            },
          );
        },
      ),
    );
  }
}
