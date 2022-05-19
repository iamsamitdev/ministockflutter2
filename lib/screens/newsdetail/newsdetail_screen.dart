import 'package:flutter/material.dart';
import 'package:ministock/models/NewsDetailModel.dart';
import 'package:ministock/services/rest_api.dart';

class NewsDetailScreen extends StatefulWidget {
  NewsDetailScreen({Key key}) : super(key: key);

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {

  // เรียกใช้งาน Model
  NewsDetailModel _dataNews;

  // สร้งฟังก์ชันอ่านรายละเอียดข่าว
  readNewsDetail(id) async {
    try{
      var response = await CallAPI().getNewsByID(id);

      setState(() {
        _dataNews = response;
      });

    }catch(error){
      print(error);
    }
  }


  @override
  Widget build(BuildContext context) {

    // การรับค่าจาก arguments
    final Map arguments =  ModalRoute.of(context).settings.arguments as Map;

    // เรียกใช้งานฟังก์ชัน readNewsDetail
    readNewsDetail(arguments['id']).toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('${_dataNews?.topic ?? "..."}'),
      ),
      body: ListView(
        children: [
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(_dataNews?.imageurl ?? "..."),
                fit: BoxFit.cover
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('${_dataNews?.topic ?? "..."}', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('${_dataNews?.detail ?? "..."}'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Published: ${_dataNews?.createdAt ?? "..."}'),
          )
        ],
      ),
    );
  }
}