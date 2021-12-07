import 'package:capstone/common/styles.dart';
import 'package:capstone/data/models/article.dart';
import 'package:capstone/widgets/article_web_view.dart';
import 'package:flutter/material.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final Article article;

  const ArticleDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: article.urlToImage,
                    child: Image.network(article.urlToImage),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: CircleAvatar(
                      child: IconButton(
                        icon:
                            Icon(Icons.arrow_back_rounded, color: primaryColor),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      backgroundColor: secondaryColor,
                    ),
                  )
                ],
              ),
              _buildDetails(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: Icon(
                Icons.person_rounded,
                color: secondaryColor,
                size: 20,
              ),
            ),
            Text(
              article.author,
              style: Theme.of(context).textTheme.caption,
            ),
          ]),
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: Icon(
                Icons.date_range,
                color: secondaryColor,
                size: 20,
              ),
            ),
            Text(
              article.publishedAt,
              style: Theme.of(context).textTheme.caption,
            ),
          ]),
          Divider(color: Colors.grey),
          Text(
            article.content,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ArticleWebView.routeName,
                    arguments: article.url);
              },
              child: Text('Lihat Selengkapnya'),
            ),
          ),
        ],
      ),
    );
  }
}
