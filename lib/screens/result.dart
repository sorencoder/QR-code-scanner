import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ResultScreen extends StatefulWidget {
  final String value;

  ResultScreen({Key? key, required this.value}) : super(key: key);
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.value),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.value,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack()
        ],
      ),
    );
  }
}
