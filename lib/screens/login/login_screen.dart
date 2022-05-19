import 'dart:convert';
import 'package:ministock/utils/utility.dart';
import 'package:ministock/services/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // สร้างตัวแปรไว้เก็บ username และ password
  String _username, _password;

  // สร้าง key เพื่อผูกกับฟอร์ม
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                style:
                                    TextStyle(fontSize: 24, color: Colors.teal),
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.person,
                                      size: 28,
                                    ),
                                    labelText: 'ชื่อผู้ใช้',
                                    hintText: 'กรุณาป้อนชื่อผู้ใช้',
                                    hintStyle: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                    errorStyle: TextStyle(fontSize: 16)),
                                    validator: (value){
                                      if(value.isEmpty){
                                        return 'กรุณาป้อนชื่อผู้ใช้ก่อน';
                                      }else{
                                        return null;
                                      }
                                    },
                                    onSaved: (value){
                                      _username = value.trim();
                                    },
                              ),
                              TextFormField(
                                autofocus: false,
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                style:
                                    TextStyle(fontSize: 24, color: Colors.teal),
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.lock,
                                      size: 28,
                                    ),
                                    labelText: 'รหัสผ่าน',
                                    hintText: 'กรุณาป้อนรหัสผ่าน',
                                    hintStyle: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                    errorStyle: TextStyle(fontSize: 16)),
                                    validator: (value){
                                      if(value.isEmpty){
                                        return 'กรุณาป้อนรหัสผ่านก่อน';
                                      }else{
                                        return null;
                                      }
                                    },
                                    onSaved: (value){
                                      _password = value.trim();
                                    },
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              ElevatedButton(
                                onPressed: () async {

                                  if(formKey.currentState.validate()){

                                    formKey.currentState.save();

                                    // print(_username+_password);

                                    // เรียกใช้ LoginAPI
                                    var response = await CallAPI().loginAPI(
                                      {
                                        "username": _username,
                                        "password": _password
                                      }
                                    );

                                    var body = json.decode(response.body);

                                    // print(body);

                                    if(body['status'] == 'success' && body['data']['status'] == '1'){

                                      // สร้าง Object แบบ SharedPreferences
                                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

                                      // เก็บค่าที่ต้องการลงในต้วแปรแบบ SharedPreferences
                                      sharedPreferences.setString('storeID', body['data']['id']);
                                      sharedPreferences.setString('storeFullname', body['data']['fullname']);
                                      sharedPreferences.setString('storeUsername', body['data']['username']);
                                      sharedPreferences.setString('storeImgProfile', body['data']['img_profile']);
                                      sharedPreferences.setInt('storeStep', 1);

                                      // ส่งไปหน้า Dashboard
                                      Navigator.pushReplacementNamed(context, '/dashboard');

                                    }else{
                                      // print('login fail!');
                                      Utility().showAlertDialog(context, 'มีข้อผิดพลาด', 'ข้อมูลเข้าระบบไม่ถูกต้อง');
                                    }

                                  }

                                },
                                child: Padding(
                                  // padding: const EdgeInsets.only(left: 20, right: 20),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 70, vertical: 10),
                                  child: Text(
                                    'เข้าสู่ระบบ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                'ยังไม่เป็นสมาชิก ?',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(context, '/register');
                                },
                                child: Text(
                                  'สมัครสมาชิก',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    )
    );
  }
}
