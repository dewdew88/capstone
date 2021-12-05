import 'package:capstone/data/models/article.dart';
import 'package:capstone/screens/article_detail_page.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  static const routeName = '/article_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article'),
        centerTitle: true,
        automaticallyImplyLeading: false
      ),
      body: FutureBuilder<String>(
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
      ),
    );
  }

  Widget _buildArticleItem(BuildContext context, Article article) {
    return Card(
      margin: EdgeInsets.only(right: 16, left: 16, top: 4, bottom: 6),
      child: ListTile(
        tileColor: Color(0xFFEBEDF5),
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
