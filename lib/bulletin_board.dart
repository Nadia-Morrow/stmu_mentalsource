import 'package:flutter/material.dart';
import 'package:stmu_mentalsource/settings.dart';

class TRHPage extends StatefulWidget {
  const TRHPage({Key? key}) : super(key: key);

  @override
  State<TRHPage> createState() => _TRHPage();
}

class _TRHPage extends State<TRHPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Therapy Resources"),
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
