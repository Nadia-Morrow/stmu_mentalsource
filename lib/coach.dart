/* Nadia Morrow
* Mobile Development
* Last Updated: 12/1/22
* This page list creates the meditation and relaxation page of the app.
*/
import 'package:flutter/material.dart';
import 'package:stmu_mentalsource/settings.dart';
import 'package:url_launcher/url_launcher.dart';

//runs the page
class RMHPage extends StatefulWidget {
  const RMHPage({Key? key}) : super(key: key);

  @override
  State<RMHPage> createState() => _RMHPage();
}

//creates the layout of the page
class _RMHPage extends State<RMHPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //top bar of page
      appBar: AppBar(
          title: const Text("Relaxation/Meditation", style: TextStyle(fontSize: 18),),
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
      //creates the body of the page
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              const Positioned(
                top: 50,
                left: 122,
                child: Text(
                  "Relaxation",
                  style: TextStyle(
                      fontFamily: 'Times', fontWeight: FontWeight.bold),
                ),
              ),
              //const Align(alignment: AlignmentDirectional.bottomStart, child: Text("Depression"),),
              Align(
                alignment: AlignmentDirectional.center,
                child: IconButton(
                    splashRadius: 37,
                    splashColor: Colors.amber,
                    iconSize: 100,
                    icon: Image.asset('images/diffBubble.png'),
                    onPressed: () async{
                      final url = Uri.https('www.health.harvard.edu','mind-and-mood/six-relaxation-techniques-to-reduce-stress' );
                      await launchUrl(url);
                    }),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              const Positioned(
                top: 50,
                left: 20,
                child: Text(
                  "Meditation",
                  style: TextStyle(
                      fontFamily: 'Times', fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: IconButton(
                    splashRadius: 37,
                    splashColor: Colors.amber,
                    iconSize: 100,
                    icon: Image.asset('images/diffBubble.png'),
                    onPressed: () async{
                      final url = Uri.https('www.psychologytoday.com','us/basics/meditation' );
                      await launchUrl(url);
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
