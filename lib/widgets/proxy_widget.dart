import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandshrew/models/config_model.dart';
import 'package:sandshrew/models/server_model.dart';

class MyProxyWidget extends StatelessWidget {
  MyProxyWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('State'),
            Consumer<ConfigModel>(
              builder: (context, config, child) {
                return Switch(
                  value: config.state == ProxyState.open, 
                  onChanged: (bool value) {
                    if (value) {
                      config.updateState(ProxyState.open);
                    } else {
                      config.updateState(ProxyState.closed);
                    }
                  },
                );
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Mode'),
            Consumer<ConfigModel>(
              builder: (context, config, child) {
                return ToggleButtons(
                  isSelected: <bool>[
                    config.mode == ProxyMode.auto,
                    config.mode == ProxyMode.global,
                    config.mode == ProxyMode.manual,
                  ],
                  onPressed: (int index) {
                    config.updateMode(ProxyMode.values[index]);
                  },
                  children: <Widget>[
                    Tooltip(message: 'Auto Model', child: Icon(Icons.autorenew)),
                    Tooltip(message: 'Global Model', child: Icon(Icons.golf_course)),
                    Tooltip(message: 'Manual Model', child: Icon(Icons.hd)),
                  ],
                );
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Server'),
            Consumer2<ServerModel, ConfigModel>(
              builder: (context, servers, config, child) {
                final children = servers.all.map<DropdownMenuItem<String>>((s) {
                  return DropdownMenuItem<String>(value: s.name, child: Text(s.name),);
                }).toList();
                return DropdownButton(
                  value: config.serverName,
                  items: children,
                  onChanged: (String value) {
                    config.updateServer(value);
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
