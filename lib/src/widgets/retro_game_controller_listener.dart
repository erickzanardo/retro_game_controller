import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retro_game_controller/retro_game_controller.dart';

/// An enum that represents the type of event.
enum EventType {
  /// The event is a button press.
  up,

  /// The event is a button release.
  down,
}

/// {@template retro_game_controller_listener}
/// A widget that listen for game controllers like keyboard, gamepads, etc
/// and abstract the key events into an unified API.
/// {@endtemplate}
class RetroGameControllerListerner<T> extends StatefulWidget {
  /// {@macro retro_game_controller_listener}
  const RetroGameControllerListerner({
    required this.child,
    required this.onEvent,
    required this.mapping,
    this.focusNode,
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// The focus node used to listen for key board events.
  ///
  /// When omitted, a new [FocusNode] is created and automatically disposed.
  /// When null, the user of this widget is responsible for disposing it.
  final FocusNode? focusNode;

  /// Called when a button is pressed or released.
  final void Function({
    required String controllerId,
    required EventType type,
    required T button,
  }) onEvent;

  /// The mappings of the controllers.
  final RetroControllerMapping<T> mapping;

  @override
  State<RetroGameControllerListerner<T>> createState() =>
      _RetroGameControllerListernerState();
}

class _RetroGameControllerListernerState<T>
    extends State<RetroGameControllerListerner<T>> {
  late final FocusNode _focusNode = widget.focusNode ?? FocusNode();

  @override
  void initState() {
    super.initState();

    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      onKeyEvent: (_, event) {
        for (final keyboardMapping in widget.mapping.keyboardMapping) {
          for (final entry in keyboardMapping.mapping.entries) {
            if (entry.value == event.logicalKey) {
              if (event is! KeyRepeatEvent) {
                widget.onEvent(
                  controllerId: keyboardMapping.controllerId,
                  type: event is KeyDownEvent ? EventType.down : EventType.up,
                  button: entry.key,
                );
              }

              return KeyEventResult.handled;
            }
          }
        }
        return KeyEventResult.ignored;
      },
      child: widget.child,
    );
  }
}
