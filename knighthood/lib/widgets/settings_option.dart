import 'package:flutter/material.dart';

class SettingsOption extends StatefulWidget {
  const SettingsOption({super.key, required this.title, required this.setting});

  final String title;
  final Widget setting;

  @override
  State<SettingsOption> createState() => _SettingsOptionState();
}

class _SettingsOptionState extends State<SettingsOption> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(widget.title),
        widget.setting,
      ],
    );
  }
}
