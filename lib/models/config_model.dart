import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ProxyState { closed, open }
enum ProxyMode { auto, global, manual }

class ConfigModel extends ChangeNotifier {
  ConfigModel(this.prefs) {
    int stateIndex = prefs.getInt('proxy_state');
    int modeIndex = prefs.getInt('proxy_mode');
    state = ProxyState.values[stateIndex == null ? 0 : stateIndex];
    mode = ProxyMode.values[modeIndex == null ? 0 : modeIndex];
    serverName = prefs.getString('server_name');
  }

  final SharedPreferences prefs;
  ProxyState state;
  ProxyMode mode;
  String serverName;

  void updateState(ProxyState state) {
    this.state = state;
    notifyListeners();
    prefs.setInt('proxy_state', state.index);
  }

  void updateMode(ProxyMode mode) {
    this.mode = mode;
    notifyListeners();
    prefs.setInt('proxy_mode', mode.index);
  }

  void updateServer(String name) {
    this.serverName = name;
    notifyListeners();
    prefs.setString('server_name', name);
  }
}
