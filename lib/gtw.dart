/* Nadia Morrow
 * Mobile Development
 * Last Updated: 12/1/22
 * This page creates the guess the word game main page.
 */
import 'dart:math';

import "package:flutter/material.dart";
import 'package:stmu_mentalsource/settings.dart';
import 'Winning.dart';
import 'game.dart';

//runs the page
class Hangman extends StatefulWidget {
  @override
  State<Hangman> createState() => _HangmanState();
}

//layout of the page
class _HangmanState extends State<Hangman> {
  int Selected_index = 30;
  bool start = true;
  int tries = 6;
  String Selected_word = " ";
  String Display = "";

  List<String> Wrong = [];
  List<String> Correct = [];
  List<String> myletters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "SIzedBox",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  int getRandomNumber(i) {
    var rng = Random();
    return rng.nextInt(i);
  }

  void Choose_word() {
    print(Game.words_list);
    Selected_word = Game.words_list[getRandomNumber(Game.words_list.length)];
  }

  String replaceCharAt(String oldString, int index, String newChar) {
    var temp = oldString;
    // dublicate letters
    for (int i = 0; i < Selected_word.length; i++) {
      if (Selected_word[i].toUpperCase() == newChar) {
        temp = temp.substring(0, i) + newChar + temp.substring(i + 1);
      }
    }
    return temp;
  }

  void getDisplay() {
    Choose_word();
    for (int i = 0; i < Selected_word.length; i++) {
      Display += " ";
    }
  }

//  the last things to do :and persone body
  @override
  void initState() {
    // Selected_word = "";
    // Display = "";
    // Correct_word = "";
    getDisplay();
    tries = 6;
    super.initState();
  }
// function used to create a word in the body of the page's function
  Widget makeWord(i) {
    return ChooseLetter(i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown,
        //body of the page
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
                Expanded(child:SizedBox()),
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (BuildContext context) {
                        return const SettingsPage();
                      }));
                    },
                    icon: const Icon(Icons.settings))
            ],)),
            Expanded(
              flex: 2,
              child: Stack(children: [
                Visibility(
                    visible: tries <= 6, child: Image.asset("images/cloud_one.png")),
                Visibility(
                    visible: tries <= 5, child: Image.asset("images/cloud_two.png")),
                Visibility(
                    visible: tries <= 4, child: Image.asset("images/cloud_filled.png")),
                Visibility(
                    visible: tries <= 3, child: Image.asset("images/grass_outline.png")),
                Visibility(
                    visible: tries <= 2, child: Image.asset("images/grass_filled.png")),
                Visibility(
                    visible: tries <= 1, child: Image.asset("images/tree_outline.png")),
                Visibility(
                    visible: tries <= 0, child: Image.asset("images/tree_filled.png")),
              ]),
            ),
            Expanded(
              flex:0,
              child:  Wrap(
                  spacing: 3,
                  alignment: WrapAlignment.center,
                  children: [
                    ...List.generate(Display.length, (index) {
                      var rng = Display[index];
                      return makeWord(rng);
                    })
                  ],
                ),

            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
                    ///padding: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
                    // will implement this later to make the last row in center
                    child: GridView.builder(
                        itemCount: 27,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 3,
                        ),
                        itemBuilder: (ctx, index) {
                          if (index == 21) {
                            return SizedBox();
                          } else if (Wrong.contains(myletters[index])) {
                            return WLetter(myletters[index]);
                          } else if (Correct.contains(myletters[index])) {
                            return RLetter(myletters[index]);
                          } else {
                            return Letter(
                              myletters[index],
                                  () {
                                setState(() {
                                  if (Selected_index != index) {
                                    Selected_index = index;
                                    // print("i changed here ${Selected_index}");
                                  } else {
                                    Selected_index = 30;
                                  }
                                });
                              },
                              Selected_index,
                              index,
                            );
                          }
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (Selected_index == 30) {
                            } else if (Selected_word.toUpperCase()
                                .contains(myletters[Selected_index])) {
                              Correct.add(myletters[Selected_index]);
                              int temp = Selected_word.toUpperCase()
                                  .indexOf(myletters[Selected_index]);

                              Display = replaceCharAt(
                                  Display, temp, myletters[Selected_index]);

                              if (Display == Selected_word.toUpperCase()) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext build) {
                                      return Winning(Display, true);
                                    }));
                              }
                            } else {
                              Wrong.add(myletters[Selected_index]);
                              tries--;
                              if (tries == 0) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext build) {
                                      return Winning(Selected_word, false);
                                    }));
                              }
                            }
                          });
                          // print("The correct word is: ${Correct}");
                          // print("The Display word is: ${Display}");
                          // print("The selected word is: ${Selected_word}");
                          // print("The wrong word is: ${Wrong}");
                          Selected_index = 30;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          ///padding: const EdgeInsets.symmetric(
                              ///horizontal: 28, vertical: 10),
                          child: Text("Confirm",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25)),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        ///padding: const EdgeInsets.symmetric(
                            ///horizontal: 10, vertical: 10),
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child:Text("Lives remaining: ${tries}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 23)))
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class Letter extends StatefulWidget {
  final String letter;
  VoidCallback myfun;
  int selected;
  int index;

  Letter(String this.letter, VoidCallback this.myfun, int this.selected,
      int this.index);

  @override
  State<Letter> createState() => _LetterState();
}

class _LetterState extends State<Letter> {
  bool is_pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.myfun();
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Container(
            ///padding: const EdgeInsets.all(5),
            color: widget.selected == widget.index
                ? Colors.teal
                : Colors.brown,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                color: widget.selected == widget.index
                    ? Colors.teal
                    : Colors.brown,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(this.widget.letter,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w900)),
                ),
              ),
            )),
      ),
    );
  }
}

class WLetter extends StatefulWidget {
  final String letter;
  WLetter(
      String this.letter,
      );

  @override
  State<WLetter> createState() => _WLetterState();
}

class _WLetterState extends State<WLetter> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: Container(
          ///padding: const EdgeInsets.all(5),
          color: Color(0xff040311),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              color: Color(0xff040311),
              child: Align(
                alignment: Alignment.center,
                child: Text(this.widget.letter,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w900)),
              ),
            ),
          )),
    );
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(10),
    //   child: Container(
    //     padding: EdgeInsets.all(10),
    //     decoration: BoxDecoration(color: Color(0xff2B1F69)),
    //     child: Text(this.letter,
    //         style: TextStyle(
    //             color: Colors.white,
    //             fontSize: 35,
    //             fontWeight: FontWeight.w900)),
    //   ),
    // );
  }
}

class RLetter extends StatefulWidget {
  final String letter;
  RLetter(
      String this.letter,
      );

  @override
  _RLetterState createState() => _RLetterState();
}

class _RLetterState extends State<RLetter> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: Container(
          ///padding: const EdgeInsets.all(5),
          color: Colors.teal,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              color: Colors.teal,
              child: Align(
                alignment: Alignment.center,
                child: Text(this.widget.letter,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w900)),
              ),
            ),
          )),
    );
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(10),
    //   child: Container(
    //     padding: EdgeInsets.all(10),
    //     decoration: BoxDecoration(color: Color(0xff2B1F69)),
    //     child: Text(this.letter,
    //         style: TextStyle(
    //             color: Colors.white,
    //             fontSize: 35,
    //             fontWeight: FontWeight.w900)),
    //   ),
    // );
  }
}

class ChooseLetter extends StatelessWidget {
  final String letter;
  ChooseLetter(String this.letter);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(color: Colors.teal),
        child: Text(this.letter,
            style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w900)),
      ),
    );
  }
}