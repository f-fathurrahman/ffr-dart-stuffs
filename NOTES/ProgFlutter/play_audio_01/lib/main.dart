import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AudioPlayer _audioPlayer = AudioPlayer();
  String _message = 'Click on the cat or duck';

  void _playSoundMeow() {
    setState( () {
      _audioPlayer.play('../assets/meow.mp3', isLocal: true);
      _message = 'Cat is clicked';
    } );
  }

  void _playSoundQuack() {
    setState( () {
      _audioPlayer.play('../assets/quack.mp3', isLocal: true);
      _message = 'Duck is clicked';
    } );
  }

  @override
  Widget build(BuildContext context) {

    final _buttonCat = FlatButton(
      onPressed: _playSoundMeow,
      padding: EdgeInsets.all(5.0),
      child: Image.asset('assets/kitty.png')
    );

    final _buttonDuck = FlatButton(
      onPressed: _playSoundQuack,
      padding: EdgeInsets.all(5.0),
      child: Image.asset('assets/duck.png')
    );

    final _messageText = Container(
      padding: EdgeInsets.all(2.0),
      child: Text(_message,
        style: TextStyle(fontSize: 16)
      )
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Music play")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _messageText,
              _buttonDuck,
              _buttonCat,
            ]
          ),
        ),
      )
    );
  }
}