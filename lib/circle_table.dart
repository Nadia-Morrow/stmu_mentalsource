import 'package:flutter/material.dart';
import 'package:stmu_mentalsource/settings.dart';

class SGHPage extends StatefulWidget {
  const SGHPage({Key? key}) : super(key: key);

  @override
  State<SGHPage> createState() => _SGHPage();
}

class _SGHPage extends State<SGHPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
