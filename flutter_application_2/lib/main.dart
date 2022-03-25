import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart'; //runApp fonksiyonu yazıldığında satır oto. eklenir.
//cupertino : tasarımın ios görünümünde  olmasını sağlar.
//material : tasarımın android görünümünde olmasını sağlar.

void main(List<String> args) {
  String text1 = "Hello Guys!";
  runApp(MaterialApp(home: MyApp()
      /*Scaffold(
      appBar: AppBar(
        title: Text(text1.toString() + "      :)"),
        backgroundColor: Colors.pink.shade300,
        foregroundColor: Colors.yellow,
      ),
      body: Center(
        //child: Text("How are you?"),
        child: FloatingActionButton(
          onPressed: () {
            var alert = AlertDialog(
              title: Text("Sınav Sonucu"),
              content: Text("Geçti"),
            );

          //context mobil uygulamaya ait bilgiyi tutar.
            showDialog(context: context, builder: (BuildContext context)=>alert)

          },
          child: Text("Sonucu Gör"),
        ),
      ),
    ),*/
      ));
}

//Kendi widget ımızı oluşturduk (StatelessWidget widget ından miras alarak)
class MyApp extends StatelessWidget {
  String text1 = "Hello Guys!";
  int not = 35;
  String mesaj = "";
  var ogrenciler = ["Engin Demir", "Ela Kızıl", "Gamze Bilgin", "Zeynep Acar"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text1.toString() + "      :)"),
        backgroundColor: Colors.pink.shade300,
        foregroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Expanded(
              //size flex gibi ekran görünüm hataları alınırsa kullanılır. Expanded sayesinde widget lar tüm cihazlarda doğru görünmesini sağlar.
              child: ListView.builder(
                  //dinamik liste çekmek için kullanılır
                  itemCount: ogrenciler.length,
                  itemBuilder: (BuildContext context, int index) {
                    //Listview in builder ı itemCount kadar itemBuilder içerisindeki kodu çalıştırır.
                    return Text(ogrenciler[index]);
                  })

              /*ListView(
              children: <Widget>[
                Text("Engin Demir"),
                Text("Ela Kızıl"),
                Text("Gamze Telli"),
              ],
            ),*/
              ),
          Center(
            //child: Text("How are you?"),
            child: RaisedButton(
              onPressed: () {
                mesaj = sinavHesapla(not);
                mesajGoster(context, "Sınav Sonuç", mesaj);
              },
              child: Text("Sonucu Gör"),
            ),
          ),
        ],
      ),
    );
  }

  String sinavHesapla(int not) {
    String mesaj = "";

    if (not >= 45) {
      mesaj = "Geçti :)";
    } else {
      mesaj = "Kaldı :(";
    }
    return mesaj;
  }

  void mesajGoster(BuildContext context, String pageTitle, String mesaj) {
    var alert = AlertDialog(
      title: Text(pageTitle),
      content: Text(mesaj),
    );

//context mobil uygulamaya ait bilgiyi tutar.
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
