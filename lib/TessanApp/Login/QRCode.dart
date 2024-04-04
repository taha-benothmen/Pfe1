import 'package:best_flutter_ui_templates/TessanApp/Login/LoginPass.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewExample extends StatefulWidget {
  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.red,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          Positioned(
            bottom: 30,
            left: 10,
            right: 10,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(
                        255, 255, 82, 69), // Background color of the box
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5), // Shadow color
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.all(16.0), // Inner padding of the box
                    child:/* (result != null)
                        ? Text(
                            'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )
                        : */
                        Text(
                            'To continue using the app please select the QR code from your administration',
                            textAlign: TextAlign.center, // Center align text
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      if (result != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
