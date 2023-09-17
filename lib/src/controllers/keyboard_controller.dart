import 'package:flutter/services.dart';
import 'package:retro_game_controller/retro_game_controller.dart';

/// {@template keyboard_mapping}
/// Maps keyboard keys to a controller.
/// {@endtemplate}
class KeyboardController<T> extends RetroController<T> {
  /// {@macro keyboard_mapping}
  const KeyboardController({
    required this.controllerId,
    required this.mapping,
  });

  /// Id of the controller mapping (e.g. Player1, Player2, etc).
  final String controllerId;

  /// Mapping of the raw events from a keyboard.
  final Map<T, LogicalKeyboardKey> mapping;
}
