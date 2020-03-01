import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './server.dart';

class ServerModel extends ChangeNotifier {
  ServerModel(this.prefs) {
    List<String> ss = prefs.getStringList('servers');
    if (ss != null) {
      ss.forEach((element) {
        _all.add(Server.fromJson(jsonDecode(element))); 
      });
    }
  }

  final SharedPreferences prefs;
  final List<Server> _all = [];
  List<Server> get all => _all;

  void storeData() {
    prefs.setStringList('servers', _all.map((e) => jsonEncode(e.toJson())).toList());
  }

  void add(Server server)  {
    _all.add(server);
    notifyListeners();
    storeData();
  }

  void remove(Server server) {
    _all.remove(server);
    notifyListeners();
    storeData();
  }

  void update(Server server, int index) {
    _all[index] = server;
    notifyListeners();
    storeData();
  }
}
