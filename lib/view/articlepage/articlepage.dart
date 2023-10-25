import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newsapp/controller/articlecontroller.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatelessWidget {
  final blogUrl;

   ArticleView({super.key, this.blogUrl});

  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    // final WebViewdata = Provider.of<ArticleController>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'INFO ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'MATRIX',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          actions: const [
            Opacity(
              opacity: 0,
              child: SizedBox(
                child: Icon(Icons.abc),
              ),
            )
          ],
          elevation: 0,
        ),
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            child: WebView(
              initialUrl: blogUrl,
              onWebViewCreated: ((WebViewController webViewController) {
                _completer.complete(webViewController);
              }),
            )),
      ),
    );
  }
}
