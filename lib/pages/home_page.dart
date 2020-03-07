import 'package:flutter/material.dart';
import 'package:sandshrew/widgets/proxy_widget.dart';
import 'package:sandshrew/widgets/servers_widget.dart';

enum HomeWidgets { proxy, servers }

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeWidgets widgetIndex = HomeWidgets.proxy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Row(
        children: <Widget>[
          _buildMenu(context),
          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    switch(widgetIndex) {
      case HomeWidgets.servers:
        return ServersWidget();
      default:
        return MyProxyWidget();
    }
  }

  Widget _buildMenu(BuildContext context) {
    return Container(
      width: 200,
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Proxy'),
            leading: Icon(Icons.vpn_lock),
            onTap: () {
              setState(() {
                widgetIndex = HomeWidgets.proxy;
              });
            },
            selected: widgetIndex == HomeWidgets.proxy,
          ),
          ListTile(
            title: Text('Servers'),
            leading: Icon(Icons.storage),
            onTap: () {
              setState(() {
                widgetIndex = HomeWidgets.servers;
              });
            },
            selected: widgetIndex == HomeWidgets.servers,
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: ListTile(
        leading: CircleAvatar(
          child: ClipRRect(
            child: Image.asset('images/logo.png'),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        title: Text('Sandshrew')
      ),
    );
  }
}
