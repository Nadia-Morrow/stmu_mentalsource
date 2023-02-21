
import 'package:flutter/material.dart';

import 'audio.dart';
/* Nadia Morrow
 * Mobile Development
 * Last Updated: 12/1/22
 * This page the free write page.
 */
import 'main.dart';
import 'settings.dart';

//runs the page
class JFW extends StatefulWidget {
  const JFW({Key? key}) : super(key: key);

  @override
  State<JFW> createState() => _JFW();
}

//layout of the page
class _JFW extends State<JFW> {
  @override
  Widget build(BuildContext context) {
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
                  const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child:Center(child:Text(
                            'Write it all out',
                            style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  const Center(child:Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child:Text(
                        'Then let it float away',
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ))),
                  const SizedBox(
                    height: 10,
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
