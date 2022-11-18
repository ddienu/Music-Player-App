import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:music_player/src/helpers/helpers.dart';
import 'package:music_player/src/models/audioplayer_model.dart';
import 'package:music_player/src/widgets/custom_appbar_widget.dart';
import 'package:provider/provider.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            
            Background(),

            Column(
      children: [

            
            CustomAppBar(),

            DiscImageAndBarProgress(),

            TituloYBotonPlay(),

            SizedBox( height: 30),

            ScrollLyrics()
      ],
    ),
          ],
        ));
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.73,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(60) ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: [
            Color(0xff484750),
            Color(0xff201E28),
          ]
          )
      ),
    );
  }
}

class ScrollLyrics extends StatelessWidget {
  const ScrollLyrics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final lyrics = getLyrics();

    return Expanded(
      child: ListWheelScrollView(
        diameterRatio: 1.2,
        itemExtent: 42,
        children: lyrics.map(
          (linea) => Text(linea, style: TextStyle( fontSize: 20, color: Colors.white.withOpacity(0.6)))
        ).toList()
        ),
    );
  }
}

class TituloYBotonPlay extends StatefulWidget {
  const TituloYBotonPlay({
    Key? key,
  }) : super(key: key);

  @override
  State<TituloYBotonPlay> createState() => _TituloYBotonPlayState();
}

class _TituloYBotonPlayState extends State<TituloYBotonPlay> with SingleTickerProviderStateMixin {

  bool isPlaying = false;
  late AnimationController playAnimation;

  @override
  void initState() {
    playAnimation = AnimationController(
      vsync: this,
      duration: Duration( milliseconds: 200),
      );
    super.initState();
  }

  @override
  void dispose() {
    playAnimation.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 20),
      margin: EdgeInsets.only( top: 50),
      child: Row(
        children: [

          SizedBox( width: 30),

          Container(
            child: Column(
              children: [
            
                Text('Far Away', 
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 28
                      ),
                    ),
                Text('-Breaking Benjamin-',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 14
                  ),
                )
              ],
            ),
          ),

          Spacer(),

          FloatingActionButton(
            onPressed: (){

              final audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);

              if ( isPlaying ){
                playAnimation.reverse();
                isPlaying = false;
                audioPlayerModel.controller.stop();

              }else{
                playAnimation.forward();
                isPlaying = true;
                audioPlayerModel.controller.repeat();
              }
            },
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause, 
              progress: playAnimation,
              ),
            backgroundColor: Color(0xffF8CB51)
            ),

          SizedBox( width: 30)
        ],
      ),
    );
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
      margin: EdgeInsets.only( top: 100 ),
      child: Row(
        children: [
          ImagenDisco(),

          Spacer(),

          BarraProgreso(),

          SizedBox( width: 20)
        ],
      ),
    );
  }
}

class BarraProgreso extends StatelessWidget {
  const BarraProgreso({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final estiloNumeros = TextStyle( color: Colors.white.withOpacity(0.5));

    return Container(
      child: Column(
        children: [

          Text('00:00', style: estiloNumeros),
          SizedBox(height: 10),

          Stack(
            children: [

          Container(
            width: 4,
            height: 240,
            color: Colors.white.withOpacity(0.2),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              
              width: 4,
              height: 120,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
            ],
          ),   

          SizedBox(height: 10),
          Text('00:00', style: estiloNumeros),
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

    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);

    return Container(
      padding: EdgeInsets.all(20),
      width: 250,
      height: 250,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(1000),
          child: Stack(
            alignment: Alignment.center,
            children: [

              SpinPerfect(
                duration: Duration(seconds: 10),
                infinite: true,
                animate: false,
                manualTrigger: true,
                controller: ( animationController ) => audioPlayerModel.controller  = animationController,
                child: Image(image: AssetImage('assets/aurora.jpg'))
                ),

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
