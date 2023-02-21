/* Nadia Morrow
 * Mobile Development
 * Last Updated: 12/1/22
 * This page is the home page of the app
 */
import 'package:flutter/material.dart';
import 'package:stmu_mentalsource/bulletin_board.dart';
import 'package:stmu_mentalsource/circle_table.dart';
import 'package:stmu_mentalsource/coach.dart';
import 'package:stmu_mentalsource/commonIllnesses.dart';
import 'package:stmu_mentalsource/door.dart';
import 'package:stmu_mentalsource/settings.dart';
import 'package:stmu_mentalsource/tv.dart';
//runs and creates layout of page
class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
        builder: (context) => MainPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      //body of page
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SafeArea(
              child: Center(
                child: Image.asset(
                  'images/home.png',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10.0, right: 43.0),
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
              margin: const EdgeInsets.only(top: 380.0, left: 152.0),
              child: Material(
                elevation: 6,
                child: SizedBox(
                  width: 110,
                  height: 26,
                  child: InkWell(
                    radius: 100,
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const CMHPage();
                      }));
                    },
                    child: Ink.image(
                      fit: BoxFit.cover,
                      image: const AssetImage("images/frontDesk.png"),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 280.0, left: 15.0),
              child: Material(
                color: Colors.transparent,
                elevation: 6,
                child: SizedBox(
                  width: 40,
                  height: 170,
                  child: InkWell(

                    radius: 100,
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const TRHPage();
                      }));
                    },
                    child: Ink.image(
                      fit: BoxFit.fitHeight,
                      image: const AssetImage("images/bulletinBoard.png"),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 125.0, left: 72.0),
              child: Material(
                color: Colors.transparent,
                elevation: 6,
                child: SizedBox(
                  width: 68,
                  height: 142,
                  child: InkWell(
                    radius: 100,
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const RMHPage();
                      }));
                    },
                    child: Ink.image(
                      fit: BoxFit.fitWidth,
                      image: const AssetImage("images/couch.png"),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 167.0, left: 153.0),
              child: Material(
                color: Colors.transparent,
                elevation: 6,
                child: SizedBox(
                  width: 55,
                  height: 70,
                  child: InkWell(
                    radius: 100,
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const SGHPage();
                      }));
                    },
                    child: Ink.image(
                      fit: BoxFit.fitWidth,
                      image: const AssetImage("images/round_table.png"),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 152.0, left: 266),
              child: Material(
                color: Colors.transparent,
                elevation: 6,
                child: SizedBox(
                  width: 40,
                  height: 90,
                  child: InkWell(
                    radius: 100,
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const GHPage();
                      }));
                    },
                    child: Ink.image(
                      fit: BoxFit.fitHeight,
                      image: const AssetImage("images/tv.png"),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 6.0, left: 92.0),
              child: Material(
                color: Colors.transparent,
                elevation: 6,
                child: SizedBox(
                  width: 46,
                  height: 38,
                  child: InkWell(
                    radius: 100,
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const JHPage();
                      }));
                    },
                    child: Ink.image(
                      fit: BoxFit.fitWidth,
                      image: const AssetImage("images/door.png"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
