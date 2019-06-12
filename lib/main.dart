import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'styles/colors.dart';

ThemeData _shedAppThemeData() {
  final base = ThemeData.light();

  return base.copyWith(
    brightness: Brightness.light,
    accentColor: shedAppYellow900,
    primaryColor: shedAppBlue400,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: shedAppBlue100,
      textTheme: ButtonTextTheme.normal,
    ),
    scaffoldBackgroundColor: shedAppBlue300,
    cardColor: shedAppBlue100,
    textSelectionColor: shedAppYellow900,
    errorColor: shedAppErrorRed,
    textTheme: base.textTheme.copyWith(
      headline: TextStyle(
        fontFamily: "Octin",
        fontSize: 35.0,
        // color: shedAppYellow900,
      ),
      body1: TextStyle(
        fontFamily: "FiraRegular",
        fontSize: 18.0,
        // color: Colors.white,
      ),
      caption: TextStyle(
        fontFamily: "FiraLight",
        fontSize: 14.0,
        // color: Colors.white,
      ),
    ).apply(
      displayColor: shedAppYellow900,
      bodyColor: shedAppYellow900,
    ),
    primaryIconTheme: base.iconTheme.copyWith(
      color: shedAppYellow900,
    ),
    // inputDecorationTheme: InputDecorationTheme(border:)
  );
}

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shed App',
      theme: _shedAppThemeData(),
      home: MyHomePage(title: 'Shed'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headline,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times',
              textAlign: TextAlign.center,
            ),
            Text(
              '$_counter',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
