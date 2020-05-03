import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'dart:async';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  int _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  String _textValue = "sample";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ocro'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.white),
              child: Text(
                _textValue,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              height: 70.0,
              width: double.infinity,
            ),
            GestureDetector(
              onTap: () {
                _read();
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Click to Scan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(50.0)),
                width: double.infinity,
                height: 100.0,
              ),
            ),
          ],
        ),
      ),

      //
    );
  }

  Future<Null> _read() async {
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
        camera: _cameraOcr,
        waitTap: true,
      );

      setState(() {
        _textValue = texts[0].value;
      });
    } on Exception {
      texts.add(new OcrText('Failed to recognize text.'));
    }
  }
}
