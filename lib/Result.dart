import 'package:bmi/home.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result({Key? key, required this.result}) : super(key: key);

  final double? result;
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.arrow_back)),
          centerTitle: true,
          backgroundColor: const Color(0xFF210E0B),
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: const Text(
              'BMI Calculator',
              textScaleFactor: 1,
            ),
          ),
        ),
        body: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(10),
          color: const Color(0xFF210E0B),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Your Result',
                  textScaleFactor: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(10),
                    color: const Color(0x10277400),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('${resultState()}',
                              textScaleFactor: 1,
                              style: TextStyle(
                                  color: getThemePage(),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis)),
                          Text('${result?.round()}',
                              textScaleFactor: 1,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis)),
                          Text(
                            '${resultStateAdvice()}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                            textScaleFactor: 1,
                          )
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ));
                    },
                    child: const Text(
                      'ReCalculate',
                      textScaleFactor: 1,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ))
              ]),
        ));
  }

  String? resultState() {
    if (result! < 18.5) {
      return "Under weight";
    } else if (result! >= 18.5 && result! < 25) {
      return "Normal";
    } else if (result! >= 25 && result! < 35) {
      return "Over Weight";
    } else {
      return 'Obesity .. Danger';
    }
  }
  String? resultStateAdvice() {
    if (result! < 18.5) {
      return 'You have less body weight than Normal. eat more';
    } else if (result! >= 18.5 && result! < 25) {
      return 'You have Normal body weight. Good Job!';
    } else if (result! >= 25 && result! < 35) {
      return 'You have more body weight than Normal. be Careful';
    } else {
      return 'this is not good. be Careful ';
    }
  }
  MaterialColor? getThemePage() {
    if (result! < 18.5) {
      return Colors.blue;
    } else if (result! >= 18.5 && result! < 25) {
      return Colors.green;
    } else if (result! >= 25 && result! < 35) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}

//Color(0x10277400) ,
