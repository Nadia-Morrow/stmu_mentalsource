/* Nadia Morrow
 * Mobile Development
 * Last Updated: 12/1/22
 * This page is the mini games home page
 */
import 'package:flutter/material.dart';
import 'package:stmu_mentalsource/gtw.dart';
import 'package:stmu_mentalsource/settings.dart';

import 'item.dart';
import 'maze_widget.dart';

//runs the page
class GHPage extends StatefulWidget {
  const GHPage({Key? key}) : super(key: key);

  @override
  State<GHPage> createState() => _GHPage();
}

//layout of the page
class _GHPage extends State<GHPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //top of the page
      appBar: AppBar(
          title: const Text("Mini Game Home"),
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const SettingsPage();
                  }));
                },
                icon: const Icon(Icons.settings))
          ]),
      //body of the page
      body: Container(
        padding: const EdgeInsets.only(left: 35.0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  const Positioned(top: 50, left: 120,child:Text("Maze", style: TextStyle(fontFamily: 'Times', fontWeight: FontWeight.bold),),),
                  //const Align(alignment: AlignmentDirectional.bottomStart, child: Text("Depression"),),
                  Align(alignment: AlignmentDirectional.center,
                    child:IconButton(
                        splashRadius: 37,
                        splashColor: Colors.amber,
                        iconSize: 100,
                        icon: Image.asset('images/diffBubble.png'),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (BuildContext context) {
                                return Maze(player: MazeItem("images/bubble.png", ImageType.asset),);
                              }));
                        }),),

                ],
              ),
              Stack(
                children: <Widget>[
                  const Positioned(top: 35, left:35,child:Text("Guess\nThe\nWord", style: TextStyle(fontFamily: 'Times', fontWeight: FontWeight.bold),),),
                  Align(alignment: AlignmentDirectional.topStart,
                    child:IconButton(
                        splashRadius: 37,
                        splashColor: Colors.amber,
                        iconSize: 100,
                        icon: Image.asset('images/diffBubble.png'),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (BuildContext context) {
                                return Hangman();
                              }));
                        }),),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
