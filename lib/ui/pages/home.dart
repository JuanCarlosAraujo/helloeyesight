//import 'package:helloeyesight/ui/pages/lista.dart';
import 'package:flutter/material.dart';
import 'package:helloeyesight/ui/pages/_faceRecognition.dart';
import 'package:camera/camera.dart';
import 'package:helloeyesight/domain/modelo/productBarCode.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloeyesight/ui/pages/_recordatorios.dart';
import 'package:helloeyesight/ui/pages/_scannerQrCb.dart';

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
                        onPressed: () async {
                          await availableCameras().then(
                            (value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FaceRecognition(
                                  cameras: value,
                                ),
                              ),
                            ),
                          );
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
                                  builder: (_) => const Recordatorio())),
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
                                'Prueba',
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
}
