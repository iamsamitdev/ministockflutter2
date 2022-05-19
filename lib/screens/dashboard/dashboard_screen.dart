import 'package:flutter/material.dart';
import 'package:ministock/screens/bottomnavmenu/account/account_screen.dart';
import 'package:ministock/screens/bottomnavmenu/home/home_screen.dart';
import 'package:ministock/screens/bottomnavmenu/notification/notification_screen.dart';
import 'package:ministock/screens/bottomnavmenu/report/report_screen.dart';
import 'package:ministock/screens/bottomnavmenu/setting/setting_screen.dart';
import 'package:ministock/utils/constants.dart' as Constants;

import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  // สร้าง Object แบบ Sharedprefference
  SharedPreferences sharedPreferences;

  _logout() async {
    sharedPreferences = await SharedPreferences.getInstance();
    // sharedPreferences.clear();
    sharedPreferences.setInt('storeStep', 2);
    Navigator.pushReplacementNamed(context, '/login');
  }

  // สร้างตัวแปรไว้เก็บ list รายการของ tab bottomnav และ appbar
  int _currentIndex = 0;
  String _title = Constants.app_name;

  // สร้าง List ไว้เก็บรายการ Screen
  List<Widget> _children = [
    HomeScreen(),
    ReportScreen(),
    NotificationScreen(),
    SettingScreen(),
    AccountScreen()
  ];

  // เขียนเงื่อนไขสำหรับเปลี่ยน Tab
  void onTabTapped(int index){
    setState(() {
      
      _currentIndex = index;

      switch (index) {
        case 0:
          _title = Constants.dashboard_title;
          break;
        case 1:
          _title = Constants.report_title;
          break;
        case 2:
          _title = Constants.notification_title;
          break;
        case 3:
          _title = Constants.setting_title;
          break;
        case 4:
          _title = Constants.account_title;
          break;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_title'),
        actions: [
          ElevatedButton.icon(
            onPressed: (){
              Navigator.pushNamed(context, '/qrcode');
            }, 
            icon: Icon(Icons.center_focus_strong_outlined),
            label: Text('SCAN'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffbf360c)),
            )
          )
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: Constants.dashboard_title
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart_outlined),
            label: Constants.report_title
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: Constants.notification_title
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: Constants.setting_title
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: Constants.account_title
          ),
        ]
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(Constants.account_name), 
              accountEmail: Text(Constants.account_email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_acc.jpg'),
                  fit: BoxFit.fill
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.info_outlined),
              title: Text(Constants.about_menu_text),
              onTap: (){
                Navigator.pushNamed(context, '/about');
              },
              trailing: Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text(Constants.term_menu_text),
              onTap: (){
                Navigator.pushNamed(context, '/termpolicy');
              },
              trailing: Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(Constants.contact_menu_text),
              onTap: (){
                Navigator.pushNamed(context, '/contact');
              },
              trailing: Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(Constants.signout_menu_text),
              onTap: _logout,
              trailing: Icon(Icons.chevron_right_outlined),
            ),
          ],
        ),
      ),
    );
  }
}