import 'package:final_projek/home.dart';
import 'package:flutter/material.dart';
import 'package:final_projek/home_1.dart';
import 'package:final_projek/home.dart';

class Succes extends StatefulWidget {
  @override
  _Succes createState() => _Succes();
}

class _Succes extends State<Succes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Stateful',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(22),
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 350.77,
                    height: 398,
                    child: Image.asset("assets/images/Succes.jpg"),
                  ),
                  SizedBox(
                    height: 61,
                  ),
                  Column(
                    children: [
                      Text(
                        "Order Confirmed",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 367,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 3,
                            primary: Colors.deepOrangeAccent,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Succes()));
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Track your order',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarouselWithIndicatorDemo(),
                            ),
                          );
                          // Navigator.pop(context);
                        },
                        child: Text(
                          "Back to home",
                          style: TextStyle(color: Colors.black, fontSize: 28),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
