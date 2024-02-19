import 'package:flutter/material.dart';

class AppSwitchAdaptative extends StatelessWidget {
  const AppSwitchAdaptative({
    required this.isChecked,
    required this.onChanged,
    super.key,
  });

  final bool isChecked;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      applyCupertinoTheme: false,
      value: isChecked,
      onChanged: onChanged,
    );
  }
}
