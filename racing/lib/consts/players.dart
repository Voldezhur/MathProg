import 'package:flutter/material.dart';
import 'package:racing/models/player.dart';

List<Player> players = [
  Player(
    name: 'Игрок 1',
    color: Colors.blue,
    skill: 10,
  ),
  Player(
    name: 'Игрок 2',
    color: Colors.red,
    skill: 30,
  ),
  Player(
    name: 'Игрок 3',
    color: Colors.purple,
    skill: 50,
  ),
  Player(
    name: 'Игрок 4',
    color: Colors.green,
    skill: 15,
  ),
  Player(
    name: 'Игрок 5',
    color: Colors.yellow,
    skill: 30,
  ),
];

Player currentPlayer = players[0];
