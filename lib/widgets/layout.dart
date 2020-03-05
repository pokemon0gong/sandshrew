import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  Layout({
    Key key,
    this.body,
    this.floatingActionButton,
  }) : super(key: key);

  static const PROXY_PATH = '/proxy';
  static const SERVERS_PATH = '/servers';

  final Widget body;
  final FloatingActionButton floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: _buildAppBar(),
      body: Row(
        children: <Widget>[
          _buildMenu(context),
          _buildContent(),
        ],
      ),
      floatingActionButton: floatingActionButton,
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

  Widget _buildMenu(BuildContext context) {
    return Container(
      width: 200,
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Proxy'),
            leading: Icon(Icons.vpn_lock),
            onTap: _isActive(context, PROXY_PATH) ? () {} : () => Navigator.pushNamed(context, PROXY_PATH),
            selected: _isActive(context, PROXY_PATH),
          ),
          ListTile(
            title: Text('Servers'),
            leading: Icon(Icons.storage),
            onTap: _isActive(context, SERVERS_PATH) ? () {} : () => Navigator.pushNamed(context, SERVERS_PATH),
            selected: _isActive(context, SERVERS_PATH),
          ),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Expanded(child: body);
  }

  bool _isActive(context, name) {
    return ModalRoute.of(context).settings.name == name;
  }
}
