// @dart=2.9

import 'dart:convert';
import 'dart:ui';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:final_projek/details.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CarouselWithIndicatorDemo(),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();
  // API
  final String apiUrl = "https://api.sampleapis.com/coffee/iced";
  String title = "-";

  bool isLoading = false;
  final List<Widget> myData = [
    Container(
      width: 290,
      // height: 10,
      // color: Colors.red,
      // child: Center(child: Text('data1')),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Banner-promo.jpg'),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    ),
    Container(
      width: 290,
      // height: 300,
      // color: Colors.red,
      // child: Center(child: Text('data1')),
      decoration: BoxDecoration(
        image: DecorationImage(
          // scale: 1,
          image: AssetImage('assets/images/Banner-promo.jpg'),
        ),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
    ),
    Container(
      width: 290,
      // height: 300,
      // color: Colors.red,
      // child: Center(child: Text('data1')),
      decoration: BoxDecoration(
        image: DecorationImage(
          // scale: 1,
          image: AssetImage("assets/images/Banner-promo.jpg"),
        ),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
    ),
    //
  ];

  get searchSuggestController => null;

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
        title = value[0]['title'];
        // print(title);
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // title: Text(
      //   //   'Travelkuy',
      //   //   style: TextStyle(
      //   //       color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 21),
      //   // ),
      //   centerTitle: false,
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      // ),

      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(22),
          children: <Widget>[
            SizedBox(
              height: Size.fromHeight(50).height,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // width: 329,
                  height: 80,
                  // color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/details.jpg",
                        width: 31,
                        height: 31,
                      ),
                      SizedBox(
                        width: Size.fromWidth(32).width,
                      ),
                      CircleAvatar(
                        radius: 31,
                        backgroundColor: Colors.red[700],
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            "assets/images/Coffe-latte.jpg",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Size.fromHeight(21).height,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: searchSuggestController,
                  textInputAction: TextInputAction.search,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    hintText: "Cari minuman apa Hari ini?",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                  style: TextStyle(),
                ),
                Column(),
              ],
            ),
            CarouselSlider(
              items: myData,
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: false,
                  aspectRatio: 3.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: myData.asMap().entries.map(
                (entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(
                          _current == entry.key ? 0.9 : 0.4,
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // height: 150,
                  width: 489,
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Coffe dan non coffe",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text("Lihat semua!"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: <Widget>[
                //     Container(
                //       width: 126,
                //       height: 159,
                //       color: Colors.blue,
                //       child: ListView(
                //           padding: const EdgeInsets.all(8),
                //           children: <Widget>[],
                //           scrollDirection: Axis.horizontal),
                //     ),
                //   ],
                // ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 370,
                      height: 230,
                      // color: Colors.amber,
                      child: ListView(
                        padding: const EdgeInsets.all(2),
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // height: 210,
                                // width: 170,
                                // color: Colors.red,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/Coffe-latte.jpg',
                                      // height: 80,
                                      width: 160,
                                    ),
                                    // SizedBox(
                                    //   height: 0,
                                    // ),
                                    // Text(
                                    //   "Coffe Latte",
                                    //   textAlign: TextAlign.left,
                                    // ),
                                    // TextButton(
                                    //   onPressed: () {
                                    //     // Navigator.push(
                                    //     //   context,
                                    //     //   MaterialPageRoute(
                                    //     //     builder: (context) => akun(),
                                    //     //   ),
                                    //     // );
                                    //   },
                                    //   child: Text(
                                    //     "Mr.Rafi",
                                    //     style: TextStyle(
                                    //         color: Colors.black, fontSize: 18),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Column(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        !isLoading
                                            ? Column(
                                                children: [
                                                  Text(
                                                    title,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Details(),
                                                        ),
                                                      );
                                                    },
                                                    child: Text(
                                                      "Rp.15.000",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.green[700],
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Details(),
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  "Rp.15.000",
                                                  style: TextStyle(
                                                      color: Colors.green[700],
                                                      fontSize: 18),
                                                ),
                                              ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star_rate,
                                              color: Colors.amber,
                                            ),
                                            Text("4.1"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: Size.fromWidth(20).width,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // height: 210,
                                // width: 170,
                                // color: Colors.red,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/Coffe-latte.jpg',
                                      // height: 80,
                                      width: 160,
                                    ),
                                    // SizedBox(
                                    //   height: 0,
                                    // ),
                                    // Text(
                                    //   "Coffe Latte",
                                    //   textAlign: TextAlign.left,
                                    // ),
                                    // TextButton(
                                    //   onPressed: () {
                                    //     // Navigator.push(
                                    //     //   context,
                                    //     //   MaterialPageRoute(
                                    //     //     builder: (context) => akun(),
                                    //     //   ),
                                    //     // );
                                    //   },
                                    //   child: Text(
                                    //     "Mr.Rafi",
                                    //     style: TextStyle(
                                    //         color: Colors.black, fontSize: 18),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Column(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Coffe Latte",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) => akun(),
                                            //   ),
                                            // );
                                          },
                                          child: Text(
                                            "Rp.15.000",
                                            style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 18),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star_rate,
                                              color: Colors.amber,
                                            ),
                                            Text("4.1"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: Size.fromWidth(20).width,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // height: 210,
                                // width: 170,
                                // color: Colors.red,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/Coffe-latte.jpg',
                                      // height: 80,
                                      width: 160,
                                    ),
                                    // SizedBox(
                                    //   height: 0,
                                    // ),
                                    // Text(
                                    //   "Coffe Latte",
                                    //   textAlign: TextAlign.left,
                                    // ),
                                    // TextButton(
                                    //   onPressed: () {
                                    //     // Navigator.push(
                                    //     //   context,
                                    //     //   MaterialPageRoute(
                                    //     //     builder: (context) => akun(),
                                    //     //   ),
                                    //     // );
                                    //   },
                                    //   child: Text(
                                    //     "Mr.Rafi",
                                    //     style: TextStyle(
                                    //         color: Colors.black, fontSize: 18),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Column(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Coffe Latte",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) => akun(),
                                            //   ),
                                            // );
                                          },
                                          child: Text(
                                            "Rp.15.000",
                                            style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 18),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star_rate,
                                              color: Colors.amber,
                                            ),
                                            Text("4.1"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: Size.fromWidth(20).width,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // height: 210,
                                // width: 170,
                                // color: Colors.red,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/Coffe-latte.jpg',
                                      // height: 80,
                                      width: 160,
                                    ),
                                    // SizedBox(
                                    //   height: 0,
                                    // ),
                                    // Text(
                                    //   "Coffe Latte",
                                    //   textAlign: TextAlign.left,
                                    // ),
                                    // TextButton(
                                    //   onPressed: () {
                                    //     // Navigator.push(
                                    //     //   context,
                                    //     //   MaterialPageRoute(
                                    //     //     builder: (context) => akun(),
                                    //     //   ),
                                    //     // );
                                    //   },
                                    //   child: Text(
                                    //     "Mr.Rafi",
                                    //     style: TextStyle(
                                    //         color: Colors.black, fontSize: 18),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Column(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Coffe Latte",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) => akun(),
                                            //   ),
                                            // );
                                          },
                                          child: Text(
                                            "Rp.15.000",
                                            style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 18),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star_rate,
                                              color: Colors.amber,
                                            ),
                                            Text("4.1"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // height: 150,
                  width: 489,
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Makanan",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text("Lihat semua!"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: <Widget>[
                //     Container(
                //       width: 126,
                //       height: 159,
                //       color: Colors.blue,
                //       child: ListView(
                //           padding: const EdgeInsets.all(8),
                //           children: <Widget>[],
                //           scrollDirection: Axis.horizontal),
                //     ),
                //   ],
                // ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 370,
                      height: 230,
                      // color: Colors.amber,
                      child: ListView(
                        padding: const EdgeInsets.all(2),
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // height: 210,
                                // width: 170,
                                // color: Colors.red,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/kentang.jpg',
                                      // height: 80,
                                      width: 160,
                                    ),
                                    // SizedBox(
                                    //   height: 0,
                                    // ),
                                    // Text(
                                    //   "Coffe Latte",
                                    //   textAlign: TextAlign.left,
                                    // ),
                                    // TextButton(
                                    //   onPressed: () {
                                    //     // Navigator.push(
                                    //     //   context,
                                    //     //   MaterialPageRoute(
                                    //     //     builder: (context) => akun(),
                                    //     //   ),
                                    //     // );
                                    //   },
                                    //   child: Text(
                                    //     "Mr.Rafi",
                                    //     style: TextStyle(
                                    //         color: Colors.black, fontSize: 18),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Column(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Kentang",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) => akun(),
                                            //   ),
                                            // );
                                          },
                                          child: Text(
                                            "Rp.15.000",
                                            style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 18),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star_rate,
                                              color: Colors.amber,
                                            ),
                                            Text("4.1"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: Size.fromWidth(20).width,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // height: 210,
                                // width: 170,
                                // color: Colors.red,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/Roti bakar.jpg',
                                      // height: 80,
                                      width: 160,
                                    ),
                                    // SizedBox(
                                    //   height: 0,
                                    // ),
                                    // Text(
                                    //   "Coffe Latte",
                                    //   textAlign: TextAlign.left,
                                    // ),
                                    // TextButton(
                                    //   onPressed: () {
                                    //     // Navigator.push(
                                    //     //   context,
                                    //     //   MaterialPageRoute(
                                    //     //     builder: (context) => akun(),
                                    //     //   ),
                                    //     // );
                                    //   },
                                    //   child: Text(
                                    //     "Mr.Rafi",
                                    //     style: TextStyle(
                                    //         color: Colors.black, fontSize: 18),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Column(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Roti Bakar",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) => akun(),
                                            //   ),
                                            // );
                                          },
                                          child: Text(
                                            "Rp.15.000",
                                            style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 18),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star_rate,
                                              color: Colors.amber,
                                            ),
                                            Text("4.1"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: Size.fromWidth(20).width,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // height: 210,
                                // width: 170,
                                // color: Colors.red,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/Coffe-latte.jpg',
                                      // height: 80,
                                      width: 160,
                                    ),
                                    // SizedBox(
                                    //   height: 0,
                                    // ),
                                    // Text(
                                    //   "Coffe Latte",
                                    //   textAlign: TextAlign.left,
                                    // ),
                                    // TextButton(
                                    //   onPressed: () {
                                    //     // Navigator.push(
                                    //     //   context,
                                    //     //   MaterialPageRoute(
                                    //     //     builder: (context) => akun(),
                                    //     //   ),
                                    //     // );
                                    //   },
                                    //   child: Text(
                                    //     "Mr.Rafi",
                                    //     style: TextStyle(
                                    //         color: Colors.black, fontSize: 18),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Column(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Coffe Latte",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) => akun(),
                                            //   ),
                                            // );
                                          },
                                          child: Text(
                                            "Rp.15.000",
                                            style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 18),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star_rate,
                                              color: Colors.amber,
                                            ),
                                            Text("4.1"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: Size.fromWidth(20).width,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // height: 210,
                                // width: 170,
                                // color: Colors.red,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/Coffe-latte.jpg',
                                      // height: 80,
                                      width: 160,
                                    ),
                                    // SizedBox(
                                    //   height: 0,
                                    // ),
                                    // Text(
                                    //   "Coffe Latte",
                                    //   textAlign: TextAlign.left,
                                    // ),
                                    // TextButton(
                                    //   onPressed: () {
                                    //     // Navigator.push(
                                    //     //   context,
                                    //     //   MaterialPageRoute(
                                    //     //     builder: (context) => akun(),
                                    //     //   ),
                                    //     // );
                                    //   },
                                    //   child: Text(
                                    //     "Mr.Rafi",
                                    //     style: TextStyle(
                                    //         color: Colors.black, fontSize: 18),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Column(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Coffe Latte",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) => akun(),
                                            //   ),
                                            // );
                                          },
                                          child: Text(
                                            "Rp.15.000",
                                            style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 18),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star_rate,
                                              color: Colors.amber,
                                            ),
                                            Text("4.1"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        // type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.black,
              ),
              title: Text('My Order'),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              title: Text('Watch List'),
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
              title: Text('Account'),
              backgroundColor: Colors.blueGrey),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
// disini
