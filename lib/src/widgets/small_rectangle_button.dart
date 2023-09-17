import 'package:flutter/material.dart';

/// {@template small_rectangle_button}
/// A simple square button.
/// {@endtemplate}
class SmallRectangleButton<T> extends StatefulWidget {
  /// {@macro small_rectangle_button}
  const SmallRectangleButton({
    required this.onPress,
    required this.onRelease,
    this.color = Colors.grey,
    this.pressedColor = Colors.black,
    this.child,
    super.key,
  });

  /// The button that represents the up button.
  final Color color;

  /// The button that represents the pressed button.
  final Color pressedColor;

  /// The child of the button.
  final Widget? child;

  /// Called when the button is pressed.
  final VoidCallback onPress;

  /// Called when the button is released.
  final VoidCallback onRelease;

  @override
  State<SmallRectangleButton<T>> createState() =>
      _SmallRectangleButtonState<T>();
}

class _SmallRectangleButtonState<T> extends State<SmallRectangleButton<T>> {
  var _isPressed = false;

  @override
  Widget build(BuildContext context) {
    const borderSize = 4.0;
    return GestureDetector(
      onTapDown: (_) {
        widget.onPress();
        setState(() => _isPressed = true);
      },
      onTapUp: (_) {
        widget.onRelease();
        setState(() => _isPressed = false);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (widget.child != null)
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: widget.color,
                  border: Border(
                    bottom: !_isPressed
                        ? BorderSide(
                            color: widget.pressedColor,
                            width: borderSize,
                          )
                        : BorderSide.none,
                    top: _isPressed
                        ? BorderSide(
                            color: widget.pressedColor,
                            width: borderSize,
                          )
                        : BorderSide.none,
                  ),
                ),
              ),
            ),
          Positioned(
            top: -20,
            child: widget.child!,
          ),
        ],
      ),
    );
  }
}
