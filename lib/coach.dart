import 'package:flutter/material.dart';
import 'package:stmu_mentalsource/settings.dart';

class RMHPage extends StatefulWidget {
  const RMHPage({Key? key}) : super(key: key);

  @override
  State<RMHPage> createState() => _RMHPage();
}

class _RMHPage extends State<RMHPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Relaxation/Meditation"),
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
