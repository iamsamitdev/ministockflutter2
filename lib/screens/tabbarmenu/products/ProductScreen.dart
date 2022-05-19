import 'package:flutter/material.dart';
import 'package:ministock/screens/editproduct/editproduct_screen.dart';
import 'package:ministock/services/rest_api.dart';
import 'package:ministock/models/ProductModel.dart';
import 'package:ministock/utils/utility.dart';
import 'package:intl/intl.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  // กำหนดรูปแบบการแสดงผลยอดเงิน
  final currency = NumberFormat.currency(locale: "en_US", symbol: "");

  // Call API
  CallAPI callAPI;

  // สร้าง Context
  BuildContext context;

  // เรียกใช้ Method initState() สำหรับให้ทำงานครั้งที่โหลด
  @override
  void initState() {
    super.initState();
    callAPI = CallAPI();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder(
        future: callAPI.getProducts(),
        builder: (BuildContext context,
              AsyncSnapshot<List<ProductModel>> snapshot) {
            if (snapshot.hasError) {
              // ถ้าโหลดข้อมูลไม่ได้มีข้อผิดพลาด
              return Utility().showAlertDialog(
                  context, 'มีข้อผิดพลาด', snapshot.error.toString());
            } else if (snapshot.connectionState == ConnectionState.done) {
              // ถ้าโหลดข้อมูลสำเร็จ
              List<ProductModel> products = snapshot.data;
              return _listViewProduct(products);
            } else {
              // ระหว่างที่กำลังโหลดข้อมูล
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addproduct');
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Colors.red,
        splashColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // --------------------------------------------------------
  // สร้าง ListView สำหรับแสดงรายการสินค้า
  // --------------------------------------------------------
  Widget _listViewProduct(List<ProductModel> products) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          // Load Model
          ProductModel product = products[index];
          print(product.productImage);
          return Card(
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: product.productImage != '' ? Image.network(product.productImage) : Image.asset('assets/images/logo_qr.png'),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, bottom: 5.0, left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.productName,
                                style: TextStyle(fontSize: 24),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                product.productBarcode,
                                style: TextStyle(fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                currency
                                    .format(double.parse(product.productPrice)),
                                // product.productPrice,
                                style: TextStyle(fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/editproduct',
                              arguments: ScreenArguments(
                                  product.id,
                                  product.productName,
                                  product.productDetail,
                                  product.productBarcode,
                                  product.productPrice,
                                  product.productQty,
                                  product.productImage),
                            ).then((value) => setState(() {
                                  callAPI.getProducts();
                                }));
                          },
                          child: Text('แก้ไข'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.yellow[900],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            return showDialog<void>(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('ยืนยันการลบข้อมูล'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text('รายการนี้จะถูกลบออกอย่างถาวร'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('ไม่'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text('ยืนยัน'),
                                      onPressed: () async {
                                        var response = await CallAPI().deleteProduct(product.id);
                                        if (response == true) {
                                          //Navigator.pushNamed(context, '/stockscreen');
                                          Navigator.pop(context, true);
                                          setState(() {
                                            callAPI.getProducts();
                                          });
                                        }
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red[700],
                          ),
                          child: Text(
                            'ลบ',
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

}
