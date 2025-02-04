import 'package:flutter/material.dart';
import 'package:newsapp/api/api.dart';
import 'package:newsapp/model/source_response.dart';
import 'package:newsapp/screens/details_news_screen.dart';
import 'package:newsapp/widget/news_item_widget.dart';
import 'package:newsapp/widget/tab_item.dart';



class TabContainer extends StatefulWidget {
  TabContainer({super.key , required this.listSources});
  List <Sources> listSources;

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
    
      length: widget.listSources.length, 
      child: Column(
        children: [TabBar(
          onTap: (index){
            selectedIndex = index;
            setState((){});
          },
          isScrollable: true,
          tabs: widget.listSources.map(
          (source)=> TabItem(source: source, 
            isSelected: selectedIndex == widget.listSources.indexOf(source))
        ).toList()),
        ///
        FutureBuilder(
         future: AppApi.getNews(),
         builder: (context, snapshot){
            if(snapshot.hasError){
              return Center(child: Text("Error", style: TextStyle(color: Colors.white),));
            }
             if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(color: Colors.white),);
            }
            var listNews = snapshot.data?.articles ?? [];
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context , index) =>
                 InkWell(
                  onTap:(){ Navigator.of(context).push
                  (MaterialPageRoute(builder: (context)=>DetailsNewsScreen(article: listNews[index])));},
                  child: NewsItemWidget(article: listNews[index],)
                  ),

                  // CachedNetworkImage(
                  //     imageUrl: listNews[index].urlToImage ?? "https://a.fsdn.com/sd/topics/ai_64.png",
                  //     placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  //     errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                  // ),
              
                itemCount: listNews.length,
              ),
            );
        })
      ])
      );
  }
}

