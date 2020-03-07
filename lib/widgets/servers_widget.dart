import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandshrew/common/dialog_builder.dart';
import 'package:sandshrew/widgets/server_from.dart';
import 'package:sandshrew/models/server.dart';
import 'package:sandshrew/models/server_model.dart';

class ServersWidget extends StatefulWidget {
  ServersWidget({Key key}) : super(key: key);

  @override
  _ServersWidgetState createState() => _ServersWidgetState();
}

class _ServersWidgetState extends State<ServersWidget> {

  @override
  Widget build(BuildContext context) {
    var servers = Provider.of<ServerModel>(context);
    var children = servers.all.asMap().entries.map<_ServerCard>(
      (entry) => _ServerCard(
        entry.value,
        () { _editServer(context, servers, entry.key, entry.value); },
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

    return Scaffold(
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () { _newServer(context, servers); },
        tooltip: 'New Server',
        child: Icon(Icons.add),
      ),
    );
  }

  SimpleDialog Function(BuildContext) _buildServerFormDialog(
    BuildContext context,
    String title,
    Server server,
    void Function() onSubmit, 
  ) {
    final formKey = GlobalKey<FormState>();
    return (BuildContext context) {
      return SimpleDialog(
        contentPadding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
        title: Text(title),
        children: <Widget>[
          ServerForm(
            formKey: formKey,
            server: server,
          ),
          Container(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  _hiddenServerFormDialog();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  final form = formKey.currentState;
                  if (form.validate()) {
                    form.save();
                    onSubmit();
                    _hiddenServerFormDialog();
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ],
      );
    };
  }

  void _hiddenServerFormDialog() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  void _newServer(BuildContext context, ServerModel servers) {
    var server = Server();

    void _onSave() {
      servers.add(server);
    }

    int count = servers.all.length + 1;
    server.name = 'Server $count';
    server.address = 'localhost';
    server.port = 443;
    showDialog(
      context: context,
      builder: _buildServerFormDialog(
        context,
        'New Server',
        server,
        _onSave,
      ),
    );
  }

  void _editServer(BuildContext context, ServerModel servers, num index, Server server) {

    void _onUpdate() {
      servers.update(server, index);
    }

    showDialog(
      context: context,
      builder: _buildServerFormDialog(
        context,
        'Edit Server',
        server,
        _onUpdate,
      ),
    );
  }

  void _onDelete(BuildContext context, ServerModel servers, Server srv) {
    showDialog(
      context: context,
      builder: DialogBuilder.buildDeleteHintDialog,
    ).then((sure) {
      if (sure) {
        servers.remove(srv);
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text("Delete server(${srv.name}).")),
        );
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
            ),
            Container(
              child: Text('${server.address}:${server.port}'),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
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
