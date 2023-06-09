class Article{
  final String? author;
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? publishedAt;

  Article({
    this.author,
    this.title,
    this.description,
    this.urlToImage,
    this.publishedAt,
});

  factory Article.fromJson(Map<String, dynamic> json){
    return Article(
    author: json['author'] == null? null : json['author'],
    title: json['title'] == null? null : json['title'],
    description: json['description'] == null? null : json['description'],
    urlToImage: json['urlToImage'] == null? null : json['urlToImage'],
    publishedAt: json['publishedAt'] == null? null : json['publishedAt']

   );
  }
}