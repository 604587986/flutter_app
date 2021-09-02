import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: Text("我的")),
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
          width: double.infinity,
          color: Colors.red,
          child: Text('我的'),
        ),
      ),
    );
  }
}
