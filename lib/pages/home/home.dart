import 'package:flutter/material.dart';
import 'package:my_app/pages/home/widget_card_list.dart';
import 'package:my_app/pages/home/widget_welcome.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  Widget _renderAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Color.fromRGBO(5, 7, 38, 1),
      actions: [
        IconButton(
          icon: Icon(Icons.message_outlined),
          onPressed: () {},
        ),
      ],
      actionsIconTheme: IconThemeData(color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: _renderAppbar() as PreferredSizeWidget,
      body: Container(
          color: Color.fromRGBO(5, 7, 38, 1),
          child: SingleChildScrollView(
            child: Column(
              children: [Welcome(), CardList()],
            ),
          )),
    );
  }
}
