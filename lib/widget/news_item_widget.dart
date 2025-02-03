import 'package:flutter/material.dart';
import 'package:newsapp/model/news_response.dart';

class NewsItemWidget extends StatelessWidget {
  NewsItemWidget({
    super.key,
    required this.article,
   
  });

  Articles article;
  

  @override
  Widget build(BuildContext context) {
    return Container(
     // width: 400,
     // height: 200,
     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
       children: 
       [
         ClipRRect(
           borderRadius: BorderRadius.circular(10),
           child: Image.network(article.urlToImage 
                               ?? "https://cdn.vox-cdn.com/thumbor/wPO2usOSxctI84haZv11M8ErP_0=/0x0:2040x1360/1200x628/filters:focal(1020x680:1021x681)/cdn.vox-cdn.com/uploads/chorus_asset/file/23587767/acastro_220524_STK428_0003.jpg", 
                               ),
         ),
       SizedBox(height: 10,),
        Text(article.source?.name ?? "", 
        style: TextStyle(color: Colors.white, fontSize: 16,),),
       SizedBox(height: 5,),
        Text(article.title ?? "", 
        style: TextStyle(color: Colors.white, fontSize: 20),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,),
    
    ]
       ),
    );
  }
}