import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget numberButton(String btnText, Color btnColor, Color txtClor) {
      return ElevatedButton(
        onPressed: () => {calculate(btnText)},
        style: ElevatedButton.styleFrom(
          fixedSize: Size(70, 70),
          shape: CircleBorder(),
          primary: btnColor,
        ),
        child: Text(
          btnText,
          style: TextStyle(fontSize: 25, color: txtClor),
        ),
      );
    }

    return MaterialApp(
        title: 'Calculator',
        home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text("Calculator"),
            backgroundColor: Colors.black,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        text,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 80),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    numberButton("C", Colors.grey, Colors.black),
                    numberButton("+/-", Colors.grey, Colors.black),
                    numberButton("%", Colors.grey, Colors.black),
                    numberButton("/", Colors.orange, Colors.white),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    numberButton(
                        "7", Color.fromARGB(255, 20, 20, 20), Colors.white),
                    numberButton(
                        "8", Color.fromARGB(255, 20, 20, 20), Colors.white),
                    numberButton(
                        "9", Color.fromARGB(255, 20, 20, 20), Colors.white),
                    numberButton("x", Colors.orange, Colors.white),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    numberButton(
                        "4", Color.fromARGB(255, 20, 20, 20), Colors.white),
                    numberButton(
                        "5", Color.fromARGB(255, 20, 20, 20), Colors.white),
                    numberButton(
                        "6", Color.fromARGB(255, 20, 20, 20), Colors.white),
                    numberButton("-", Colors.orange, Colors.white),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    numberButton(
                        "1", Color.fromARGB(255, 20, 20, 20), Colors.white),
                    numberButton(
                        "2", Color.fromARGB(255, 20, 20, 20), Colors.white),
                    numberButton(
                        "3", Color.fromARGB(255, 20, 20, 20), Colors.white),
                    numberButton("+", Colors.orange, Colors.white),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(28, 12, 90, 12),
                        child: Text(
                          "0",
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: (Color.fromARGB(255, 20, 20, 20)),
                      ),
                    ),
                    numberButton(
                        ".", Color.fromARGB(255, 20, 20, 20), Colors.white),
                    numberButton("=", Colors.orange, Colors.white),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ));
  }

// Logic
  int firstNumber = 0;
  int secondNumber = 0;
  String result = "";
  String text = "";
  String operation = "";

  void calculate(String btnText) {
    if (btnText == "C") {
      result = "";
      text = "";
      firstNumber = 0;
      secondNumber = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      firstNumber = int.parse(text);
      result = "";
      operation = btnText;
    } else if (btnText == "=") {
      secondNumber = int.parse(text);
      if (operation == "+") {
        result = (firstNumber + secondNumber).toString();
      }
      if (operation == "-") {
        result = (firstNumber - secondNumber).toString();
      }
      if (operation == "x") {
        result = (firstNumber * secondNumber).toString();
      }
      if (operation == "/") {
        result = (firstNumber ~/ secondNumber).toString();
      }
    } else {
      result = int.parse(text + btnText).toString();
    }
    // setState(() {
    //   text = result;
    // });
  }
}
