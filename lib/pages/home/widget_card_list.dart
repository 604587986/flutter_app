import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  List cardList = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  Widget _renderCardItem() {
    return Container(
      margin: EdgeInsets.only(top: 35),
      height: 114,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(44, 47, 68, 1), width: 1),
        borderRadius: BorderRadius.all(
          //圆角
          Radius.circular(6.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 180,
              child: Padding(
                  padding: EdgeInsets.only(top: 10, left: 12, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "放轻松",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            "做五次深呼吸",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.notifications,
                                color: Colors.white54,
                                size: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("全身放松运动",
                                  style: TextStyle(
                                      color: Colors.white54, fontSize: 10)),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.more_time,
                                color: Colors.white54,
                                size: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("1min",
                                  style: TextStyle(
                                      color: Colors.white54, fontSize: 10)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ))), //
          SizedBox(
              width: 145,
              height: 114,
              child: Container(
                  child: Image.network(
                "https://pics0.baidu.com/feed/377adab44aed2e735c55a72e93e1b08286d6fa59.jpeg?token=7f8682ade19deb9ab9fc1232c63f1efd",
                fit: BoxFit.fill,
              )))
        ],
      ),
    );
  }

  Widget _renderList() {
    return Column(
      children: cardList.map((e) => _renderCardItem()).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "开启美好一天",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          _renderList()
        ],
      ),
    );
  }
}
