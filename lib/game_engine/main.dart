import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ssadgame/game_engine/game.dart';

import 'package:ssadgame/game_engine/Menu.dart';
//import 'package:minifantasy/sprite_sheet_orc.dart';
//import 'package:minifantasy/sprite_sheet_player.dart';

double tileSize = 20.0;
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   if (!kIsWeb) {
//     await Flame.util.fullScreen();
//     await Flame.util.setPortrait();
//   }
//   //await SpriteSheetPlayer.load();
//   //await SpriteSheetOrc.load();
//   runApp(MyApp());
// }

class GameEngine extends StatefulWidget {
  @override
  _GameEngineState createState() => _GameEngineState();
}

class _GameEngineState extends State<GameEngine> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game_Engine',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: Game(),
      home: Menu(),
    );
  }
}
