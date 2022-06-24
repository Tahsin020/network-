import 'package:flutter/material.dart';
import 'package:use_case/use_case/network_change/no_network_widget.dart';

class MainBuild {
  MainBuild._();
  static Widget build(BuildContext context, Widget? child) {
    return Column(
      children: [
        Expanded(
          child: child ?? const SizedBox(),
        ),
        const NoNetworkWidget()
      ],
    );
  }
}
