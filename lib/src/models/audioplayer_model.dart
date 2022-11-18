import 'package:flutter/material.dart';



class AudioPlayerModel with ChangeNotifier{


  bool _playing = false;
  Duration _songDuration  = Duration( milliseconds: 0);
  Duration _current = Duration( milliseconds: 0);

  late AnimationController _controller;

  String get songTotalDuration => printDuration( _songDuration );
  String get currentSecond     => printDuration( _current );

  double get poncentaje => ( songDuration.inSeconds > 0)
                           ? _current.inSeconds.toDouble() - _songDuration.inSeconds.toDouble()
                           : 0;

  bool get playing => _playing;

  set playing ( bool value ){
    _playing = value;
    notifyListeners();
  }

  Duration get songDuration => _songDuration;

  set songDuration ( Duration value){
    _songDuration = value;
    notifyListeners();
  }

  Duration get current => _current;

  set current ( Duration value ){
    _current = value;
    notifyListeners();
  }

  AnimationController get controller => _controller;

  set controller ( AnimationController value){

    _controller = value;
  }
}

String printDuration(Duration duration) {
 
     String twoDigits(int n) {
       if(n >= 10) return "$n";
       return "0$n";
     }
 
     String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
     String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
     return "$twoDigitMinutes:$twoDigitSeconds";
 
   }