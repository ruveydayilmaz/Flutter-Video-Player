import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'youtube player',url: 'https://www.youtube.com/watch?v=7e_q3Wh-Iy0',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title, this.url});
  final String title;
  final url;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late YoutubePlayerController _controller;
  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url!).toString(),
        flags: YoutubePlayerFlags(
          enableCaption: false,
          isLive: false,
          autoPlay: false
        ),
    );
  }

  @override
  void initState() {
    runYoutubePlayer() ;
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
      _controller.dispose();
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: const Color(0xFF343434),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              _buildProgressBar(),
              const SizedBox(
                height: 30,
              ),
              _buildPatternSentence(),
              const SizedBox(
                height: 15,
              ),
              player,
              const SizedBox(
                height: 60,
              ),
              _buildQuestionWord(),
              const SizedBox(
                height: 80,
              ),
              _buildDivider(),
              const SizedBox(
                height: 30,
              ),
              _buildOptions(),
              const SizedBox(
                height: 70,
              ),
          ]
          ),
        );
      },
    );
  }


  Widget _buildProgressBar() {
    return Center(
      child: Stack(children: [
        Container(
          height: 25,
          width: 310,
          decoration: const BoxDecoration(
            color: Color(0xFFE9E9E9),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        Container(
          height: 25,
          width: 29,
          decoration: const BoxDecoration(
            color: Color(0xFFFEB800),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
      ]),
    );
  }

  Widget _buildPatternSentence() {
    return Center(
      child: Text(
        "Videoyla öğren",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
      ),
    );
  }


  Widget _buildQuestionWord() {
    return Align(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 50,
        width: 93,
        decoration: const BoxDecoration(
            color: Color(0xFFFEB800),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Center(
          child: Text(
            "drink",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptions() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_buildOptionText("ye"), _buildOptionText("ayı")],
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_buildOptionText("ekmek"), _buildOptionText("iç")],
        )
      ],
    );
  }

  Widget _buildOptionText(String optionText) {
    return Align(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 50,
        width: 93,
        decoration: const BoxDecoration(
            color: Color(0xFF6F6F6F),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Center(
          child: Text(
            optionText,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      indent: 55,
      endIndent: 55,
      color: Color(0xFFFFFFFF),
    );
  }
}
