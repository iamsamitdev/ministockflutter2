import 'package:flutter/material.dart';

class TermPolicyScreen extends StatefulWidget {
  TermPolicyScreen({Key key}) : super(key: key);

  @override
  _TermPolicyScreenState createState() => _TermPolicyScreenState();
}

class _TermPolicyScreenState extends State<TermPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เงื่อนไขการใช้งาน'),
      ),
      body: Center(
        child: Text('รายละเอียดเงื่อนไขการใช้งาน'),
      ),
    );
  }
}