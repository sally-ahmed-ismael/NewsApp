import 'package:flutter/material.dart';
import 'package:newsapp/api/api.dart';
import 'package:newsapp/model/source_response.dart';
import 'package:newsapp/widget/tab_container.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        backgroundColor: Color(0xff1877f2),
        centerTitle: true,
        title: Text("News", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.white),),
        ) ,

      body: FutureBuilder<SourceResponse>(
        future: AppApi.getSources(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Color(0xff1877f2),
              ),
            );
          }
          var listSource = snapshot.data?.sources ?? [];
          return TabContainer(listSources: listSource);
         /* return ListView.builder(
            itemBuilder: (context, index) => 
            // Text(listSource[index].name ?? "EMPTY", style: TextStyle(color: Colors.white)),
            TabItem(source: listSource[index]),
          itemCount: listSource.length,);*/
        }) 
    );
  }
}