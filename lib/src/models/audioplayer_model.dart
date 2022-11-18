import 'package:flutter/material.dart';



class AudioPlayerModel with ChangeNotifier{


  bool _playing = false;

  late AnimationController _controller;

  AnimationController get controller => _controller;

  set controller ( AnimationController value){

    _controller = value;
  }
}