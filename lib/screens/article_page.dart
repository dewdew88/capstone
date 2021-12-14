import 'dart:async';
import 'dart:io';

import 'package:capstone/data/models/article.dart';
import 'package:capstone/screens/article_detail_page.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  static const routeName = '/article_page';

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
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

  FutureBuilder<String> _buildFutureBuilder(BuildContext context) {
    return FutureBuilder<String>(
      future:
          DefaultAssetBundle.of(context).loadString('assets/articles.json'),
      builder: (context, snapshot) {
        final List<Article> article = parseArticles(snapshot.data);
        return ListView.builder(
          itemCount: article.length,
          itemBuilder: (context, index) {
            return _buildArticleItem(context, article[index]);
          },
        );
      },
    );
  }

  Widget _buildArticleItem(BuildContext context, Article article) {
    return Card(
      margin: EdgeInsets.only(right: 16, left: 16, top: 4, bottom: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Hero(
            tag: article.urlToImage,
            child: Image.network(
              article.urlToImage,
              height: double.infinity,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          article.title,
          maxLines: 2,
        ),
        subtitle: Text(
          article.author,
          maxLines: 1,
        ),
        onTap: () {
          Navigator.pushNamed(context, ArticleDetailPage.routeName,
              arguments: article);
        },
      ),
    );
  }
}
