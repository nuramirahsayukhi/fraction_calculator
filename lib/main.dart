import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class Drawhorizontalline extends CustomPainter {
  Paint _paint;
  bool reverse;

  Drawhorizontalline(this.reverse) {
    _paint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (!reverse) {
      canvas.drawLine(Offset(10.0, 0.0), Offset(90.0, 0.0), _paint);
    } else {
      canvas.drawLine(Offset(-90.0, 0.0), Offset(-10.0, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _MyAppState extends State<MyApp> {
  TextEditingController num1NumeratorController = new TextEditingController();
  TextEditingController num1DenominatorController = new TextEditingController();
  TextEditingController num2NumeratorController = new TextEditingController();
  TextEditingController num2DenominatorController = new TextEditingController();

  double num1Numerator = 0.0;
  double num1Denominator = 0.0;
  double num2Numerator = 0.0;
  double num2Denominator = 0.0;
  double result = 0.0;
  @override
  Widget build(BuildContext context) {
    Widget upperBox = new Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(60, 80, 60, 0),
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                style: TextStyle(color: Colors.black),
                controller: num1NumeratorController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.yellow[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(60, 80, 60, 0),
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                style: TextStyle(color: Colors.black),
                controller: num2NumeratorController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.yellow[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Widget lowerBox = new Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(60, 20, 60, 50),
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                style: TextStyle(color: Colors.black),
                controller: num1DenominatorController,
                decoration: InputDecoration(
                  
                  filled: true,
                  fillColor: Colors.yellow[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(60, 20, 60, 50),
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                style: TextStyle(color: Colors.black),
                controller: num2DenominatorController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.yellow[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Widget buttons = new Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 50),
            child: RaisedButton(
              color: Colors.lightGreen,
              child: Text('+', style: TextStyle(fontSize: 25.0),),
              onPressed: add,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 50),
            child: RaisedButton(
              color: Colors.lightGreen,
              child: Text('-', style: TextStyle(fontSize: 25.0),),
              onPressed: minus,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 50),
            child: RaisedButton(
              color: Colors.lightGreen,
              child: Text('x', style: TextStyle(fontSize: 25.0),),
              onPressed: multiply,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 50),
            child: RaisedButton(
              color: Colors.lightGreen,
              child: Text('÷', style: TextStyle(fontSize: 25.0),),
              onPressed: divide,
            ),
          ),
        ],
      ),
    );

    Widget line = new Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(53, 30, 50, 0),
            child: CustomPaint(
              painter: Drawhorizontalline(false),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(155, 30, 40, 0),
            child: CustomPaint(painter: Drawhorizontalline(false)),
          ),
        ],
      ),
    );

    return MaterialApp(
      title: 'Material App',
      theme: ThemeData.dark(),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text('Fraction Calculator',style: TextStyle( fontSize: 25.0),),
        ),
        body: Column(
          children: <Widget>[
            upperBox,
            line,
            lowerBox,
            buttons,
            Text(
              "Result: $result",
              style: TextStyle(fontSize: 20.0),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: clear,
                child: Text('Clear', style: TextStyle(fontSize: 30.0),),
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void add() {
    setState(() {
      num1Numerator = double.parse(num1NumeratorController.text);
      num1Denominator = double.parse(num1DenominatorController.text);
      num2Numerator = double.parse(num2NumeratorController.text);
      num2Denominator = double.parse(num2DenominatorController.text);
      double a = num1Numerator * num2Denominator;
      double b = num2Numerator * num1Denominator;
      double c = num1Denominator * num2Denominator;
      result = (a + b) / c;
    });
  }

  void minus() {
    setState(() {
      num1Numerator = double.parse(num1NumeratorController.text);
      num1Denominator = double.parse(num1DenominatorController.text);
      num2Numerator = double.parse(num2NumeratorController.text);
      num2Denominator = double.parse(num2DenominatorController.text);
      double a = num1Numerator * num2Denominator;
      double b = num2Numerator * num1Denominator;
      double c = num1Denominator * num2Denominator;
      result = (a - b) / c;
    });
  }

  void multiply() {
    setState(() {
      num1Numerator = double.parse(num1NumeratorController.text);
      num1Denominator = double.parse(num1DenominatorController.text);
      num2Numerator = double.parse(num2NumeratorController.text);
      num2Denominator = double.parse(num2DenominatorController.text);
      double a = num1Numerator * num2Numerator;
      double b = num1Denominator * num2Denominator;

      result = a / b;
    });
  }

  void divide() {
    setState(() {
      num1Numerator = double.parse(num1NumeratorController.text);
      num1Denominator = double.parse(num1DenominatorController.text);
      num2Numerator = double.parse(num2NumeratorController.text);
      num2Denominator = double.parse(num2DenominatorController.text);
      double a = num1Numerator * num2Denominator;
      double b = num1Denominator * num2Numerator;

      result = a / b;
    });
  }

  void clear() {
    setState(() {
      num1NumeratorController.clear();
      num1DenominatorController.clear();
      num2NumeratorController.clear();
      num2DenominatorController.clear();
      result = 0.0;
    });
  }
}
