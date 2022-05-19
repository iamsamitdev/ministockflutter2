import 'package:flutter/material.dart';
import 'package:ministock/routers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'themes/style.dart';

// สร้างตัวแปรไว้เก็บ step ที่ผู้ใช้ทำงาน
var storeStep;
var initURL;

void main() async {

  // กำหนดให้สามารถเรียก Widget จากภายนอกได้
  WidgetsFlutterBinding.ensureInitialized();

  // อ่านข้อมูลจาก SharedPreferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  storeStep = sharedPreferences.getInt('storeStep');

  if(storeStep == 1){
    initURL = '/dashboard';
  }else if(storeStep == 2){
    initURL = '/login';
  }else{
    initURL = '/onboarding';
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      initialRoute: initURL,
      routes: routes,
    );
  }
}