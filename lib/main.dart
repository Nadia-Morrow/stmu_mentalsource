/* Nadia Morrow
 * Mobile Development
 * Last Updated: 12/1/22
 * This page is the base page of the app.
 */

import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as p;
import 'package:stmu_mentalsource/login.dart';
import 'package:stmu_mentalsource/musicChoice.dart';
import 'package:stmu_mentalsource/profilePage.dart';
import 'package:stmu_mentalsource/splashScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//initializes the app and runs it
Future<void> main() async {
  await Supabase.initialize(
      url: 'https://naqrwjvmgrdaynbojrjl.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5hcXJ3anZtZ3JkYXluYm9qcmpsIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzQ4MzA2MzgsImV4cCI6MTk5MDQwNjYzOH0.2-cjTIzvZVSoVm9qFrASFGow-npTiuix1yPHho0jLdI',
      authCallbackUrlHostname: 'login-callback',
      debug: true);
  runApp(p.MultiProvider(
    providers: [
      p.ChangeNotifierProvider<MusicChoice>(create: (_) => MusicChoice()),
    ],
    child: const MyApp(),
  ));
}

final supabase = Supabase.instance.client;

//does the base colors of the app and gives the themes
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final textScale = MediaQuery.of(context).textScaleFactor;
    MusicChoice mc = MusicChoice();
    final ThemeData currentMode = mc.themeData.copyWith(
      appBarTheme: mc.themeData.appBarTheme,
      cardTheme: mc.themeData.cardTheme,
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: currentMode,
        home: const HomePage());
  }
}

//creates a widget that can be called everytime the widget needs to be built
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

//initializes a state from the widget and plays the background music
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    MusicChoice mc = p.Provider.of(context);
    final ThemeData currentMode = mc.themeData.copyWith(
      appBarTheme: mc.themeData.appBarTheme,
      cardTheme: mc.themeData.cardTheme,
    );
    FlameAudio.bgm.initialize();
    int i = context.watch<MusicChoice>().getMusicChoice();
    switch (i) {
      case 0:
        if (FlameAudio.bgm.isPlaying) {
          FlameAudio.bgm.dispose();
        }
        break;
      case 1:
        if (FlameAudio.bgm.isPlaying) {
          FlameAudio.bgm.dispose();
          FlameAudio.bgm.initialize();
          FlameAudio.bgm.play('lofi.mp3');
        } else {
          FlameAudio.bgm.play('lofi.mp3');
        }
        break;
      case 2:
        if (FlameAudio.bgm.isPlaying) {
          FlameAudio.bgm.dispose();
          FlameAudio.bgm.initialize();
          FlameAudio.bgm.play('whiteNoise.wav');
        } else {
          FlameAudio.bgm.play('whiteNoise.wav');
        }
        break;
      case 3:
        if (FlameAudio.bgm.isPlaying) {
          FlameAudio.bgm.dispose();
          FlameAudio.bgm.initialize();
          FlameAudio.bgm.play('nature.wav');
        } else {
          FlameAudio.bgm.play('nature.wav');
        }
        break;
      default:
        if (FlameAudio.bgm.isPlaying) {
          FlameAudio.bgm.dispose();
        }
    }
    return MaterialApp(
        title: 'StMU MentalSource',
        theme: currentMode,
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (_) => const SplashPage(),
          '/login': (_) => const LoginPage(),
          '/account': (_) => const AccountPage(),
        });
  }
}
