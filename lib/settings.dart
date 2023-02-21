/* Nadia Morrow
 * Mobile Programming
 * Last Updated: 12/1/22
 * This page creates the settings and connects to choosing the music source.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stmu_mentalsource/musicChoice.dart';
import 'package:stmu_mentalsource/profilePage.dart';

//creates the widget that can be called by other pages
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPage();
}

//creates the look of the app
class _SettingsPage extends State<SettingsPage> {
  MusicChoice mc = MusicChoice();
  late final List<bool> mode;
  var _loading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Settings"),
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return const AccountPage();
                    }),
                  );
                },
                icon: const Icon(
                  Icons.person,
                ))
          ]),
      body: Column(
        //creates the text title and the buttons that go with the choices
        children: [
          const DecoratedBox(
              decoration: BoxDecoration(),
              child: Text(
                'Audio',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
          Row(
            children: [
              IconButton(
                  splashRadius: 37,
                  splashColor: Colors.brown,
                  iconSize: 35,
                  selectedIcon: const Icon(
                    Icons.circle,
                    color: Colors.teal,
                  ),
                  icon: Image.asset('images/diffBubble.png'),
                  onPressed: () =>
                      Provider.of<MusicChoice>(context, listen: false)
                          .setMusicChoice(1)),
              const Text(
                'Lofi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  splashRadius: 37,
                  splashColor: Colors.brown,
                  iconSize: 35,
                  icon: Image.asset('images/diffBubble.png'),
                  onPressed: () =>
                      Provider.of<MusicChoice>(context, listen: false)
                          .setMusicChoice(2)),
              const Text(
                'White Noise',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  splashRadius: 37,
                  splashColor: Colors.brown,
                  iconSize: 35,
                  icon: Image.asset('images/diffBubble.png'),
                  onPressed: () =>
                      Provider.of<MusicChoice>(context, listen: false)
                          .setMusicChoice(3)),
              const Text(
                'Nature',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  splashRadius: 37,
                  splashColor: Colors.brown,
                  iconSize: 35,
                  icon: Image.asset('images/diffBubble.png'),
                  onPressed: () =>
                      Provider.of<MusicChoice>(context, listen: false)
                          .setMusicChoice(0)),
              const Text(
                'Audio Off',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 5)),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 5, left: 10),
                child:Text("Dark Mode:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
              Switch(
                inactiveTrackColor: Colors.brown,
                onChanged: (bool value) {
                  Provider.of<MusicChoice>(context, listen: false).toggleTheme();
                },
                value: Provider.of<MusicChoice>(context, listen: true).mode
              )
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 5),),
          TextButton(onPressed: () =>
            Provider.of<MusicChoice>(context, listen: false).saveSettings(context),
           child: Text("Save Settings"))

        ],
      ),
    );
  }
}
