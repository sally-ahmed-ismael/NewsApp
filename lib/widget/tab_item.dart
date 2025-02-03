import 'package:flutter/material.dart';
import 'package:newsapp/model/source_response.dart';

class TabItem extends StatelessWidget {
  TabItem({super.key, required this.source, required this.isSelected});
  Sources source;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xff1877f2) ,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        color: isSelected? Color(0xff1877f2) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xff1877f2) ,
          width: 2,
        )
      ),
      child: Text(source.name ?? "un-named" , style: TextStyle(fontSize: 20,
          color: isSelected? Color(0xff202020) : Colors.white ),) ,
    );
  }
}