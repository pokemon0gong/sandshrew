import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sandshrew/models/server.dart';

class ServerForm extends StatefulWidget {
  ServerForm({
    Key key,
    @required this.formKey,
    @required this.server,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final Server server;

  @override
  State<StatefulWidget> createState() => _ServerFromState();
}

class _ServerFromState extends State<ServerForm> {
  Server _server;
  
  @override
  void initState() {
    super.initState();
    _server = widget.server;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
            initialValue: _server.name,
            autofocus: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter server\'s name';
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                _server.name = value;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Address'),
            initialValue: _server.address,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter server\'s address';
              }
              return null;
            },
            onSaved: (vaule) {
              setState(() {
                _server.address = vaule;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Port'),
            initialValue: _server.port.toString(),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly,
            ],
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter server\'s port';
              } else {
                final int port = int.tryParse(value);
                if(port < 1 && port > 65535) {
                  return 'Port is in the range from 1 to 65535';
                }
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                _server.port = int.tryParse(value);
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
            initialValue: _server.password,
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter server\'s password';
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                _server.password = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
