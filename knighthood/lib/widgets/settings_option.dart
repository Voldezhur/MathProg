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
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title),
          widget.setting,
        ],
      ),
    );
  }
}
