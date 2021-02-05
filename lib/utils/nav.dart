import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page){
  //navegar para a proxima tela
  return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
//      return HelloPage1();
    return page;
  }));
}