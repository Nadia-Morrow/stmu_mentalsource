import 'package:flutter/material.dart';
import 'package:stmu_mentalsource/bulletin_board.dart';
import 'package:stmu_mentalsource/circle_table.dart';
import 'package:stmu_mentalsource/coach.dart';
import 'package:stmu_mentalsource/commonIllnesses.dart';
import 'package:stmu_mentalsource/door.dart';
import 'package:stmu_mentalsource/settings.dart';
import 'package:stmu_mentalsource/tv.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 15.0),
            child: Flexible(
              fit: FlexFit.tight,
              child: Image.asset(
                'images/home.png',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 21.0, right: 28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.settings,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const SettingsPage();
                      }),
                    );
                  },
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 112.0,left: 198.0),
            child: Row(
              children: [
                Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const CMHPage();
                          }));
                        },
                        child: const Text(""))),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 112.0),
            child: Row(
              children: [
                Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const TRHPage();
                              }));
                        },
                        child: const Text(""))),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 230.0,left: 69.0),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const RMHPage();
                              }));
                        },
                        child: const Text(""))),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 230.0,left: 177.0),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const SGHPage();
                              }));
                        },
                        child: const Text(""))),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 230.0),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const GHPage();
                              }));
                        },
                        child: const Text(""))),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 19.0,left: 103.0),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const JHPage();
                              }));
                        },
                        child: const Text(""))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
