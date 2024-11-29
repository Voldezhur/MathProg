import 'package:flutter/material.dart';
import 'package:knighthood/globals/settings.dart';
import 'package:knighthood/widgets/settings_option.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: Column(
        children: [
          SettingsOption(
            title: 'Цвет игрока',
            setting: Column(
              children: [
                ElevatedButton(
                  onPressed: () => {playerColor = Colors.blue},
                  child: const Text('Синий'),
                ),
                ElevatedButton(
                  onPressed: () => {playerColor = Colors.purple},
                  child: const Text('Фиолетовый'),
                ),
                ElevatedButton(
                  onPressed: () => {playerColor = Colors.green},
                  child: const Text('Зеленый'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
