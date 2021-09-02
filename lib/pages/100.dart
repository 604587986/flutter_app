import 'package:flutter/material.dart';
import 'package:my_app/widgets/webview.dart';

class T100 extends StatefulWidget {
  const T100({Key? key}) : super(key: key);

  @override
  _T100State createState() => _T100State();
}

class _T100State extends State<T100> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Webview(
      initialUrl: "https://m.100.com.tw",
      title: '100',
    );
  }
}
