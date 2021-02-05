import 'package:flutter/material.dart';

class Dog {
  String nome;
  String foto;

  Dog.name(this.nome, this.foto);

}

class HelloListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView")
      ),
      body: _body()
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog.name("Jack Russel", "assets/images/dog1.png"),
      Dog.name("Labrador", "assets/images/dog2.png"),
      Dog.name("Pug", "assets/images/dog3.png"),
      Dog.name("Rottweiler", "assets/images/dog4.png"),
      Dog.name("Pastor", "assets/images/dog5.png")
    ];
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dogs.length,
        //itemExtent: 300,
        itemBuilder: (BuildContext context, int index) {
          Dog dog = dogs[index];
      //return _img(dog.foto);
      return Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _img(dog.foto),
          Container(
            alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black45
                ),
                  child: Text(
                    dog.nome, style: TextStyle(fontSize: 26, color: Colors.white),
                  )
              )
          ) //colocar o nome por cima da foto
        ]
      ); //adiciona um widget em cima do outro
    });
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


}

