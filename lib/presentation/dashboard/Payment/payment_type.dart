import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:http/http.dart' as http;
import 'package:traval/presentation/dashboard/Payment/Payment_Screen.dart';

class Payment_type extends StatefulWidget {
  @override
  _Payment_typeState createState() => _Payment_typeState();
}

class _Payment_typeState extends State<Payment_type> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // title: Text('Custom UI'),
          backgroundColor: Color.fromARGB(255, 241, 240, 240),
          foregroundColor: Colors.black,
          shadowColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "chosepaymentmethod".tr,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "(" + "clickoneofoption".tr + ")",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => payment_form(type: "visa"),
                        ),
                      );
                    },
                    child: Container(
                      height: 140,
                      width: 290,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Image.asset("assets/images/visa.jpg"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => payment_form(type: "credit"),
                          ));
                    },
                    child: Container(
                      height: 140,
                      width: 290,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Image.asset("assets/images/master.jpg"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => payment_form(type: "mada"),
                        ),
                      );
                    },
                    child: Container(
                      height: 140,
                      width: 290,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Image.asset(
                        "assets/images/mada.png",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // TextButton(
                  //   style: ButtonStyle(),
                  //   child: Text('Credit Card'),
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => payment_form(type: "credit"),
                  //       ),
                  //     );
                  //   },
                  // ),
                  // SizedBox(height: 15),
                  // TextButton(
                  //   child: Text('Mada'),
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => payment_form(type: "mada"),
                  //       ),
                  //     );
                  //   },
                  // padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
                  // ),
                  // SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
