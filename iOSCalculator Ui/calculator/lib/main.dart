import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
const equal_sign = "\u003D";

const add_sign = "\u002B";

const minus_sign = "-";

const multiply_sign = "\u00D7";

const divide_sign = "\u00F7";

const percent_sign = "%";

const plus_or_minus_sign = "+/-";

const clear_sign = "AC";

enum Operation {
  none,
  divide,
  multiply,
  subtract,
  add,
  clear,
  changeSign,
  addDecimal,
  percent,
  equals
}

enum BinaryOperation {
  divide,
  multiply,
  subtract,
  add,
}

enum UnaryOperation {
  changeSign,
  percent,
}

enum OtherOperation { clear, addDecimal, equals }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var operand1, operand2, result;
  String operator;
  bool isOperand1Completed;
  TextStyle _whiteTextStyle = TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold);

  void initState() {
    super.initState();
    initialiseValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      operand1 != null ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          operand1 is double
                              ? operand1.toStringAsFixed(2)
                              : operand1.toString(),
                          style: _whiteTextStyle,
                          textAlign: TextAlign.right,
                        ),
                      ) : Container(),
                      operator != null ? Text(
                        operator.toString(),
                        textAlign: TextAlign.right,
                        style: _whiteTextStyle,
                      ) : Container(),
                      operand2 != null ? Text(
                        operand2.toString(),
                        textAlign: TextAlign.right,
                        style: _whiteTextStyle,
                      ) : Container(),
                      result != null ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          result is double
                              ? result.toStringAsFixed(2)
                              : result.toString(),
                          textAlign: TextAlign.right,
                          style: _whiteTextStyle,
                        ),
                      ) : Container(),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button(
                  color: Color(0xffa5a5a5),
                  text: 'AC',
                  onPressed: (){_otherOperationAction(OtherOperation.clear);},
                ),
                Button(
                  color: Color(0xffa5a5a5),
                  text: plus_or_minus_sign,
                  onPressed: (){_unaryOperationAction(UnaryOperation.changeSign);},
                ),
                Button(
                  color: Color(0xffa5a5a5),
                  text: percent_sign,
                  onPressed: (){_unaryOperationAction(UnaryOperation.percent);},
                ),
                Button(
                  color: Colors.orange,
                  text: divide_sign,
                  onPressed: (){_binaryOperationAction(BinaryOperation.divide);},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button(
                    color: Color(0xff333333),
                    text: "7",
                    onPressed: (){_numberButtonAction("7");}),
                Button(
                    color: Color(0xff333333),
                    text: "8",
                    onPressed: (){_numberButtonAction("8");}),
                Button(
                    color: Color(0xff333333),
                    text: "9",
                    onPressed: (){_numberButtonAction("9");}),
                Button(
                  color: Colors.orange,
                  text: multiply_sign,
                  onPressed: (){_binaryOperationAction(BinaryOperation.multiply);},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button(
                    color: Color(0xff333333),
                    text: "4",
                    onPressed: (){_numberButtonAction("4");}),
                Button(
                    color: Color(0xff333333),
                    text: "5",
                    onPressed: (){_numberButtonAction("5");}),
                Button(
                    color: Color(0xff333333),
                    text: "6",
                    onPressed: (){_numberButtonAction("6");}),
                Button(
                  color: Colors.orange,
                  text: minus_sign,
                  onPressed: (){_binaryOperationAction(BinaryOperation.subtract);},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button(
                    color: Color(0xff333333),
                    text: "1",
                    onPressed: (){_numberButtonAction("1");}),
                Button(
                    color: Color(0xff333333),
                    text: "2",
                    onPressed: (){_numberButtonAction("2");}),
                Button(
                    color: Color(0xff333333),
                    text: "3",
                    onPressed: (){_numberButtonAction("3");}),
                Button(
                  color: Colors.orange,
                  text: add_sign,
                  onPressed: (){_binaryOperationAction(BinaryOperation.add);},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ZeroButton(onPressed: (){_zeroButtonAction();},),
                Button(
                  color: Color(0xff333333),
                  text: ".",
                  onPressed: (){_otherOperationAction(OtherOperation.addDecimal);},
                ),
                Button(
                  color: Colors.orange,
                  text: equal_sign,
                  onPressed: (){_otherOperationAction(OtherOperation.equals);},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void initialiseValues() {
    operand1 = null;
    operand2 = null;
    result = null;
    operator = null;
    isOperand1Completed = false;
  }

  void _findOutput() {
    if (operand1 == null || operand2 == null) return;
    var exp1 = double.parse(operand1.toString());
    var exp2 = double.parse(operand2.toString());
    switch (operator) {
      case add_sign:
        operand1 = null;
        operand2 = null;
        operator = null;
        result = exp1 + exp2;
        break;
      case minus_sign:
        operand1 = null;
        operand2 = null;
        operator = null;
        result = exp1 - exp2;
        break;
      case multiply_sign:
        operand1 = null;
        operand2 = null;
        operator = null;
        result = exp1 * exp2;
        break;
      case divide_sign:
        operand1 = null;
        operand2 = null;
        operator = null;
        result = exp1 / exp2;
        break;
      case percent_sign:
        operand1 = null;
        operand2 = null;
        operator = null;
        result = exp1 % exp2;
        break;
    }
    if (result.toString().endsWith(".0")) {
      result = int.parse(result.toString().replaceAll(".0", ""));
    }
  }

  void _numberButtonAction(String text) {
    if (result != null) initialiseValues();
    if (isOperand1Completed) {
      if (operand2 == null) {
        operand2 = text;
      } else {
        if (operand2.toString().length < 9) operand2 += text;
      }
    } else {
      if (operand1 == null) {
        operand1 = text;
      } else {
        if (operand1.toString().length < 9) operand1 += text;
      }
    }
    setState(() {});
  }


  void _zeroButtonAction() {
    if (result != null) initialiseValues();
    if (isOperand1Completed) {
      if (operand2 == null || operand1 == "0")
        operand2 = "0";
      else {
        if (operand2.toString().length < 9) operand2 += "0";
      }
    } else {
      if (operand1 == null || operand1 == "0") {
        operand1 = "0";
      } else {
        if (operand1.toString().length < 9) operand1 += "0";
      }
    }
    setState(() {});
  }

  void _binaryOperationAction(BinaryOperation operation) {
    switch (operation) {
      case BinaryOperation.add:
        if (operand2 != null) {
          if (result == null) _findOutput();
          operand1 = result;
          operand2 = null;
          result = null;
        }
        operator = add_sign;
        isOperand1Completed = true;
        break;
      case BinaryOperation.subtract:
        if (operand2 != null) {
          if (result == null) _findOutput();
          operand1 = result;
          operand2 = null;
          result = null;
        }
        operator = minus_sign;
        isOperand1Completed = true;
        break;
      case BinaryOperation.multiply:
        if (operand2 != null) {
          if (result == null) _findOutput();
          operand1 = result;
          operand2 = null;
          result = null;
        }
        operator = multiply_sign;
        isOperand1Completed = true;
        break;
      case BinaryOperation.divide:
        if (operand2 != null) {
          if (result == null) _findOutput();
          operand1 = result;
          operand2 = null;
          result = null;
        }
        operator = divide_sign;
        isOperand1Completed = true;
        break;
    }
    setState(() {});
  }

  void _unaryOperationAction(UnaryOperation operation) {
    switch (operation) {
      case UnaryOperation.changeSign:
        if (result != null)
          result = -result;
        else if (isOperand1Completed) {
          if (operand2 != null) {
            operand2 = (-int.parse(operand2)).toString();
          }
        } else {
          if (operand1 != null) {
            operand1 = (-int.parse(operand1)).toString();
          }
        }
        break;
      case UnaryOperation.percent:
        if (result != null)
          result = result / 100;
        else if (isOperand1Completed) {
          if (operand2 != null) {
            operand2 = (double.parse(operand2) / 100).toString();
          }
        } else {
          if (operand1 != null) {
            operand1 = (double.parse(operand1) / 100).toString();
          }
        }
        break;
    }
    setState(() {});
  }

  _otherOperationAction(OtherOperation operation) {
    switch (operation) {
      case OtherOperation.clear:
        initialiseValues();
        break;
      case OtherOperation.addDecimal:
        if (result != null) initialiseValues();
        if (isOperand1Completed) {
          if (!operand2.toString().contains(".")) {
            if (operand2 == null) {
              operand2 = ".";
            } else {
              operand2 += ".";
            }
          }
        } else {
          if (!operand1.toString().contains(".")) {
            if (operand1 == null) {
              operand1 = ".";
            } else {
              operand1 += ".";
            }
          }
        }
        break;
      case OtherOperation.equals:
        if (result == null) _findOutput();

        break;
    }
    setState(() {});
  }
}

class Button extends StatelessWidget{
  final text;
  final Function onPressed;
  final Color color;

  const Button({Key key, this.text, this.onPressed, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: RaisedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
        color: color,
        padding: const EdgeInsets.all(22.0),
        shape: CircleBorder(),
      ),
    );
  }
}

class ZeroButton extends StatelessWidget{
  final Function onPressed;

  const ZeroButton({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: RaisedButton(
        child: Text(
          '0',
          style: TextStyle(fontSize: 30.0, color: Colors.white),
        ),
        onPressed: onPressed,
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 85, right: 85),
        color: Color(0xff333333),
        shape: StadiumBorder(),
      ),
    );
  }
}
