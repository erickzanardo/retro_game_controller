import 'package:flutter/material.dart';
import 'package:retro_game_controller/retro_game_controller.dart';

/// {@template in_screen_controller}
/// Implements a [RetroController] which uses widgets to trigger
/// controller events.
/// {@endtemplate}
class InScreenController<T> extends RetroController<T> {
  /// {@macro in_screen_controller}
  const InScreenController({
    required this.controllerId,
    required this.actions,
    this.dpadColor = const Color(0xFF847e87),
    this.dpadPressedColor = const Color(0xFF312f32),
    this.centerButtonColor = const Color(0xFF847e87),
    this.centerButtonPressedColor = const Color(0xFF312f32),
    this.buttonColor = const Color(0xFFac3232),
    this.buttonPressedColor = const Color(0xFF651d1d),
    this.buttonProportion = .05,
    this.centerButtonProportion = .5,
    this.opacity = .4,
  });

  /// The id of the controller.
  final String controllerId;

  /// The color of the dpad button;
  final Color dpadColor;

  /// The color of the dpad button when pressed;
  final Color dpadPressedColor;

  /// The color of the center button;
  final Color centerButtonColor;

  /// The color of the dpad button when pressed;
  final Color centerButtonPressedColor;

  /// The color of the button;
  final Color buttonColor;

  /// The color of the button when pressed;
  final Color buttonPressedColor;

  /// The proportion of the buttons button relative to the screen width.
  final double buttonProportion;

  /// The proportion of the center button button relative to result of
  /// [buttonProportion].
  final double centerButtonProportion;

  /// The opacity of the controller in the screen.
  final double opacity;

  /// The actions of the controller.
  final List<InScreenControllerAction<T>> actions;
}

/// {@template in_screen_controller_action}
/// A class that represents the actions of a in screen controller.
/// {@endtemplate}
abstract class InScreenControllerAction<T> {
  /// {@macro in_screen_controller_action}
  const InScreenControllerAction();

  /// The widget that represents the button.
  Widget build(
    BuildContext context,
    void Function(EventType type, T button) onEvent,
    InScreenController<T> controller,
  );
}

/// {@template dpad_action}
/// A class that represents the actions of a dpad.
/// {@endtemplate}
class DpadAction<T> extends InScreenControllerAction<T> {
  /// {@macro dpad_action}
  const DpadAction({
    required this.up,
    required this.down,
    required this.left,
    required this.right,
  });

  /// The button that represents the up button.
  final T up;

  /// The button that represents the down button.
  final T down;

  /// The button that represents the left button.
  final T left;

  /// The button that represents the right button.
  final T right;

  @override
  Widget build(
    BuildContext context,
    void Function(EventType type, T button) onEvent,
    InScreenController<T> controller,
  ) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              const Expanded(child: SizedBox()),
              Expanded(
                child: SimpleSquareButton<T>(
                  color: controller.dpadColor,
                  pressedColor: controller.dpadPressedColor,
                  onPress: () {
                    onEvent(EventType.down, up);
                  },
                  onRelease: () {
                    onEvent(EventType.up, up);
                  },
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: SimpleSquareButton<T>(
                  color: controller.dpadColor,
                  pressedColor: controller.dpadPressedColor,
                  onPress: () {
                    onEvent(EventType.down, left);
                  },
                  onRelease: () {
                    onEvent(EventType.up, left);
                  },
                ),
              ),
              const Expanded(child: SizedBox()),
              Expanded(
                child: SimpleSquareButton<T>(
                  color: controller.dpadColor,
                  pressedColor: controller.dpadPressedColor,
                  onPress: () {
                    onEvent(EventType.down, right);
                  },
                  onRelease: () {
                    onEvent(EventType.up, right);
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              const Expanded(child: SizedBox()),
              Expanded(
                child: SimpleSquareButton<T>(
                  color: controller.dpadColor,
                  pressedColor: controller.dpadPressedColor,
                  onPress: () {
                    onEvent(EventType.down, down);
                  },
                  onRelease: () {
                    onEvent(EventType.up, down);
                  },
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ],
    );
  }
}

/// {@template button_action}
/// A class that represents the actions of a button.
/// {@endtemplate}
class ButtonAction<T> extends InScreenControllerAction<T> {
  /// {@macro button_action}
  const ButtonAction({
    required this.button,
    required this.child,
  });

  /// The button that represents the action.
  final T button;

  /// The widget that represents the button.
  final Widget child;

  @override
  Widget build(
    BuildContext context,
    void Function(EventType type, T button) onEvent,
    InScreenController<T> controller,
  ) {
    return SimpleSquareButton<T>(
      color: controller.buttonColor,
      pressedColor: controller.buttonPressedColor,
      onPress: () {
        onEvent(EventType.down, button);
      },
      onRelease: () {
        onEvent(EventType.up, button);
      },
      child: child,
    );
  }
}

/// {@template center_button_action}
/// A class that represents the actions of a center button.
/// {@endtemplate}
class CenterButtonAction<T> extends InScreenControllerAction<T> {
  /// {@macro center_button_action}
  const CenterButtonAction({
    required this.button,
    required this.child,
  });

  /// The button that represents the action.
  final T button;

  /// The widget that represents the button.
  final Widget child;

  @override
  Widget build(
    BuildContext context,
    void Function(EventType type, T button) onEvent,
    InScreenController<T> controller,
  ) {
    return SmallRectangleButton<T>(
      color: controller.centerButtonColor,
      pressedColor: controller.centerButtonPressedColor,
      onPress: () {
        onEvent(EventType.down, button);
      },
      onRelease: () {
        onEvent(EventType.up, button);
      },
      child: child,
    );
  }
}
