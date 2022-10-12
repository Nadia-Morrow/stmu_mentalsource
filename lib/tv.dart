import 'package:flutter/material.dart';
import 'package:stmu_mentalsource/settings.dart';

class GHPage extends StatefulWidget {
  const GHPage({Key? key}) : super(key: key);

  @override
  State<GHPage> createState() => _GHPage();
}

class _GHPage extends State<GHPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Mini Game Home"),
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
    );
  }
}
