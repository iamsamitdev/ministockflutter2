import 'package:flutter/material.dart';
import 'package:ministock/screens/tabbarmenu/news/NewsScreen.dart';
import 'package:ministock/screens/tabbarmenu/products/ProductScreen.dart';
import 'package:ministock/screens/tabbarmenu/reports/ReportScreen.dart';
import 'package:ministock/utils/constants.dart' as Constants;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: Constants.news_tabmenu_text,),
                Tab(text: Constants.product_tabmenu_text,),
                Tab(text: Constants.report_tabmenu_text,)
              ]
            ),
          ),
        ),
        body: TabBarView(
          children: [
            NewsScreen(),
            ProductScreen(),
            ReportScreen()
          ]
        ),
      ),
    );
  }
}