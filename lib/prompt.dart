/* Nadia Morrow
 * Mobile Development
 * Last Updated: 12/1/22
 * This page is the prompts page
 */
import 'dart:math';
import 'package:flutter/material.dart';
import 'Prompts.dart';
import 'main.dart';
import 'settings.dart';

//runs the page
class JPrompt extends StatefulWidget {
  const JPrompt({Key? key}) : super(key: key);

  @override
  State<JPrompt> createState() => _JPrompt();
}

//layout of the page
class _JPrompt extends State<JPrompt> {
  //generates random number
  int getRandomNumber(i) {
    var rng = Random();
    return rng.nextInt(i);
  }

//selects prompt from Prompts class
  String selectedPrompt = " ";
  void chooseWord() {
    selectedPrompt =
        Prompts.prompt_list[getRandomNumber(Prompts.prompt_list.length)];
  }

  @override
  Widget build(BuildContext context) {
    chooseWord();
    return Scaffold(
      //body of the page
        body: SafeArea(
      child: ListView(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              const Expanded(child: SizedBox()),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const SettingsPage();
                    }));
                  },
                  icon: const Icon(Icons.settings))
            ],
          ),

              //padding: const EdgeInsets.symmetric(horizontal: 10),
               DecoratedBox(decoration: BoxDecoration(
                 border: Border.all(
                   width: 3
                 ),
               ),
                   child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 10),
                       child:Text(
                selectedPrompt,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))),
          const SizedBox(
            height: 10,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset("images/diffBubble.png"),
              SizedBox(
                  height: 315,
                  width: 310,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: TextField(
                          keyboardType: TextInputType.multiline,
                          expands: true,
                          maxLines: null,
                          textAlignVertical: TextAlignVertical.top,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(500),
                              //borderSide: BorderSide(width: 0)
                            ),
                            hintText: 'Let it out',
                            alignLabelWithHint: true,
                          )))),
            ],
          ),
          const SizedBox(height: 10,),
          Row(children: [
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3
                )
              ),
              child:TextButton(onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return HomePage();
                }));
          }, child: const Text('Home'),

          )),

        ],
      ),
    ])));
  }
}
