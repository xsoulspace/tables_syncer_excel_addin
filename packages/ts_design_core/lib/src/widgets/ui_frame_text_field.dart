import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiFrameTextField extends StatelessWidget {
  const UiFrameTextField({
    required this.controller,
    required this.hintText,
    required this.onSubmitted,
    required this.keyFocusNode,
    this.onEnterPressed,
    this.textFieldFocusNode,
    final Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onEnterPressed;
  final VoidCallback? onSubmitted;
  final FocusNode keyFocusNode;
  final FocusNode? textFieldFocusNode;

  @override
  Widget build(final BuildContext context) {
    const height = 34.0;
    const width = 88.0;
    final theme = Theme.of(context);
    return RawKeyboardListener(
      focusNode: keyFocusNode,
      onKey: (final event) {
        if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
          onEnterPressed?.call();
        }
      },
      child: TextField(
        focusNode: textFieldFocusNode,
        onSubmitted: (final _) => onSubmitted?.call(),
        onEditingComplete: () {},
        style: theme.textTheme.bodyMedium,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          counter: const SizedBox(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          isDense: true,
          hintText: hintText,
        ),
        controller: controller,
      ),
    );
  }
}
