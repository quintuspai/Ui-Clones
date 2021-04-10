import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List a = ["0","5","10","12","14","15","18","20","25","30","50"];
  int _index = 0;
  String flag;
  int percent;
  double _currentSliderValue = 0;
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        bottom: true,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:75.0,right:75.0,bottom:45.0),
                  child: TextField(
                    controller: myController,
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "enter your bill amount",
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: SizedBox(
                    height: 25.0, // card height
                    child: PageView.builder(
                      itemCount: 10,
                      controller: PageController(viewportFraction: 0.2),
                      onPageChanged: (int index) => setState(() => _index = index),
                      itemBuilder: (_, i) {
                        return Transform.scale(
                          scale: i == _index ? 1 : 0.9,
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                flag = a[i];
                                percent = int.parse(a[i]);
                              });
                            },
                            child: Container(
                              color: Colors.black,
                              child: Container(
                                  height:15.0,
                                decoration: flag == a[i]? BoxDecoration(
                                    ):BoxDecoration(color: Colors.black,),
                                child: Center(
                                  child: Text(
                                    "${a[i]+"%"}",
                                    style: TextStyle(fontSize: 16,color: flag == a[i] ? Colors.white:Colors.grey.shade800),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
            padding: const EdgeInsets.only(top:45.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Number of People: ",style: TextStyle(color:Colors.grey,fontSize:16),),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.white24,
                      activeTickMarkColor: Colors.transparent,
                      inactiveTickMarkColor: Colors.transparent,
                      thumbColor: Colors.white,
                    ),
                    child: Slider(
                      value: _currentSliderValue,
                      min: 0,
                      max: 20,
                      divisions: 20,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                  ),
              ],
            ),
          ),
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: ElevatedButton(
                      onPressed: (){
                       var temp = _calculateTip(double.parse(myController.text), _currentSliderValue, percent);
                       _showMyDialog(temp[0], temp[1], temp[2]);
                       },
                    child: Text("Calculate",style: TextStyle(color: Colors.grey)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade900,
                      elevation:0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List _calculateTip(double billAmount, double noOfPeople, int percent) {
    var _getTipAmount = billAmount * percent / 100;
    var _getTotalAmount = billAmount + _getTipAmount;
    var _paymentPerPerson = _getTotalAmount / noOfPeople;
    return [_getTotalAmount, _paymentPerPerson, _getTipAmount];
  }

  Future<void> _showMyDialog(double total, double perPerson, double tipAmount) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Summary"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Tip Amount : ₹ ${dp(tipAmount)}'),
                Text('Total bill including tip: ₹ ${dp(total)}'),
                Text('Each person owes: ₹ ${dp(perPerson)}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  double dp(double val){
    double mod = pow(10.0, 2);
    return ((val * mod).round().toDouble() / mod);
  }
}

