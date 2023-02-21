/* Nadia Morrow
 * Mobile Development
 * Last Updated: 12/1/22
 * This page creates the journal home page.
 */
import 'package:flutter/material.dart';
import 'package:stmu_mentalsource/prompt.dart';
import 'package:stmu_mentalsource/settings.dart';
import 'package:stmu_mentalsource/freeWrite.dart';

//runs the page
class JHPage extends StatefulWidget {
  const JHPage({Key? key}) : super(key: key);

  @override
  State<JHPage> createState() => _JHPage();
}

//layout of the page
class _JHPage extends State<JHPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //top bar
        appBar: AppBar(
            title: const Text("Journal Home Page"),
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const SettingsPage();
                    }));
                  },
                  icon: const Icon(Icons.settings))
            ]),
        //body of the page
        body:
        Column(children: <Widget>[
          Stack(
            children: <Widget>[
              const Positioned(top: 50, left: 130,child:Text("Prompt", style: TextStyle(fontFamily: 'Times', fontWeight: FontWeight.bold),),),
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
                            return const JPrompt();
                          }));
                    }),),

            ],
          ),
          Stack(
            children: <Widget>[
              const Positioned(top: 50, left: 27,child:Text("Free-write", style: TextStyle(fontFamily: 'Times', fontWeight: FontWeight.bold),),),
              Align(alignment: AlignmentDirectional.topStart,
                child:IconButton(
                    splashRadius: 37,
                    splashColor: Colors.amber,
                    iconSize: 100,
                    icon: Image.asset('images/diffBubble.png'),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const JFW();
                          }));
                    }),),

            ],
          ),
        ]));
  }
}
