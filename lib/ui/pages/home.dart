//import 'package:helloeyesight/ui/pages/lista.dart';/
///import 'package:helloeyesight/reusable_widgets/reusable_widget.dart';
//import 'package:helloeyesight/ui/pages/_camara.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:helloeyesight/ui/pages/_recordatorios.dart';
//import 'package:helloeyesight/ui/pages/_scannerQrCb.dart';
import 'package:flutter/material.dart';
import 'package:helloeyesight/domain/modelo/modelo.dart';
import 'package:helloeyesight/ui/pages/login.dart';
import '../../utils/color_utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.exit_to_app_rounded, color: Colors.white70),
            onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => SignInScreen()),
                ModalRoute.withName('/'))),
        title: Text("HelloeyeSight"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("F1F1F1"),
          hexStringToColor("EDEDED"),
          hexStringToColor("E9E9E9"),
          hexStringToColor("E5E5E5"),
          hexStringToColor("E1E1E1"),
          hexStringToColor("DDDDDD"),
          hexStringToColor("D9D9D9"),
          hexStringToColor("D5D5D5"),
          hexStringToColor("D1D1D1")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: GridView.builder(
          itemCount: Menu.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(10),
              height: 280.0,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Color(0xD1D1D1)
                  //color: Colors.white,
                  ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Menu[index].nameRoute));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "lib/assets/" + Menu[index].nameImage,
                      width: 85,
                    ),
                    Text(
                      Menu[index].nameCategria,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                      textScaleFactor: 1,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


/*
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Helloeyesight'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: Text(
                                'Camara',
                                textAlign: TextAlign.center,
                              ),
                            )),
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.green,
                        ),
                        onPressed: () => {
                          // para lanzar a otra ventana
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Camara())),
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: Text(
                                
                                'Recordatorio',
                                textAlign: TextAlign.center,
                              ),
                            )),
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.green,
                        ),
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Recordatorio2())),
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: Text(
                                'Scanner',
                                textAlign: TextAlign.center,
                              ),
                            )),
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.green,
                        ),
                        onPressed: () => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Scanner())),
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: Text(
                                'OPCION',
                                textAlign: TextAlign.center,
                              ),
                            )),
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.green,
                        ),
                        onPressed: () => {
                          // para lanzar a otra ventana
                          print("BOTON: ")
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: Text(
                                'OPCION',
                                textAlign: TextAlign.center,
                              ),
                            )),
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.green,
                        ),
                        onPressed: () => {
                          // para lanzar a otra ventana
                          print("BOTON: ")
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: Text(
                                'OPCION',
                                textAlign: TextAlign.center,
                              ),
                            )),
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.green,
                        ),
                        onPressed: () => {
                          // para lanzar a otra ventana
                          print("BOTON: ")
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: Text(
                                'OPCION',
                                textAlign: TextAlign.center,
                              ),
                            )),
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.green,
                        ),
                        onPressed: () => {
                          // para lanzar a otra ventana
                          print("BOTON: ")
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: Text(
                                'OPCION',
                                textAlign: TextAlign.center,
                              ),
                            )),
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.green,
                        ),
                        onPressed: () => {
                          // para lanzar a otra ventana
                          print("BOTON: ")
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/