/* Nadia Morrow
* Mobile Development
* Last Updated: 12/1/22
* This page creates the support groups page
*/
import 'package:flutter/material.dart';
import 'package:stmu_mentalsource/settings.dart';
import 'package:url_launcher/url_launcher.dart';

//runs the page
class SGHPage extends StatefulWidget {
  const SGHPage({Key? key}) : super(key: key);

  @override
  State<SGHPage> createState() => _SGHPage();
}

//develops layout of the page
class _SGHPage extends State<SGHPage> {
  @override
  Widget build(BuildContext context) {
    ///mBGM mbgm = new mBGM();
    ///mbgm.userBGM();
    return Scaffold(
      //top bar
      appBar: AppBar(
          title: const Text("Support Groups"),
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
        child: SafeArea(
          child: SingleChildScrollView( child:Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  const Positioned(top: 20, left: 107,child:Text("Off-Campus", style: TextStyle(fontFamily: 'Times', fontWeight: FontWeight.bold),),),
                  Align(alignment: AlignmentDirectional.center,
                    child:IconButton(
                        splashRadius: 37,
                        splashColor: Colors.amber,
                        iconSize: 40,
                        icon: Image.asset('images/diffBubble.png'),
                        onPressed: () async{
                          final url = Uri.https('www.psychologytoday.com','us/groups/tx/san-antonio' );
                          await launchUrl(url);
                        }),),

                ],
              ),
              Container(
                child: const Text(
                  "On-Campus",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                color: Colors.black,
                thickness: 5,
              ),
              const Text(
                "\n#RelationshipGoals:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Center(child:Text(
                "Monday Zoom 4-5pm/\nWednesdays in-person 4-5pm \nContact: DColeman@stmarytx.edu(Zoom)\n or ADamon@stmarytx.edu (In-person)\n",
              )),
              const Text(
                "Healing From Loss\n",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                  "Tuesdays in-person 4-5pm\nContact TCaston@stmarytx.edu\n"),
              const Text(
                "Anxiety: Building Your Toolkit\n",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                  "Thursdays in-person 3-4pm\nContact CVillegasGerna@stmarytx.edu\n"),
              const Text(
                "#CollegeLife\n",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                  "Fridays in-person 2-3:30pm\nContact CVillegasHerna@stmarytx.edu\n"),
            ],
          ),
        ),
      ),)
    );
  }
}
