import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class ScanQrPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScanBody();
  }
}

class ScanBody extends StatefulWidget {
@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyScanState();
  }
}

class _MyScanState extends State<ScanBody> {
  String barcode = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text('QR Code'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 8.0),
              child: RaisedButton(
                  color: Colors.orange,
                  textColor: Colors.white,
                  splashColor: Colors.blueGrey,
                  onPressed: scan,
                  child: const Text('START CAMERA SCAN')

              ),
            ),
            Padding (
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(barcode, textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    );
  }


  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        return this.barcode = barcode;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          return this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() {
          return this.barcode = 'Unknown error: $e';
        });
      }
    } on FormatException{
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }


}
