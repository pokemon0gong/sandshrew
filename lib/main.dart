import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandshrew',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sandshrew'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const PROXIES_WIDGET = 0;
  static const SETTINGS_WIDGET = 1;

  int _currentWidget = PROXIES_WIDGET;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: <Widget>[
          Container(
            width: 200,
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text('Proxies'),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    setState(() {
                      _currentWidget = _MyHomePageState.PROXIES_WIDGET;
                    });
                  },
                ),
                ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    setState(() {
                      _currentWidget = _MyHomePageState.SETTINGS_WIDGET;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            child: _currentWidget == PROXIES_WIDGET ? Text('Proxies Widget') : Text('Settings Widget'),
          ),
        ],
      ),
    );
  }
}
