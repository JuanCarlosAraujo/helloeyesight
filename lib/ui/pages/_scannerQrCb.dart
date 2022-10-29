import 'package:flutter/material.dart';
import 'package:helloeyesight/domain/modelo/productBarCode.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:convert' as convert;

FlutterTts flutterTts = FlutterTts();
ProviderMenu lecturaCodigo = ProviderMenu();
var codigo = "";
var nombreProducto = null;
var precioProducto = null;

class Scanner extends StatefulWidget {
  const Scanner({super.key});

  @override
  State<Scanner> createState() => _Scanner();
}

class _Scanner extends State<Scanner> {
  static const customSwatch = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customSwatch,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MobileScannerController cameraController = MobileScannerController();
  bool _screenOpened = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobile Scanner"),
        actions: [
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                switch (state as TorchState) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.grey);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.cameraFacingState,
              builder: (context, state, child) {
                switch (state as CameraFacing) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_front);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_rear);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body: MobileScanner(
        allowDuplicates: true,
        controller: cameraController,
        onDetect: _foundBarcode,
      ),
    );
  }

  Future<void> _foundBarcode(
      Barcode barcode, MobileScannerArguments? args) async {
    /// open screen
    if (!_screenOpened) {
      final String code = barcode.rawValue ?? "---";
      codigo = code;

      debugPrint('Barcode found! $code');

      _screenOpened = true;
      await lecturaCodigo
          .loadData(double.parse(codigo))
          .then((value) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoundCodeScreen(
                    screenClosed: _screenWasClosed, value: code),
              )));
    }
  }

  void _screenWasClosed() {
    _screenOpened = false;
  }
}

void speak(String texto) async {
  await flutterTts.setLanguage('es-US');
  await flutterTts.setPitch(1);
  await flutterTts.speak(texto);
}

class FoundCodeScreen extends StatefulWidget {
  final String value;
  final Function() screenClosed;
  const FoundCodeScreen({
    Key? key,
    required this.value,
    required this.screenClosed,
  }) : super(key: key);

  @override
  State<FoundCodeScreen> createState() => _FoundCodeScreenState();
}

class _FoundCodeScreenState extends State<FoundCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Found Code"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            widget.screenClosed();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_outlined,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Producto",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Producto()
            ],
          ),
        ),
      ),
    );
  }
}

Widget Producto() {
  nombreProducto = lecturaCodigo.nombreProducto;
  precioProducto = lecturaCodigo.precioProducto;
  speak(
      "producto: Nombre del producto: $nombreProducto precio aproximado: $precioProducto pesos");

  return Column(children: [
    Text('Nombre del producto $nombreProducto'),
    Text('Precio aproximado $precioProducto')
  ]);
}
