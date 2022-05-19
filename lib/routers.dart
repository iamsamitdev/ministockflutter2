import 'package:flutter/material.dart';
import 'package:ministock/screens/addproduct/addproduct_screen.dart';
import 'package:ministock/screens/dashboard/dashboard_screen.dart';
import 'package:ministock/screens/drawermenu/about/about_screen.dart';
import 'package:ministock/screens/drawermenu/contact/contact_screen.dart';
import 'package:ministock/screens/drawermenu/termpolicy/termpolicy_screen.dart';
import 'package:ministock/screens/editproduct/editproduct_screen.dart';
import 'package:ministock/screens/login/login_screen.dart';
import 'package:ministock/screens/newsdetail/newsdetail_screen.dart';
import 'package:ministock/screens/onboarding/onboarding_screen.dart';
import 'package:ministock/screens/qrcode/qrcode_screen.dart';
import 'package:ministock/screens/qrcode/resultscan_screen.dart';
import 'package:ministock/screens/register/register_screen.dart';

// สร้างตัวแปรแบบ Map ไว้เก็บ URL และ Screen
Map<String, WidgetBuilder> routes = {
  "/about":(BuildContext context) => AboutScreen(),
  "/termpolicy":(BuildContext context) => TermPolicyScreen(),
  "/contact":(BuildContext context) => ContactScreen(),
  "/dashboard":(BuildContext context) => DashboardScreen(),
  "/newsdetail":(BuildContext context) => NewsDetailScreen(),
  "/onboarding":(BuildContext context) => OnboardingScreen(),
  "/login":(BuildContext context) => LoginScreen(),
  "/register":(BuildContext context) => RegisterScreen(),
  "/editproduct":(BuildContext context) => EditProductScreen(),
  "/addproduct":(BuildContext context) => AddProductScreen(),
  "/qrcode":(BuildContext context) => QRCodeScreen(),
  "/resultscan":(BuildContext context) => ResultScanScfeen(),
};