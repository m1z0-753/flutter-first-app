import 'package:flutter/material.dart';

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
        _neverSatisfied(context, _counter);
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
        child: Icon(Icons.add),
      ),
    );
  }
}

Future<void> _neverSatisfied(context, _counter) async {
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
              Text('$_counter' + '回になりました'),
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
