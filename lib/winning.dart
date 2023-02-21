/* Nadia Morrow
 * Mobile Development
 * Last Updated: 12/1/22
 * This page is the results page of the guess the word game.
 */
import "package:flutter/material.dart";
import 'package:stmu_mentalsource/settings.dart';

import 'gtw.dart';
import 'main.dart';

//runs and creates the layout of the page
class Winning extends StatelessWidget {
  final String winning_word;
  bool IsWinning;

  //check if the user won or lose
  Winning(this.winning_word,this.IsWinning);
  //gives ending massage
  Text state(){
    String chosen_String = this.IsWinning ? "Congrats You've Won !\n":"Nice Try!\n";
    return Text( "${chosen_String}  the word was: ${this.winning_word} ",
        style: const TextStyle(
            letterSpacing: 1,
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w900));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.brown],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )),
      child: Scaffold(
        //top of the page
          appBar: AppBar(
              title: const Text("Results"),
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
          backgroundColor: Colors.transparent,
          //body of the page
          body: Center(
            child: Column(children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 35, vertical: 70),
                  child: state()
              ),
              const SizedBox(
                height: 70,
              ),
              Row(children: [GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext build) {
                    return HomePage();
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  child: const Text("Home",
                      style: TextStyle(
                          letterSpacing: 3,
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w900)),
                ),
              ),
              SizedBox(width: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext build) {
                    return Hangman();
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  child: const Text("Play",
                      style: TextStyle(
                          letterSpacing: 3,
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w900)),
                ),
              ),],)
            ]),
          )),
    );
  }
}