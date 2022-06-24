import 'package:flutter/material.dart';
import 'package:use_case/core/init/main_build.dart';
import 'package:use_case/example/network_change_example.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      builder: MainBuild.build,
      home: NetworkChangeExample(),
    );
  }
}
