import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
   const WebViewScreen({super.key, required this.url});
  final String url;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late var controller = WebViewController();
  // late var controller =WebViewPlatform.instance ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.loadRequest(Uri.parse(widget.url));
    // controller.loadHtmlString(widget.url);
  }
 /* class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
   
   controller = WebViewController();

    controller = WebViewController();
    controller.loadRequest(Uri.parse(widget.url));
  }
  */

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff202020),
        body: WebViewWidget(controller: controller)
        
      ),
    );
  }
}