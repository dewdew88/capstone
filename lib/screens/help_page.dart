import 'package:capstone/common/styles.dart';
import 'package:capstone/data/models/help.dart';
import 'package:capstone/provider/preferences_provider.dart';
import 'package:capstone/widgets/sliver_app_bar_delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SliverPersistentHeader _header(String text) {
      return SliverPersistentHeader(
        floating: false,
        delegate: SliverAppBarDelegate(
          minHeight: 30,
          maxHeight: 150,
          child: Consumer<PreferencesProvider>(
            builder: (context, provider, child) {
              return Container(
                color: provider.isDarkTheme ? darkPrimaryColor : secondaryColor,
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: primaryColor),
                  ),
                ),
              );
            },
          ),
        ),
        pinned: true,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bantuan'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          _header('FAQ SEPUTAR VAKSINASI SECARA UMUM'),
          SliverList(
            delegate: SliverChildListDelegate(
              aboutVaccine.map(_buildTile).toList(),
            ),
          ),
          _header('FAQ TENTANG SASARAN DAN PELAKSANAAN VAKSINASI COVID-19'),
          SliverList(
            delegate: SliverChildListDelegate(
              targetVaccine.map(_buildTile).toList(),
            ),
          ),
          _header('FAQ SEPUTAR KEAMANAN, MANFAAT DAN EFIKASI VAKSIN'),
          SliverList(
            delegate: SliverChildListDelegate(
              benefitVaccine.map(_buildTile).toList(),
            ),
          ),
          _header('FAQ TENTANG KEJADIAN IKUTAN PASCA IMUNISASI (KIPI)'),
          SliverList(
            delegate: SliverChildListDelegate(
              aboutKipi.map(_buildTile).toList(),
            ),
          ),
          _header('FAQ TENTANG VAKSIN DAN LOGISTIK'),
          SliverList(
            delegate: SliverChildListDelegate(
              aboutLogistic.map(_buildTile).toList(),
            ),
          ),
          _header('FAQ TENTANG KEHALALAN VAKSIN'),
          SliverList(
            delegate: SliverChildListDelegate(
              halalVaccine.map(_buildTile).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(Help help) {
    return ListTile(
      title: Text(
        help.title,
        textAlign: TextAlign.justify,
      ),
      subtitle: Text(
        help.description,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
