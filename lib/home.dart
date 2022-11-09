import 'dart:math';
import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int height = 160;
  int weight = 60;
  int age = 20;
  bool isMale = true;
  var size, heightConta, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    heightConta = size.height;
    width = size.width;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFF210E0B),
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          title: const Text(
            'BMI Calculator',
            textScaleFactor: 1,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            width: width,
            height: heightConta,
            color: const Color(0xFF210E0B),
            child: Column(children: [
              Expanded(
                child: Container(
                  width: width,

                  margin: const EdgeInsets.symmetric(vertical: 10),
                  // color: const Color(0x10277400),

                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20),
                          color: isMale ? Colors.green : Colors.blueGrey,
                        ),
                        width: width * .45,
                        // color: isMale ? Colors.green : Colors.blueGrey,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.male, size: 100, color: Colors.white),
                            Text(
                              'Male',
                              style: TextStyle(
                                  fontSize: 25, color: Colors.blueGrey),
                              textScaleFactor: 1,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20),
                          color: !isMale ? Colors.green : Colors.blueGrey,
                        ),

                        width: width * .45,
                        // color: !isMale ? Colors.green : Colors.blueGrey,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.female, size: 100, color: Colors.white),
                            Text(
                              'Female',
                              style: TextStyle(
                                  fontSize: 25, color: Colors.blueGrey),
                              textScaleFactor: 1,
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  color: const Color(0x10277400),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Height',
                            textScaleFactor: 1,
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 35),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                        Text('$height  cm',
                            textScaleFactor: 1,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30)),
                        Slider(
                            max: 220,
                            min: 100,
                            divisions: 120,
                            activeColor: Colors.red,
                            inactiveColor: Colors.grey,
                            value: height.toDouble(),
                            onChanged: (val) {
                              setState(() {
                                height = val.round();
                              });
                            })
                      ]),
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color(0xFF210E0B),
                  child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Expanded(
                          child: Container(
                            width: width * .45,
                            color: const Color(0x10277400),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text('Weight',
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 35),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                                Text('$weight',
                                    textScaleFactor: 1,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FloatingActionButton(
                                        backgroundColor: Colors.blueGrey,
                                        child: const Icon(
                                            color: Colors.white, Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            weight += 2;
                                          });
                                        }),
                                    FloatingActionButton(
                                        backgroundColor: Colors.blueGrey,
                                        child: const Icon(
                                            color: Colors.white,
                                            Icons.minimize),
                                        onPressed: () {
                                          setState(() {
                                            weight--;
                                          });
                                        })
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            width: width * .45,
                            color: const Color(0x10277400),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  'Age',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 35,
                                  ),
                                ),
                                Text(
                                  '$age',
                                  textScaleFactor: 1,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FloatingActionButton(
                                      backgroundColor: Colors.blueGrey,
                                      child: const Icon(
                                          color: Colors.white, Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          age += 2;
                                        });
                                      },
                                    ),
                                    FloatingActionButton(
                                        backgroundColor: Colors.blueGrey,
                                        child: const Icon(
                                            color: Colors.white,
                                            Icons.minimize),
                                        onPressed: () {
                                          setState(() {
                                            age--;
                                          });
                                        })
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              MaterialButton(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  color: Colors.red,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(50))),
                  minWidth: double.infinity,
                  onPressed: () {
                    var result = weight / pow(height / 100, 2);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Result(result: result),
                        ));
                  },
                  child: const Text(
                    'Calculate',
                    textScaleFactor: 1,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ))
            ]),
          ),
        ));
  }
}
