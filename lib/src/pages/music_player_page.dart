import 'package:flutter/material.dart';
import 'package:music_player/src/widgets/custom_appbar_widget.dart';


class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          CustomAppBar(),
          
        ],
      )
    );
  }
}