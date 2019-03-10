import 'package:flutter/material.dart';


class AlertDialoge extends StatefulWidget {
  @override
  _AlertDialogeState createState() => _AlertDialogeState();
}

class _AlertDialogeState extends State<AlertDialoge> {
  TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        height: 300.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Enter admin password to access"),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: password,
                obscureText: true,
                textAlign: TextAlign.left,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 50.0)),
            FlatButton(
              onPressed: () {
                if (password.text == "admin") {
                  Navigator.pushReplacementNamed(context, '/adminpost');
                } else {
                  
                  Navigator.pop(context);
                }
              },
              child: Text("Sign in"),
            ),
          ],
        ),
      ),
    );
  }
}
