/* Nadia Morrow
 * Mobile Development
 * Last Updated: 12/1/22
 * This page modified from original to fit app
 */
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stmu_mentalsource/main.dart';
import 'maze_painter.dart';
import 'item.dart';
import 'settings.dart';

///Maze
///
///Create a simple but powerful maze game
///You can customize [wallColor], [wallThickness],
///[columns] and [rows]. A [player] is required and also
///you can pass a List of [checkpoints] and you will be notified
///if the player pass through a checkout at [onCheckpoint]
class Maze extends StatefulWidget {
  ///Default constructor
  Maze({
    required this.player,
    this.checkpoints = const [],
    this.columns = 10,
    this.finish,
    this.height,
    this.loadingWidget,
    this.onCheckpoint,
    this.onFinish,
    this.rows = 7,
    this.wallColor = Colors.black,
    this.wallThickness = 3.0,
    this.width,
  });

  ///List of checkpoints
  final List<MazeItem> checkpoints;

  ///Columns of the maze
  final int columns;

  ///The finish image
  final MazeItem? finish;

  ///Height of the maze
  final double? height;

  ///A widget to show while loading all
  final Widget? loadingWidget;

  ///Callback when the player pass through a checkpoint
  final Function(int)? onCheckpoint;

  ///Callback when the player reach finish
  final Function()? onFinish;

  ///The main player
  final MazeItem player;

  ///Rows of the maze
  final int rows;

  ///Wall color
  final Color? wallColor;

  ///Wall thickness
  ///
  ///Default: 3.0
  final double? wallThickness;

  ///Width of the maze
  final double? width;

  @override
  _MazeState createState() => _MazeState();
}

class _MazeState extends State<Maze> {
  bool _loaded = false;
  late MazePainter _mazePainter;

  @override
  void initState() {
    super.initState();
    setUp();
  }

  void setUp() async {
    final playerImage = await _itemToImage(widget.player);
    final checkpoints = await Future.wait(
        widget.checkpoints.map((c) async => await _itemToImage(c)));
    final finishImage =
        widget.finish != null ? await _itemToImage(widget.finish!) : null;

    _mazePainter = MazePainter(
      checkpointsImages: checkpoints,
      columns: widget.columns,
      finishImage: finishImage,
      onCheckpoint: widget.onCheckpoint,
      onFinish: widget.onFinish,
      playerImage: playerImage,
      rows: widget.rows,
      wallColor: widget.wallColor ?? Colors.black,
      wallThickness: widget.wallThickness ?? 4.0,
    );
    setState(() => _loaded = true);
  }

  @override
  Widget build(BuildContext context) {
    ///mBGM mbgm = new mBGM();
    ///mbgm.userBGM();
    return Scaffold(
        backgroundColor: Colors.white,
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const SettingsPage();
                    }));
                  },
                  icon: const Icon(Icons.settings))
            ]),
        body: SafeArea(
            child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                    children: [
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            children:[Builder(builder: (context) {
                              if (_loaded) {
                                return GestureDetector(
                                    onVerticalDragUpdate: (info) =>
                                        _mazePainter.updatePosition(info.localPosition),
                                    child: CustomPaint(
                                        painter: _mazePainter,
                                        size: Size(widget.width ?? context.width,
                                            widget.height ?? context.height*0.75)));
                              } else {
                                if (widget.loadingWidget != null) {
                                  return widget.loadingWidget!;
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }
                            }
                            )
                            ]
                        ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                style: TextButton.styleFrom(
                                  side: const BorderSide(color: Colors.teal, width: 3),
                                  padding: EdgeInsets.symmetric(horizontal: 50),
                                ),
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (BuildContext context) {
                                        return HomePage();
                                      }));
                                  },
                                child: const Text("Home")),
                            TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 50),
                                  side: const BorderSide(color: Colors.teal, width: 3),
                                ),
                                onPressed: () => setState(() {
                                setUp();
                                _loaded = true;
                                }),
                                  child: const Text("New")
                                ),]),
                    ]))));
  }

  Future<ui.Image> _itemToImage(MazeItem item) {
    return _assetToByte(item.path);
  }
}

///Creates a Image from asset
Future<ui.Image> _assetToByte(String asset) async {
  final completer = Completer<ui.Image>();
  final bytes = await rootBundle.load(asset);
  ui.decodeImageFromList(bytes.buffer.asUint8List(), completer.complete);
  return completer.future;
}

///Extension to get screen size
extension ScreenSizeExtension on BuildContext {
  ///Gets the current height
  double get height => MediaQuery.of(this).size.height;

  ///Gets the current width
  double get width => MediaQuery.of(this).size.width;
}
