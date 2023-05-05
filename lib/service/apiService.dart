import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapi/model/article.dart';

class ApiService{
  final endpoint = "https://newsapi.org/v2/everything?q=tesla&from=2023-04-05&sortBy=publishedAt&apiKey=6e811bb2d55143558d5a6e64b6ec97da";
  Future<List<Article>> getArticle() async{
    
  Response response = await get(Uri.parse(endpoint));
  if(response.statusCode == 200){
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> article = body.map((dynamic item) => Article.fromJson(item)).toList();
    return article;
   }
  else{
    throw "Data not Fetch";
  }
    
  }

}