import 'dart:developer';
import 'package:flutter/material.dart';

import 'chathead.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  overlayMain();
}

// overlay entry point
@pragma("vm:entry-point")
void overlayMain() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log("Main Building....");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatHead Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MessangerChatHead(),
    );
  }
}
