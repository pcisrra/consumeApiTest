import 'package:consume_api_test/model/articles.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

String serviceUrl = 'https://json-service-823df.web.app/api/articles/';

@override
void initState(){
  getData(http.Client());
}

Future<List<Article>> getData(http.Client client) async{
  final response = await client.get(serviceUrl);
  return parseArticles(response.body);
}

List<Article> parseArticles(String bodyResponse){
  final parsed = json.decode(bodyResponse)['articles'];
  List<Article> articles = [];
  for(var obj in parsed){
      Article art = Article.fromJson(obj);
      articles.add(art);
  }
  return articles;
}