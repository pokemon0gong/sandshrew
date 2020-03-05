import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sandshrew/models/server.dart';
import 'package:sandshrew/models/server_model.dart';
import './pages/proxy_page.dart';
import './pages/servers_page.dart';

SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  return runApp(SandshrewApp());
}

List<Server> loadServers(SharedPreferences prefs) {
  List<String> ss = prefs.getStringList('servers');
  if (ss != null) {
    return ss.map((element) => Server.fromJson(jsonDecode(element)));
  }
  return [];
}

class SandshrewApp extends StatelessWidget {
  SandshrewApp(
    {Key key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ServerModel(prefs)),
      ],
      child: MaterialApp(
        title: 'Sandshrew',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/proxy',
        routes: {
          '/proxy': (context) => ProxyPage(),
          '/servers': (context) => ServersPage(),
        },
      ),
    );
  }
}
