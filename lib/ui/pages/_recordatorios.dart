import 'package:helloeyesight/ui/pages/login.dart';
import 'package:flutter/material.dart';

class Recordatorio extends StatefulWidget {
  const Recordatorio({super.key});

  @override
  State<Recordatorio> createState() => _Recordatorio();
}

class _Recordatorio extends State<Recordatorio> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ruta de Recordatorio"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Atras!'),
        ),
      ),
    );
  }
}
