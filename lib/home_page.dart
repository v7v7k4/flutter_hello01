import 'package:flutter/material.dart';
import 'package:flutterhello01/pages/hello_listview.dart';
import 'package:flutterhello01/pages/hello_page1.dart';
import 'package:flutterhello01/pages/hello_page2.dart';
import 'package:flutterhello01/pages/hello_page3.dart';
import 'package:flutterhello01/utils/nav.dart';
import 'package:flutterhello01/widgets/blue_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dogs"),
          centerTitle: true,
        ),
        body: _body(context));
  }

  _body(BuildContext context) {
    //Pega a altura e a largura da sua tela
//    Size size = MediaQuery.of(context).size;
    return Container(
//      padding: const  EdgeInsets.all(8),
//      height: double.infinity,
//    height: size.height,
//      color: Colors.yellow,
//      child: SizedBox.expand(
//          child: _img()
//      )
        child: Column(
//          mainAxisSize: MainAxisSize.min ,
      mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[_text(), _pageView(), _buttons()],
    ));
  }

  Container _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png")
        ],
      ),
    );
  }

  _buttons() {
    return Builder(
      builder: (context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("ListView",
                    onPressed: () =>
                        _onClickNavigator(context, HelloListView())),
                BlueButton("Page2",
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton("Page3",
                    onPressed: () => _onClickNavigator(context, HelloPage3()))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("Snack", onPressed: () => _onClickSnack(context)),
                BlueButton("Dialog", onPressed: _onClickDialog),
                BlueButton("Toast", onPressed: _onClickToast)
              ],
            )
          ],
        );
      },
    );
  }

  _text() {
    return Text("Dogs",
        style: TextStyle(
            fontSize: 30,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.overline,
            decorationColor: Colors.red,
            decorationStyle: TextDecorationStyle.double));
  }

  _img(String img) {
    return Container(
//      margin: EdgeInsets.all(20),
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print(">> $s");
  }

  _onClickSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Olá Snackbar"),
      action: SnackBarAction(
        textColor: Colors.yellow,
        label: 'OK',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Flutter é muito legal"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                    print("OK!!");
                  },
                )
              ],
            ),
          );
        });
  }

  _onClickToast() {}
}
