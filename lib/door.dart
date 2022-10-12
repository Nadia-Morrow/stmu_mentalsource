import 'package:flutter/material.dart';
import 'package:stmu_mentalsource/main.dart';
import 'package:stmu_mentalsource/settings.dart';

class JHPage extends StatefulWidget {
  const JHPage({Key? key}) : super(key: key);

  @override
  State<JHPage> createState() => _JHPage();
}

class _JHPage extends State<JHPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Journal Home Page"),
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const SettingsPage();
                    }));
                  },
                  icon: const Icon(Icons.settings))
            ]),
        body:
        Row(children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 21.0, left: 10.0),
            child: ElevatedButton(
                child: const Text("Prompts"),
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
                child: const Text("Free-Write"),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const HomePage();
                  }));
                }),
          ),
        ]));
  }
}
