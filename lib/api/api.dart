import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/model/news_response.dart';
import 'package:newsapp/model/source_response.dart';
class AppApi{
 static String baseUrl = "newsapi.org";
 static String sourcesEndPoint = "//v2/top-headlines/sources";
 static String newsEndPoint = "/v2/everything";
 static String apiKey = "0e7ffde9a5934f9ca6b15f594064eff1";
 static Future<SourceResponse> getSources() async{
    //https://newsapi.org//v2/top-headlines/sources?apikey=0e7ffde9a5934f9ca6b15f594064eff1
    Uri url = Uri.https(baseUrl ,sourcesEndPoint, {
      "apikey": apiKey,
    });
   var response = await http.get(url);
   var bodyResponse = response.body;
   var json = jsonDecode(bodyResponse);
  //  print(json["sources"][0]["id"]);
   return SourceResponse.fromJson(json);
  }

  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=0e7ffde9a5934f9ca6b15f594064eff1
  static Future<NewsResponse> getNews()async{
    Uri url = Uri.https(
      baseUrl,
      newsEndPoint,
      {
        "q" : "bitcoin",
        "apiKey" : apiKey
      }
    );
    var response = await http.get(url);
    var bodyResponse = response.body;
    var json = jsonDecode(bodyResponse);
    // print(json["status"]);
    return NewsResponse.fromJson(json);

  }

}