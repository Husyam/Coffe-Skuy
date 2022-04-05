// @dart=2.9
import 'dart:convert';

import 'package:final_projek/succes.dart';
import 'package:flutter/material.dart';
import 'package:final_projek/home_1.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  @override
  _Details createState() => _Details();

  void setState(Null Function() param0) {}
}

class _Details extends State<Details> {
  TextEditingController searchSuggestController = new TextEditingController();
  // API
  final String apiUrl = "https://api.sampleapis.com/coffee/iced";
  String Subtitle = "-";
  String description = "-";

  bool isLoading = false;
  int counterValue = 0;
  Future<dynamic> fetchDataUsers() async {
    //using get
    final _response = await http.get(apiUrl);

    //using post
    /*final _response = await http.post(
     _myUrl,
     headers: <String, String>{
       'Content-Type': 'application/json; charset=UTF-8',
       'authorization': 'Basic ' + base64Encode(utf8.encode('$_username:$_password')),
     },
     body: jsonEncode(<String, String>{
       'id': id,
     }),
   );*/
    return json.decode(_response.body);
  }

  @override
  void initState() {
    fetchDataUsers().then((value) {
      setState(() {
        isLoading = false;
        print(value);
        Subtitle = value[0]['title'];
        description = value[0]['description'];
        // print(title);
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Stateful',
      home: Scaffold(
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(22),
            children: <Widget>[
              SizedBox(
                height: Size.fromHeight(50).height,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // width: 329,
                    height: 50,
                    // color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CarouselWithIndicatorDemo(),
                              ),
                            );
                          },
                          child: Icon(Icons.arrow_back_ios_new),
                        ),
                        Image.asset("assets/images/Cart.jpg")
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Size.fromHeight(24).height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 380,
                    // height: 181,
                    child: Column(
                      children: [
                        Image.asset("assets/images/Latte-details.jpg"),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 21,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  !isLoading
                      ? Text(
                          Subtitle,
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      : SizedBox(
                          height: 10,
                        ),
                  Text(
                    "Rp 15.000",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.star_rate,
                          color: Colors.amber,
                          size: 30,
                        ),
                        Text(
                          "|",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[500]),
                        ),
                        Text(
                          " 4.1",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 21,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 361,
                          child: !isLoading
                              ? Text(
                                  description,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )
                              : SizedBox(
                                  height: 10,
                                ),
                        ),
                        // !isLoading
                        //     ? Text(
                        //         description,
                        //         overflow: TextOverflow.fade,
                        //         style: TextStyle(
                        //           fontSize: 18,
                        //           fontWeight: FontWeight.bold,
                        //           color: Colors.black,
                        //         ),
                        //       )
                        //     : SizedBox(
                        //         height: 10,
                        //       ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 21,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Size",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        counterValue = counterValue - 1;
                        // index++;
                        // if (index == index - 1) {
                        //   // index++;
                        //   index = 0;
                        // } else {
                        //   index++;
                        // }
                        //
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrangeAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      "-",
                      style: TextStyle(fontSize: 31, color: Colors.white),
                    ),
                  ),
                  //
                  SizedBox(
                    width: 21,
                  ),
                  Text(
                    counterValue.toString(),
                    style: TextStyle(fontSize: 21),
                  ),
                  SizedBox(
                    width: 21,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        counterValue = counterValue + 1;
                        // index++;
                        // if (index == index - 1) {
                        //   // index++;
                        //   index = 0;
                        // } else {
                        //   index++;
                        // }
                        //
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrangeAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 31, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 54,
                    width: 367,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        primary: Colors.deepOrangeAccent,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Succes()));
                      },
                      child: Text(
                        'Order Now',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
            // scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
