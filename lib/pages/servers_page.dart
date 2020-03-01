import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandshrew/common/dialog_builder.dart';
import 'package:sandshrew/models/server.dart';
import 'package:sandshrew/models/server_model.dart';
import 'package:sandshrew/widgets/layout.dart';

class ServersPage extends StatefulWidget {
  ServersPage({Key key}) : super(key: key);

  @override
  _ServersPageState createState() => _ServersPageState();
}

class _ServersPageState extends State<ServersPage> {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    var servers = Provider.of<ServerModel>(context);
    var children = servers.all.asMap().entries.map<_ServerCard>(
      (entry) => _ServerCard(
        entry.value,
        () {},
        () { _onDelete(context, servers, entry.value); },
      )
    );

    var body = Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Servers',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Consumer<ServerModel>(
          builder: (context, servers, child) {
            return Wrap(
              children: children.toList(),
            );
          }
        )
      ],
    );

    return Layout(
      body: new Builder(builder: (BuildContext content) {
        _context = content;
        return body;
      }),
      floatingActionButton: new FloatingActionButton(
        onPressed: () { _addServer(servers); },
        tooltip: 'New Server',
        child: new Icon(Icons.add),
      ),
    );
  }

  void _addServer(ServerModel servers) {
    int count = servers.all.length + 1;
    var server = Server();
    server.name = 'Server $count';
    server.address = 'localhost';
    server.port = 443;
    servers.add(server);
  }

  void _onDelete(BuildContext context, ServerModel servers, Server srv) {
    showDialog(
      context: context,
      builder: DialogBuilder.buildDeleteHintDialog,
    ).then((sure) {
      if (sure) {
        servers.remove(srv);
        Scaffold.of(_context).showSnackBar(SnackBar(content: Text("Delete server(${srv.name}).")));
      }
    });
  }
}

class _ServerCard extends StatelessWidget {
  _ServerCard(
    this.server,
    this.onEdit,
    this.onDelete,
    {Key key}
  ) : super(key: key);

  final Server server;
  final void Function() onEdit;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(server.name),
              subtitle: Text("${server.address}:${server.port}"),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Edit'),
                  onPressed: onEdit,
                ),
                FlatButton(
                  child: Text('Delete'),
                  onPressed: onDelete,
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
