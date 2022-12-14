import 'package:flutter/material.dart';
import 'package:music_player/src/models/audioplayer_model.dart';

import 'package:music_player/src/theme/theme.dart';

import 'package:music_player/src/pages/music_player_page.dart';

import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext) => AudioPlayerModel(),
            )
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: miTema,
        home: const MusicPlayerPage(),
      ),
    );
  }
}