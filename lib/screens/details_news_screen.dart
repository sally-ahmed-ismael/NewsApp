import 'package:flutter/material.dart';
import 'package:newsapp/model/news_response.dart';
import 'package:newsapp/screens/web_view_screen.dart';

class DetailsNewsScreen extends StatelessWidget {
  DetailsNewsScreen({super.key, required this.article});
  Articles article;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        backgroundColor: Color(0xff1877f2),
        centerTitle: true,
        title: Text(article.title ?? "" , style: TextStyle(fontSize: 16, color: Colors.white),),
        ) ,

       body: Padding(
         padding: const EdgeInsets.all(10),
         child: Column(
          children: [
            SizedBox(height: 40,),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(article.urlToImage ?? "https://a.fsdn.com/sd/topics/ai_64.png")),
            SizedBox(height: 15,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(article.title ?? "" , style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.white),),
            ),
            SizedBox(height: 15,),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 10),
               child: Text(article.description ?? "" , style: TextStyle(fontSize: 16, color: Colors.white),),
             ),
          ],
         ),
       ),
    floatingActionButton: MaterialButton(
       onPressed: (){ 
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=> WebViewScreen(url: article.url ?? "" )));
        },
       color: Color(0xff1877f2), 
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
       child: Text("View full article", style: TextStyle(fontSize: 16 , color: Colors.white),)),
    );
  }
}