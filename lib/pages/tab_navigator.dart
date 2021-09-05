import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/pages/home/home.dart';
import 'package:my_app/pages/me/me.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({Key? key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  PageController _controller = PageController(initialPage: 0);
  DateTime? _lastPressedAt; // 上次点击时间
  int _currentIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 退出app
  Future<bool> exitApp() async {
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt!) > Duration(seconds: 2)) {
      Fluttertoast.showToast(
          msg: "再按一次退出应用",
          backgroundColor: Colors.grey,
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 14);
      //两次点击间隔超过2秒则重新计时
      _lastPressedAt = DateTime.now();
      return Future.value(false);
    }
    return Future.value(true);
  }

  BottomNavigationBarItem _renderBottomNavItem(
      String title, IconData normalIcon, IconData activeIcon) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        child: Icon(normalIcon),
        width: 32,
        height: 28,
      ),
      activeIcon: SizedBox(
        child: Icon(activeIcon, color: Color.fromRGBO(220, 201, 175, 1)),
        width: 32,
        height: 28,
      ),
      label: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: exitApp,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller,
          children: [Home(), Me(), Me(), Me(), Me()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(5, 7, 38, 1),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color.fromRGBO(220, 201, 175, 1),
        selectedFontSize: 12,
        items: [
          _renderBottomNavItem('每日修行', Icons.home, Icons.home),
          _renderBottomNavItem('减压', Icons.home, Icons.home),
          _renderBottomNavItem('睡觉', Icons.home, Icons.home),
          _renderBottomNavItem('专注', Icons.home, Icons.home),
          _renderBottomNavItem('我', Icons.people, Icons.people)
        ],
      ),
    );
  }
}
