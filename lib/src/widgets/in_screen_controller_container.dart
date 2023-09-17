import 'package:flutter/material.dart';
import 'package:retro_game_controller/retro_game_controller.dart';

/// {@template in_screen_controller_container}
/// A widget that contains a [InScreenController] and render its actions.
/// {@endtemplate}
class InScreenControllerContainer<T> extends StatelessWidget {
  /// {@macro in_screen_controller_container}
  const InScreenControllerContainer({
    required this.controller,
    required this.onEvent,
    super.key,
  });

  /// The controller that contains the actions.
  final InScreenController<T> controller;

  /// Called when a button is pressed or released.
  final void Function(EventType type, T button) onEvent;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final buttonSize = constraints.maxWidth * controller.buttonProportion;

        final padding = buttonSize / 2;

        final dpads = controller.actions.whereType<DpadAction<T>>().toList();
        final actions = controller.actions
            .whereType<ButtonAction<T>>()
            .toList()
            .reversed
            .toList();

        final centerButtons =
            controller.actions.whereType<CenterButtonAction<T>>().toList();

        return Opacity(
          opacity: controller.opacity,
          child: Stack(
            children: [
              if (dpads.isNotEmpty)
                Positioned(
                  bottom: padding,
                  left: padding,
                  child: SizedBox(
                    width: buttonSize * 3,
                    height: buttonSize * 3,
                    child: dpads.first.build(
                      context,
                      onEvent,
                      controller,
                    ),
                  ),
                ),
              for (int i = 0; i < actions.length; i++)
                Positioned(
                  right: padding + (buttonSize * 1.2) * i,
                  bottom: padding,
                  child: SizedBox(
                    width: buttonSize,
                    height: buttonSize,
                    child: actions[i].build(
                      context,
                      onEvent,
                      controller,
                    ),
                  ),
                ),
              if (centerButtons.isNotEmpty)
                Positioned(
                  left: (constraints.maxWidth -
                          buttonSize * centerButtons.length) /
                      2,
                  bottom: padding,
                  child: SizedBox(
                    width: buttonSize * centerButtons.length * 1.2,
                    height: buttonSize * controller.centerButtonProportion,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (int i = 0; i < centerButtons.length; i++)
                          SizedBox(
                            width: buttonSize,
                            child: centerButtons[i].build(
                              context,
                              onEvent,
                              controller,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
