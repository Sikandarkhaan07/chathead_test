import 'dart:async';

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

class MessangerChatHead extends StatefulWidget {
  const MessangerChatHead({Key? key}) : super(key: key);

  @override
  State<MessangerChatHead> createState() => _MessangerChatHeadState();
}

class _MessangerChatHeadState extends State<MessangerChatHead> {
  String text = "Red";
  Color color = Colors.red;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        if (color == Colors.red && text == "Red") {
          color = Colors.blue;
          text = "Blue";
        } else {
          color = Colors.red;
          text = "Red";
        }
      });
    });
    // resize();
  }

  void resize() async {
    await FlutterOverlayWindow.resizeOverlay(100, 100);
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    resize();
    return GestureDetector(
      onTap: () async {
        FlutterOverlayWindow.isActive().then((value) async {
          log("True: $value");
          if (value == true) {
            return;
          }
          FlutterOverlayWindow.showOverlay(
            enableDrag: true,
            overlayTitle: "PlanTake",
            overlayContent: 'PlanTake Enabled',
            flag: OverlayFlag.focusPointer,
            alignment: OverlayAlignment.centerLeft,
            visibility: NotificationVisibility.visibilityPublic,
            positionGravity: PositionGravity.auto,
            height: WindowSize.matchParent,
            width: WindowSize.matchParent,
          );
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
