import 'package:flutter/material.dart';
import 'package:stmu_mentalsource/main.dart';
import 'package:stmu_mentalsource/settings.dart';

class CMHPage extends StatefulWidget {
  const CMHPage({Key? key}) : super(key: key);

  @override
  State<CMHPage> createState() => _CMHPage();
}

class _CMHPage extends State<CMHPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text("Common Mental Health Problems"),
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
      body: Row(children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 21.0, left: 10.0),
          child: ElevatedButton(
              child: const Text("Depression"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const HomePage();
                }));
              }),
        ),
        Container(
          padding: const EdgeInsets.only(top: 21.0, left: 35.0),
          child: ElevatedButton(
              child: const Text("Anxiety"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const HomePage();
                }));
              }),
        ),
        Container(
          padding: const EdgeInsets.only(top: 21.0, left: 40.0),
          child: ElevatedButton(
              child: const Text("Burnout"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const HomePage();
                }));
              }),
        ),
      ]),
    );
  }
}
