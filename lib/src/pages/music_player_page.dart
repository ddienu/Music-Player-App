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
        SizedBox( height: 80),
        DiscImageAndBarProgress(),
      ],
    ));
  }
}

class DiscImageAndBarProgress extends StatelessWidget {
  const DiscImageAndBarProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 40),
      child: Row(
        children: [
          ImagenDisco(),

          //TODO: BarProgressCode
        ],
      ),
    );
  }
}

class ImagenDisco extends StatelessWidget {
  const ImagenDisco({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: 250,
      height: 250,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(1000),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image(image: AssetImage('assets/aurora.jpg')),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: Colors.black38, 
                    shape: BoxShape.circle),
              ),
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                    color:  Color(0xff201E28),  
                    shape: BoxShape.circle),
              ),
            ],
          )),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(begin: Alignment.topLeft, colors: [
            Color(0xff484750),
            Color(0xff1E1C24),
          ])),
    );
  }
}
