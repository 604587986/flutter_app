import 'package:flutter/material.dart';

class Me extends StatefulWidget {
  const Me({Key? key}) : super(key: key);

  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: 2, vsync: this);
  }

  Widget _renderAppBar() {
    return SliverAppBar(
      title: Text("用户昵称字段"),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.message_outlined),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _renderTabContent() {
    return SliverToBoxAdapter(
      child: Container(
        child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 24),
            tabs: [Tab(text: "分享"), Tab(text: "捐赠")]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: Color.fromRGBO(5, 7, 38, 1),
        body: CustomScrollView(
          slivers: [_renderAppBar(), _renderTabContent()],
        ));
  }
}
