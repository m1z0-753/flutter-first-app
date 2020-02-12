import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// これで使える状態にはなった
import 'package:nem2_sdk_dart/nem2_sdk_dart.dart';

// void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: TextTheme(
          display1: TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold)
        ),
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // コンストラクター
  MyHomePage({Key key, String title}) : this.title = title, super(key: key);

  // 受け取った文字列
  final String title;

  // 継承
  @override
  State<StatefulWidget> createState () => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 状態の保持と更新
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter % 3 == 0) {
        _neverSatisfied(context, '$_counter');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // pageの中身
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ボタンを押した回数:',
            ),
            Text(
              '$_counter' + '回',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        // onPressed: () => _incrementCounter(),
        // onPressed: () { _incrementCounter(); },
        tooltip: 'Increment',
        child: new Icon(FontAwesomeIcons.google),
      ),
    );
  }
}

Future<void> _neverSatisfied(context, count) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('アホになれ！'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('ボタンを押した回数が'),
              Text(count + '回になりました'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('なった'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}