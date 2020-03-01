import 'package:flutter/material.dart';

class DialogBuilder {
  static AlertDialog buildDeleteHintDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Hint'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Are you sure?'),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        FlatButton(
          child: Text('No'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
