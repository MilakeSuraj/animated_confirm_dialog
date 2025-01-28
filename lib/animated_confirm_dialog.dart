library animated_confirm_dialog;

import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Displays a customizable confirmation dialog with optional 3D flip animations.
///
/// The dialog includes title, message, cancel/confirm buttons, and customizable
/// colors and behaviors.
///
/// [context]: The `BuildContext` to display the dialog in.
/// [title]: The title of the dialog.
/// [message]: The message displayed in the dialog.
/// [cancelButtonText]: The text for the cancel button.
/// [confirmButtonText]: The text for the confirm button.
/// [backgroundColor]: The background color of the dialog.
/// [titleColor]: The color of the title text.
/// [messageColor]: The color of the message text.
/// [cancelButtonColor]: The color of the cancel button.
/// [cancelButtonTextColor]: The text color of the cancel button.
/// [confirmButtonColor]: The color of the confirm button.
/// [confirmButtonTextColor]: The text color of the confirm button.
/// [onCancel]: Callback when the cancel button is pressed.
/// [onConfirm]: Callback when the confirm button is pressed.
/// [isFlip]: Whether the dialog should include a 3D flip animation.
/// [dismissible]: Whether tapping outside dismisses the dialog.
void showCustomDialog({
  required BuildContext context,
  String title = 'Logout Confirmation',
  String message = 'Are you sure you want to log out?',
  String cancelButtonText = 'Cancel',
  String confirmButtonText = 'Logout',
  Color backgroundColor = const Color(0xFFF5F5F5),
  Color titleColor = const Color(0xFF000000),
  Color messageColor = const Color(0xFF000000),
  Color cancelButtonColor = const Color(0xFF007BFF),
  Color cancelButtonTextColor = Colors.white,
  Color confirmButtonColor = Colors.white,
  Color confirmButtonTextColor = const Color(0xFF007BFF),
  required VoidCallback onCancel,
  required VoidCallback onConfirm,
  bool isFlip = false,
  bool dismissible = true,
}) {
  Widget dialog = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7.37),
    ),
    backgroundColor: backgroundColor,
    child: SizedBox(
      width: 257,
      height: 175.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 187,
            height: 23,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.28,
                fontWeight: FontWeight.w800,
                color: titleColor,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            message,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: messageColor,
            ),
          ),
          const SizedBox(height: 32.49),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: onCancel,
                child: Container(
                  width: 83.93,
                  height: 31.36,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: cancelButtonColor.withOpacity(0.3)),
                    color: cancelButtonColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(9),
                      bottomLeft: Radius.circular(9),
                      topLeft: Radius.circular(3),
                      bottomRight: Radius.circular(3),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      cancelButtonText,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: cancelButtonTextColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14.76),
              InkWell(
                onTap: onConfirm,
                child: Container(
                  width: 85.78,
                  height: 31.36,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: confirmButtonColor.withOpacity(0.3)),
                    color: confirmButtonColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(9),
                      bottomLeft: Radius.circular(9),
                      topLeft: Radius.circular(3),
                      bottomRight: Radius.circular(3),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      confirmButtonText,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: confirmButtonTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  showAnimatedDialog(
    context: context,
    dialog: dialog,
    isFlip: isFlip,
    dismissible: dismissible,
  );
}

/// Displays a custom animated dialog with optional 3D flip animations.
///
/// [context]: The `BuildContext` to display the dialog in.
/// [dialog]: The dialog widget to display.
/// [isFlip]: Whether the dialog includes a 3D flip animation.
/// [dismissible]: Whether tapping outside dismisses the dialog.
void showAnimatedDialog({
  required BuildContext context,
  required Widget dialog,
  bool isFlip = false,
  bool dismissible = true,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: dismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (context, animation1, animation2) => dialog,
    transitionDuration: const Duration(milliseconds: 500),
    transitionBuilder: (context, a1, a2, widget) {
      if (isFlip) {
        return Rotation3DTransition(
          alignment: Alignment.center,
          turns: Tween<double>(begin: math.pi, end: 2.0 * math.pi).animate(
            CurvedAnimation(
              parent: a1,
              curve: const Interval(0.0, 1.0, curve: Curves.linear),
            ),
          ),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: a1,
                curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
              ),
            ),
            child: widget,
          ),
        );
      } else {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: widget,
          ),
        );
      }
    },
  );
}

/// A widget that applies a 3D rotation transition effect to its child widget.
///
/// [turns]: The animation controlling the rotation.
/// [alignment]: The alignment for the rotation effect.
/// [child]: The child widget to be rotated.
class Rotation3DTransition extends AnimatedWidget {
  /// Creates a 3D rotation transition.
  const Rotation3DTransition({
    super.key,
    required this.turns,
    this.alignment = Alignment.center,
    required this.child,
  }) : super(listenable: turns);

  /// The animation controlling the rotation.
  final Animation<double> turns;

  /// The alignment for the rotation effect.
  final Alignment alignment;

  /// The child widget to be rotated.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double turnsValue = turns.value;
    final Matrix4 transform = Matrix4.identity()
      ..setEntry(3, 2, 0.0006)
      ..rotateY(turnsValue);
    return Transform(
      transform: transform,
      alignment: alignment,
      child: child,
    );
  }
}
