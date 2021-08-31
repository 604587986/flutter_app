import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  late PageController _pageController;

  void _onBottomNagigationBarTapped(index) {
    setState(() {
      _pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _index = index;
          });
        },
        children: [Home(), Profile()],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: _onBottomNagigationBarTapped,
        items: [
          _renderBottomNavItem('首页', Icons.home, 'images/home_active.json'),
          _renderBottomNavItem('我的', Icons.group, 'images/user_active.json')
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  BottomNavigationBarItem _renderBottomNavItem(
      String title, IconData normalIcon, String activeIcon) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        child: Icon(normalIcon),
        width: 32,
        height: 28,
      ),
      activeIcon: Lottie.asset(
        activeIcon,
        repeat: false,
        width: 32,
        height: 28,
      ),
      label: title,
    );
  }
}
