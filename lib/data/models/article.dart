import 'dart:convert';

class Article {
  late String author;
  late String title;
  late String url;
  late String urlToImage;
  late String publishedAt;
  late String content;

  Article({
    required this.author,
    required this.title,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> article) {
    return Article(
        author: article['author'],
        title: article['title'],
        url: article['url'],
        urlToImage: article['urlToImage'],
        publishedAt: article['publishedAt'],
        content: article['content'],
    );
  }
}

List<Article> parseArticles(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => Article.fromJson(json)).toList();
}
