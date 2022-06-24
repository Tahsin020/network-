import 'package:flutter/material.dart';

class NetworkChangeExample extends StatefulWidget {
  const NetworkChangeExample({Key? key}) : super(key: key);

  @override
  State<NetworkChangeExample> createState() => _NetworkChangeExampleState();
}

class _NetworkChangeExampleState extends State<NetworkChangeExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Placeholder(),
      bottomNavigationBar: const _BottomAppBar(),
    );
  }
}

class _BottomAppBar extends StatelessWidget {
  const _BottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.abc_rounded), label: 'Page1'),
      BottomNavigationBarItem(icon: Icon(Icons.abc_rounded), label: 'Page2'),
    ]);
  }
}
