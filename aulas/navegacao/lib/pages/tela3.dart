import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tela3 extends StatefulWidget{
  String? name;

  Tela3();

  Tela3.name(this.name);

  @override
  State<Tela3> createState() => _Tela3State();

}

class _Tela3State extends State<Tela3>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
          appBar: AppBar(title: Text("Tela 3"),
          backgroundColor: Colors.green),
          body: Center(
            child: Container(
              child: Column(
                children: [
                  Text(widget.name!, style: TextStyle(fontSize: 20),),

                  ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                  }, 
                  child: Text("Voltar"))
                ],
              ),
            ),
          ),
        );    }
}