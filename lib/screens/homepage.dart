import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:qr/screens/result.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var qr = '';
  Future _scanQR() async {
    var result = await BarcodeScanner.scan();
    qr = result.rawContent;
    if (qr != '') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ResultScreen(value: qr)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR CODE SCANNER'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 150,
          width: 150,
          child: Image.asset('assets/images/qr.jpg'),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        tooltip: 'scan QR code',
        onPressed: () {
          _scanQR();
        },
        label: const Text('SCAN'),
        icon: const Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
