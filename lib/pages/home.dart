import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  double opacity = 0;
  late double extent = 0.2;

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget _renderAppbar() {
    return AppBar(
      title: Text(
        "小睡眠",
        style: TextStyle(color: Colors.black, fontSize: 30),
      ),
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.library_books),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.lock_clock),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
      actionsIconTheme: IconThemeData(color: Colors.grey.shade700),
      excludeHeaderSemantics: true,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _renderSwiper() {
    return Container(
        height: 400,
        child: Swiper(
          outer: true,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  child: Image.network(
                    imgList[index],
                    fit: BoxFit.cover,
                  ),
                ));
          },
          autoplay: true,
          autoplayDelay: 5000,
          duration: 500,
          itemCount: imgList.length,
          itemWidth: 300.0,
          layout: SwiperLayout.STACK,
        ));
  }

  Widget _renderContent() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
        ),
        foregroundDecoration:
            BoxDecoration(color: Colors.white.withOpacity(opacity)),
        child: Column(
          children: [_renderAppbar(), _renderSwiper()],
        ));
  }

  Widget _renderMask() {
    if (extent > 0.5) {
      return Positioned.fill(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: extent,
            sigmaY: extent,
          ),
          child: Container(),
        ),
      );
    } else {
      return SizedBox(
        width: 0,
        height: 0,
      );
    }
  }

  Widget _renderBottomSheet() {
    return NotificationListener(
      onNotification: (DraggableScrollableNotification notification) {
        setState(() {
          extent = notification.extent;
          opacity = notification.extent - 0.2;
        });
        return true;
      },
      child: DraggableScrollableSheet(
          initialChildSize: 0.2,
          minChildSize: 0.2,
          maxChildSize: 1,
          expand: true,
          builder: (context, scrollController) {
            return SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    Container(
                      color: Colors.green,
                      height: 500,
                    ),
                    Container(
                      // color: Colors.red,
                      height: 500,
                    ),
                    Container(
                      color: Colors.yellow,
                      height: 500,
                    ),
                  ],
                ));
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Stack(children: [
      _renderContent(), //
      _renderMask(), //
      _renderBottomSheet() //
    ]));
  }
}
