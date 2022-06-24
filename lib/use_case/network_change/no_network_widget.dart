import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';
import 'package:use_case/use_case/network_change/network_change_manager.dart';

class NoNetworkWidget extends StatefulWidget {
  const NoNetworkWidget({Key? key}) : super(key: key);

  @override
  _NoNetworkWidgetState createState() => _NoNetworkWidgetState();
}

class _NoNetworkWidgetState extends State<NoNetworkWidget> with StateMixin {
  late final INetworkChangeManager _networkChange;
  NetworkResult? _networkResult;

  @override
  void initState() {
    super.initState();
    _networkChange = NetworkChangeManager();
    waitForScreen(() {
      _networkChange.handleNetworkChange((result) {
        _updateView(result);
      });
    });
  }

  Future<void> fetchFirstResult() async {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      final _result = await _networkChange.checkNetworkFirstTime();
      _updateView(_result);
    });
  }

  void _updateView(NetworkResult result) {
    setState(() {
      _networkResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: Container(
          height: context.dynamicHeight(0.1),
          color: context.colorScheme.error,
        ),
        secondChild: const SizedBox(),
        crossFadeState: _networkResult == NetworkResult.off ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: context.durationLow);
  }
}

mixin StateMixin<T extends StatefulWidget> on State<T> {
  void waitForScreen(VoidCallback onComplete) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      onComplete.call();
    });
  }
}
