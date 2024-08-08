import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text-to-Speech Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TTSPage(),
    );
  }
}

class TTSPage extends StatefulWidget {
  @override
  _TTSPageState createState() => _TTSPageState();
}

class _TTSPageState extends State<TTSPage> {
  final FlutterTts _flutterTts = FlutterTts();
  String _textToSpeak = 'Enter text here...';
  double _speechRate = 0.5;
  double _volume = 1.0;
  double _pitch = 1.0;

  Future _speak() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(_pitch);
    await _flutterTts.setVolume(_volume);
    await _flutterTts.setSpeechRate(_speechRate);
    await _flutterTts.speak(_textToSpeak);
  }

  Future _stop() async {
    await _flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text-to-Speech Demo'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Color.fromARGB(255, 204, 201, 193),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    _textToSpeak = text;
                  });
                },
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Enter text to speak',
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _speak,
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'Speak',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _stop,
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'Stop',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Speech Rate: ${_speechRate.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
            Slider(
              value: _speechRate,
              min: 0.1,
              max: 1.0,
              divisions: 9,
              onChanged: (value) {
                setState(() {
                  _speechRate = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'Volume: ${_volume.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
            Slider(
              value: _volume,
              min: 0.0,
              max: 1.0,
              onChanged: (value) {
                setState(() {
                  _volume = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'Pitch: ${_pitch.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
            Slider(
              value: _pitch,
              min: 0.5,
              max: 2.0,
              divisions: 15,
              onChanged: (value) {
                setState(() {
                  _pitch = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
