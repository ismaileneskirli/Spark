import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:gsu_park/services/logger.dart';

class QrCodeScan extends StatefulWidget {
  @override
  _QrCodeScanState createState() => _QrCodeScanState();
}

class _QrCodeScanState extends State<QrCodeScan> {
  Logger log = getLogger("QrCodeScan");
  String result = "Qr kodunu okuttuğunuz zaman ödemeniz varsayılan ödeme yönteminizden alınacaktır.";
  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      log.i(qrResult);
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Kameraya erişim engellendi.";
        });
      } else {
        setState(() {
          result = "Bilinmeyen Hata $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "Tarama işlemi yapmadan bir önceki ekrana döndünüz.";
      });
    }catch(e){
      setState(() {
        result = "Bilinmeyen Hata $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _scanQR,
        label: Text("Tarat"),
        icon: Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("Qr Kod Tarayıcı"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Center(
            child: Text(
              result,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            )),
      )
    );
  }
}