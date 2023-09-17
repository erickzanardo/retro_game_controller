import 'package:flutter/material.dart';

/// {@template simple_square_button}
/// A simple square button.
/// {@endtemplate}
class SimpleSquareButton<T> extends StatefulWidget {
  /// {@macro simple_square_button}
  const SimpleSquareButton({
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
  State<SimpleSquareButton<T>> createState() => _SimpleSquareButtonState<T>();
}

class _SimpleSquareButtonState<T> extends State<SimpleSquareButton<T>> {
  var _isPressed = false;

  @override
  Widget build(BuildContext context) {
    const borderSize = 8.0;
    return GestureDetector(
      onTapDown: (_) {
        widget.onPress();
        setState(() => _isPressed = true);
      },
      onTapUp: (_) {
        widget.onRelease();
        setState(() => _isPressed = false);
      },
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
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: _isPressed ? borderSize : 0,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
