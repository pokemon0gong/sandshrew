import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandshrew/models/server_model.dart';
import 'package:sandshrew/widgets/layout.dart';

class ProxyPage extends StatefulWidget {
  ProxyPage({Key key}) : super(key: key);

  @override
  _ProxyPageState createState() => _ProxyPageState();
}

class _ProxyPageState extends State<ProxyPage> {
  BuildContext _context;
  final proxyModes = [false, false, false];
  bool isOn = false;
  num serverIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: new Builder(builder: (BuildContext content) {
        _context = content;
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Status'),
                Switch(
                  value: isOn, 
                  onChanged: (bool value) {
                    setState(() {
                      isOn = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Mode'),
                ToggleButtons(
                  isSelected: proxyModes,
                  onPressed: (int index) {
                    setState(() {
                      for (int buttonIndex = 0; buttonIndex < proxyModes.length; buttonIndex++) {
                        if (buttonIndex == index) {
                          proxyModes[buttonIndex] = true;
                        } else {
                          proxyModes[buttonIndex] = false;
                        }
                      }
                    });
                  },
                  children: <Widget>[
                    Tooltip(message: 'Auto Model', child: Icon(Icons.autorenew)),
                    Tooltip(message: 'Global Model', child: Icon(Icons.golf_course)),
                    Tooltip(message: 'Manual Model', child: Icon(Icons.hd)),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Server'),
                Consumer<ServerModel>(
                  builder: (context, servers, child) {
                    final children = servers.all.asMap().entries.map<DropdownMenuItem<num>>((e) {
                      return DropdownMenuItem<num>(value: e.key, child: Text(e.value.name),);
                    }).toList();
                    return DropdownButton(
                      value: serverIndex,
                      items: children,
                      onChanged: (num value) {
                        setState(() {
                          serverIndex = value;
                        });
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
