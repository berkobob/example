import 'package:flutter/material.dart';
// import 'dart:async';

import 'package:example/example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _hasAccessToReminders = false;
  final _examplePlugin = Example();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    bool hasAccessToReminders;
    hasAccessToReminders = await _examplePlugin.hasAccessToReminders() ?? false;

    if (!mounted) return;

    setState(() {
      _hasAccessToReminders = hasAccessToReminders;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('App has access to Reminders: $_hasAccessToReminders\n'),
        ),
      ),
    );
  }
}
