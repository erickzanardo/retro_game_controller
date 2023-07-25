import 'package:flutter/services.dart';

/// {@template retro_controller_mapping}
/// A class that maps raw events to a controller of value<T>.
/// {@endtemplate}
class RetroControllerMapping<T> {
  /// {@macro retro_controller_mapping}
  const RetroControllerMapping({
    required this.keyboardMapping,
  });

  /// Mapping of the raw events from a keyboard.
  final List<KeyboardMapping<T>> keyboardMapping;
}

/// {@template keyboard_mapping}
/// Maps keyboard keys to a controller.
/// {@endtemplate}
class KeyboardMapping<T> {
  /// {@macro keyboard_mapping}
  const KeyboardMapping({
    required this.controllerId,
    required this.mapping,
  });

  /// Id of the controller mapping (e.g. Player1, Player2, etc).
  final String controllerId;

  /// Mapping of the raw events from a keyboard.
  final Map<T, LogicalKeyboardKey> mapping;
}
