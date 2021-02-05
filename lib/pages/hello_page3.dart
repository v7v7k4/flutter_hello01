
import 'package:flutter/material.dart';
import 'package:flutterhello01/widgets/blue_button.dart';

class HelloPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 3"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: BlueButton( "Voltar",
          onPressed: () => Navigator.pop(context, "Hello Page 3"),
      )
    );
  }
}
