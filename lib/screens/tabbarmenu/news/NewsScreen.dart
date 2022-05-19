import 'package:flutter/material.dart';
import 'package:ministock/services/rest_api.dart';
import 'package:ministock/models/NewsModel.dart';
import 'package:ministock/utils/constants.dart' as Constants;

class NewsScreen extends StatefulWidget {
  NewsScreen({Key key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size.height;
    // print(size);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              Constants.text_hot_news,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 210.0,
            child: FutureBuilder(
                future: CallAPI().getLastNews(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<NewsModel>> snapshot) {
                  if (snapshot.hasError) {
                    // ถ้าโหลดข้อมูลไม่ได้มีข้อผิดพลาด
                    return null;
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    // ถ้าโหลดข้อมูลสำเร็จ
                    List<NewsModel> news = snapshot.data;
                    return _listViewLastNews(news);
                  } else {
                    // ระหว่างที่กำลังโหลดข้อมูล
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              Constants.text_general_news,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
                future: CallAPI().getAllNews(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<NewsModel>> snapshot) {
                  if (snapshot.hasError) {
                    // ถ้าโหลดข้อมูลไม่ได้ หรือมีข้อผิดพลาด
                    return null;
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    // ถ้าโหลดข้อมูลสำเร็จ
                    List<NewsModel> news = snapshot.data;
                    return _listViewAllNews(news);
                  } else {
                    // ระหว่างที่กำหลังโหลดข้อมูล สามารถใส่ loading...
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }

  // --------------------------------------------
  // สร้าง ListView สำหรับการแสดงข่าวทั้งหมด
  // -------------------------------------------
  Widget _listViewAllNews(List<NewsModel> news) {
    return Padding(
      padding: const EdgeInsets.only(bottom:10.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: news.length,
        itemBuilder: (context, index) {
          // Load Model
          NewsModel newsModel = news[index];

          return ListTile(
            leading: Icon(Icons.pages),
            title: Text(
              newsModel.topic,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              newsModel.detail,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: (){
              Navigator.pushNamed(context, '/newsdetail',arguments: {'id': newsModel.id});
            },
          );
        },
      ),
    );
  }

  // -------------------------------------------
  // สร้าง ListView สำหรับการแสดงข่าวล่าสุด
  // -------------------------------------------
  Widget _listViewLastNews(List<NewsModel> news) {
    return ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal, // Listview แนวนอน
        itemCount: news.length,
        itemBuilder: (context, index) {
          // Load Model
          NewsModel newsModel = news[index];
          // ออกแบบส่วนหน้าตาของการแสดงผล listview
          return Container(
            width: MediaQuery.of(context).size.width * 0.60,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/newsdetail',arguments: {'id': newsModel.id});
              },
              child: Card(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 125.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(newsModel.imageurl),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              newsModel.topic,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              newsModel.detail,
                              style: TextStyle(fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
