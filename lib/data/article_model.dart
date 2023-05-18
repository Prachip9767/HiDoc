import 'dart:convert';

ArticleModel? articleModelFromJson(String str) {
  try {
    return ArticleModel.fromJson(json.decode(str));
  } catch (e) {
    print('Error parsing JSON: $e');
    return null;
  }
}

class ArticleModel {
  List<News> news;
  List<Article> trandingBulletin;
  String specialityName;
  List<dynamic> latestArticle;
  List<Article> exploreArticle;
  List<Article> trandingArticle;
  Article article;
  List<Article> bulletin;
  int sId;

  ArticleModel({
    required this.news,
    required this.trandingBulletin,
    required this.specialityName,
    required this.latestArticle,
    required this.exploreArticle,
    required this.trandingArticle,
    required this.article,
    required this.bulletin,
    required this.sId,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    news: json["news"] != null
        ? List<News>.from(json["news"].map((x) => News.fromJson(x)))
        : [],
    trandingBulletin: List<Article>.from(json["trandingBulletin"].map((x) => Article.fromJson(x))),
    specialityName: json["specialityName"],
    latestArticle: List<dynamic>.from(json["latestArticle"].map((x) => x)),
    exploreArticle: List<Article>.from(json["exploreArticle"].map((x) => Article.fromJson(x))),
    trandingArticle: List<Article>.from(json["trandingArticle"].map((x) => Article.fromJson(x))),
    article: Article.fromJson(json["article"]),
    bulletin: List<Article>.from(json["bulletin"].map((x) => Article.fromJson(x))),
    sId: json["sId"],
  );


}

class Article {
  int id;
  String articleTitle;
  String redirectLink;
  String articleImg;
  String articleDescription;
  String? specialityId;
  int rewardPoints;
  String? keywordsList;
  String? articleUniqueId;
  int articleType;
  DateTime? createdAt;

  Article({
    required this.id,
    required this.articleTitle,
    required this.redirectLink,
    required this.articleImg,
    required this.articleDescription,
    this.specialityId,
    required this.rewardPoints,
    this.keywordsList,
    this.articleUniqueId,
    required this.articleType,
    this.createdAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    id: json["id"],
    articleTitle: json["articleTitle"],
    redirectLink: json["redirectLink"],
    articleImg: json["articleImg"],
    articleDescription: json["articleDescription"],
    specialityId: json["specialityId"],
    rewardPoints: json["rewardPoints"],
    keywordsList: json["keywordsList"],
    articleUniqueId: json["articleUniqueId"],
    articleType: json["articleType"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

}

class News {
  int id;
  String title;
  String url;
  String urlToImage;
  String description;
  String speciality;
  String newsUniqueId;
  int trendingLatest;
  DateTime publishedAt;

  News({
    required this.id,
    required this.title,
    required this.url,
    required this.urlToImage,
    required this.description,
    required this.speciality,
    required this.newsUniqueId,
    required this.trendingLatest,
    required this.publishedAt,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
    id: json["id"],
    title: json["title"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    description: json["description"],
    speciality: json["speciality"],
    newsUniqueId: json["newsUniqueId"],
    trendingLatest: json["trendingLatest"],
    publishedAt: DateTime.parse(json["publishedAt"]),
  );



}
