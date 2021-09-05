import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  Widget _renderText() {
    return Container(
        alignment: AlignmentDirectional.topStart,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
        child: Text(
          "早上好啊，涩谷",
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }

  Widget _renderOptions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          _renderOptionItem("我的最爱"),
          Spacer(),
          _renderOptionItem("最近打开"),
        ],
      ),
    );
  }

  Widget _renderOptionItem(String title) {
    return GestureDetector(
      onTap: () {
        Fluttertoast.showToast(msg: title);
      },
      child: Container(
        width: 158,
        height: 56,
        alignment: AlignmentDirectional.center,
        child: Text(title, style: TextStyle(fontSize: 16, color: Colors.white)),
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(44, 47, 68, 1), width: 1),
          borderRadius: BorderRadius.all(
            //圆角
            Radius.circular(6.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_renderText(), _renderOptions()],
    );
  }
}
