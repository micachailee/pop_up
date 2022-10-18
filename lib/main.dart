import 'pop_up.dart';
import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'enum_type.dart';
import 'pop_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  PopUpCardtype last_touched = PopUpCardtype.correct;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _save() {
    showDialog(
        context: context,
        builder: (context) {
          return PopUp(
              state: widget.last_touched,
            onClose: (){
                print('chau');
            },
            onAccept: (){
                print('ok');
            },
          );
          //return PopUpCard();
        });
  }

  @override
  Widget build(BuildContext context) {
    Touch(PopUpCardtype a) {
      widget.last_touched = a;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          Row(children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  Touch(PopUpCardtype.incorrect);
                });
              },
              backgroundColor: Colors.red,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  Touch(PopUpCardtype.correct);
                });
              },
              backgroundColor: Colors.green,
            ),
          ]),
          /* CustomButton(
            text: "Aceptar",
          ),*/

          MaterialButton(
            onPressed: _save,
            padding: const EdgeInsets.all(12),
            color: Colors.blueAccent,
            child: Text("Guardar"),
          ),
        ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  onAccept(){
    print('aceptado');
  }
  onClose(){
    print('cerrado');
  }
}

//commint de prueba
