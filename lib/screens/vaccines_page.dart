import 'dart:async';
import 'dart:io';

import 'package:capstone/common/styles.dart';
import 'package:capstone/data/models/vaccine.dart';
import 'package:capstone/provider/response_state.dart';
import 'package:capstone/screens/vaccine_detail_page.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class VaccinePage extends StatefulWidget {
  static const routeName = '/vaccines_page';

  const VaccinePage({Key? key}) : super(key: key);

  @override
  State<VaccinePage> createState() => _VaccinePageState();
}

class _VaccinePageState extends State<VaccinePage> {
  final _searchController = TextEditingController();
  List<Vaccine> _searchResult = [];

  Map source = {ConnectivityResult.values : false};
  final _controller = StreamController.broadcast();

  void initialise() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    checkConnectivity(result);
    Connectivity().onConnectivityChanged.listen((result) {
      checkConnectivity(result);
    });
  }

  void checkConnectivity(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});
  }

  @override
  void initState() {
    initialise();
    _controller.stream.listen((event) {
      setState(() {
        source = event;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;
    switch (source.keys.toList()[0]) {
      case ConnectivityResult.mobile:
        widget = _buildFutureBuilder(context);
        break;
      case ConnectivityResult.wifi:
        widget = _buildFutureBuilder(context);
        break;
      case ConnectivityResult.none:
        widget = const Center(child: Text('Silahkan periksa kembali koneksi internet Anda'));
        break;
      default:
        widget = const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: widget,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  FutureBuilder<String> _buildFutureBuilder(BuildContext context) {
    return FutureBuilder<String>(
      future:
          DefaultAssetBundle.of(context).loadString('assets/vaccine.json'),
      builder: (context, snapshot) {
        final List<Vaccine> listVaccineLocation =
            parsedVaccine(snapshot.data);
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return Column(
            children: [
              Card(
                child: ListTile(
                  leading: const Icon(Icons.search),
                  trailing: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                        _searchResult.clear();
                      });
                    },
                  ),
                  title: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                    onChanged: (_) {
                      List<Vaccine> result = [];
                      for (var listResult in listVaccineLocation) {
                        if (listResult.name
                                .toLowerCase()
                                .contains(_searchController.text) ||
                            listResult.city
                                .toLowerCase()
                                .contains(_searchController.text)) {
                          result.add(listResult);
                        }
                      }
                      setState(() {
                        _searchResult = result;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: _searchController.text.isNotEmpty
                    ? _buildSearchResult(_searchResult)
                    : _buildListView(listVaccineLocation),
              ),
            ],
          );
        } else {
          return const Text('Data not exist');
        }
      },
    );
  }

  ListView _buildListView(List<Vaccine> listVaccineLocation) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listVaccineLocation.length,
      itemBuilder: (context, index) {
        var vaccineLoc = listVaccineLocation[index];
        return Card(
          margin: const EdgeInsets.only(right: 16, left: 16, top: 4, bottom: 6),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            leading: Hero(
              tag: vaccineLoc.urlImage,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.network(
                  vaccineLoc.urlImage,
                  fit: BoxFit.cover,
                  width: 100,
                ),
              ),
            ),
            title: Text(
              vaccineLoc.name,
              maxLines: 1,
            ),
            subtitle: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Icon(
                        Icons.location_city_rounded,
                        color: secondaryColor,
                        size: 18,
                      ),
                    ),
                    Text(
                      vaccineLoc.city,
                      maxLines: 1,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Icon(
                        Icons.enhanced_encryption_rounded,
                        color: secondaryColor,
                        size: 18,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        vaccineLoc.type,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, VaccineDetailPage.routeName,
                  arguments: vaccineLoc);
            },
          ),
        );
      },
    );
  }

  ListView _buildSearchResult(List<Vaccine> searchResult) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: searchResult.length,
      itemBuilder: (context, index) {
        var vaccineLoc = searchResult[index];
        return Card(
          margin: const EdgeInsets.only(right: 16, left: 16, top: 4, bottom: 6),
          child: ListTile(
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            leading: Hero(
              tag: vaccineLoc.urlImage,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.network(
                  vaccineLoc.urlImage,
                  fit: BoxFit.cover,
                  width: 100,
                ),
              ),
            ),
            title: Text(
              vaccineLoc.name,
              maxLines: 1,
            ),
            subtitle: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Icon(
                        Icons.location_city_rounded,
                        color: secondaryColor,
                        size: 18,
                      ),
                    ),
                    Text(
                      vaccineLoc.city,
                      maxLines: 1,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Icon(
                        Icons.enhanced_encryption_rounded,
                        color: secondaryColor,
                        size: 18,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        vaccineLoc.type,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, VaccineDetailPage.routeName,
                  arguments: vaccineLoc);
            },
          ),
        );
      },
    );
  }
}
