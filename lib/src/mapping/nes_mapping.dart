import 'package:flutter/services.dart';
import 'package:retro_game_controller/src/retro_game_controller.dart';

/// Represents the buttons of a NES controller.
enum NesButton {
  /// Up button.
  up,

  /// Down button.
  down,

  /// Left button.
  left,

  /// Right button.
  right,

  /// A button.
  a,

  /// B button.
  b,

  /// Select button.
  select,

  /// Start button.
  start,
}

/// Mapping of the NES controller.
/// Represents the "Player1" controller.
const nesMapping = RetroControllerMapping<NesButton>(
  keyboardMapping: [
    KeyboardMapping<NesButton>(
      controllerId: 'Player1',
      mapping: {
        NesButton.up: LogicalKeyboardKey.keyW,
        NesButton.down: LogicalKeyboardKey.keyS,
        NesButton.left: LogicalKeyboardKey.keyA,
        NesButton.right: LogicalKeyboardKey.keyD,
        NesButton.b: LogicalKeyboardKey.keyG,
        NesButton.a: LogicalKeyboardKey.keyH,
        NesButton.select: LogicalKeyboardKey.keyC,
        NesButton.start: LogicalKeyboardKey.keyV,
      },
    ),
    KeyboardMapping<NesButton>(
      controllerId: 'Player2',
      mapping: {
        NesButton.up: LogicalKeyboardKey.arrowUp,
        NesButton.down: LogicalKeyboardKey.arrowDown,
        NesButton.left: LogicalKeyboardKey.arrowLeft,
        NesButton.right: LogicalKeyboardKey.arrowRight,
        NesButton.b: LogicalKeyboardKey.keyK,
        NesButton.a: LogicalKeyboardKey.keyL,
        NesButton.select: LogicalKeyboardKey.keyN,
        NesButton.start: LogicalKeyboardKey.keyM,
      },
    ),
  ],
);
