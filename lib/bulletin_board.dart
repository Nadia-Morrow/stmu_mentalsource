/*
Nadia Morrow
Mobile Development
Last Updated: 12/1/22
This page crease the therapy resources page of the app.
 */
import 'package:flutter/material.dart';
import 'package:stmu_mentalsource/settings.dart';
import 'package:url_launcher/url_launcher.dart';

//create the widget that causes the page to be build when called
class TRHPage extends StatefulWidget {
  const TRHPage({Key? key}) : super(key: key);

  @override
  State<TRHPage> createState() => _TRHPage();
}

//builds the layout of the page for this instance
class _TRHPage extends State<TRHPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //top bar that shows settings and title
      appBar: AppBar(
          title: const Text("Therapy Resources"),
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            //button that leads to the settings page
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const SettingsPage();
                  }));
                },
                icon: const Icon(Icons.settings))
          ]),
      //creates the middle part of the page
      body: Container(
        padding: const EdgeInsets.only(left: 35.0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
          Stack(
          children: <Widget>[
            const Positioned(top: 50, left: 102,child:Text("On-campus", style: TextStyle(fontFamily: 'Times', fontWeight: FontWeight.bold),),),
          //const Align(alignment: AlignmentDirectional.bottomStart, child: Text("Depression"),),
          Align(alignment: AlignmentDirectional.center,
            child:IconButton(
                splashRadius: 37,
                splashColor: Colors.amber,
                iconSize: 100,
                icon: Image.asset('images/diffBubble.png'),
                onPressed: () async{
                  final url = Uri.https('www.stmarytx.edu','outreach/counseling' );
                  await launchUrl(url);
                }),),

          ],
        ),
        Stack(
          children: <Widget>[
            const Positioned(top: 50, left: 185,child:Text("Off-campus", style: TextStyle(fontFamily: 'Times', fontWeight: FontWeight.bold),),),
            //const Align(alignment: AlignmentDirectional.bottomStart, child: Text("Depression"),),
            Align(alignment: AlignmentDirectional.centerEnd,
              child:IconButton(
                  splashRadius: 37,
                  splashColor: Colors.amber,
                  iconSize: 100,
                  icon: Image.asset('images/diffBubble.png'),
                  onPressed: () async{
                    final url = Uri.https('www.psychologytoday.com','us/therapists/tx/san-antonio' );
                    await launchUrl(url);
                  }),),

          ],
        ),
        Stack(
          children: <Widget>[
            const Positioned(top: 50, left: 30,child:Text("Online", style: TextStyle(fontFamily: 'Times', fontWeight: FontWeight.bold),),),
            Align(alignment: AlignmentDirectional.topStart,
              child:IconButton(
                  splashRadius: 37,
                  splashColor: Colors.amber,
                  iconSize: 100,
                  icon: Image.asset('images/diffBubble.png'),
                  onPressed: () async{
                    final url = Uri.https('www.talkspace.com');
                    await launchUrl(url);
                  }),),

          ],
        ),],
        ),
      ),),
    );
  }
}
