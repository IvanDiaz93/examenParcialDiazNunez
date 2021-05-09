import 'package:flutter/material.dart';
import 'package:parcial_diaz_nunez/fondo.dart';
import 'package:parcial_diaz_nunez/form.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examen Parcial',
      home: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Fondo(),
          Formulario()
        ],
      )
    );
  }
}