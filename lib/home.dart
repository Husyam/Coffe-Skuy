import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController searchSuggestController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Stateful',
      home: Scaffold(
        backgroundColor: Colors.white,
        // backgroundColor: Color(0xf44336),
        appBar: AppBar(
          title: Text(
            'My App',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(22),
            children: <Widget>[
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
                          width: Size.fromWidth(30).width,
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
                height: Size.fromHeight(33).height,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 500,
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: <Widget>[
                        Image.asset("assets/images/Banner-promo.jpg"),
                      ],
                      scrollDirection: Axis.vertical,
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
