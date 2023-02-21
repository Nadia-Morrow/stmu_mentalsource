/* Nadia Morrow
 * Mobile Development
 * Last Updated: 12/1/22
 * This page is the base page of the app.
 */
//importing necessary libraries
import 'package:flutter/material.dart';
import 'package:stmu_mentalsource/settings.dart';
import 'package:url_launcher/url_launcher.dart';

//runs the app
class CMHPage extends StatefulWidget {
  const CMHPage({Key? key}) : super(key: key);

  @override
  State<CMHPage> createState() => _CMHPage();
}

//creates the layout
class _CMHPage extends State<CMHPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //top bar of the page
      appBar: AppBar(
          title: const Text("Common MH Experiences", style: TextStyle(fontSize: 15), ),
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
      body: SafeArea(
        child: Center(child:Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  const Positioned(top: 50, left: 122,child:Text("Depression", style: TextStyle(fontFamily: 'Times', fontWeight: FontWeight.bold),),),
                  //const Align(alignment: AlignmentDirectional.bottomStart, child: Text("Depression"),),
                  Align(alignment: AlignmentDirectional.center,
                     child:IconButton(
                      splashRadius: 37,
                      iconSize: 100,
                      icon: Image.asset('images/diffBubble.png'),
                         onPressed: () async{
                           final url = Uri.https('www.healthline.com','health/depression');
                           await launchUrl(url);
                         }),),

                ],
              ),
              Stack(
                children: <Widget>[
                  const Positioned(top: 50, left: 235,child:Text("Anxiety", style: TextStyle(fontFamily: 'Times', fontWeight: FontWeight.bold),),),
                  //const Align(alignment: AlignmentDirectional.bottomStart, child: Text("Depression"),),
                  Align(alignment: AlignmentDirectional.centerEnd,
                    child:IconButton(
                        splashRadius: 37,
                        splashColor: Colors.amber,
                        iconSize: 100,
                        icon: Image.asset('images/diffBubble.png'),
                        onPressed: () async{
                          final url = Uri.https('www.medicalnewstoday.com','articles/323454' );
                          await launchUrl(url);
                        }),),

                ],
              ),
              Stack(
                children: <Widget>[
                  const Positioned(top: 50, left: 27,child:Text("Burnout", style: TextStyle(fontFamily: 'Times', fontWeight: FontWeight.bold),),),
                  Align(alignment: AlignmentDirectional.topStart,
                    child:IconButton(
                        splashRadius: 37,
                        splashColor: Colors.amber,
                        iconSize: 100,
                        icon: Image.asset('images/diffBubble.png'),
                        onPressed: () async{
                          final url = Uri.https('www.verywellmind.com','stress-and-burnout-symptoms-and-causes-3144516' );
                          await launchUrl(url);
                        }
                     ),),

                ],
              ),
            ]),
      ),),
    );
  }
}


