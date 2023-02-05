import 'package:flutter/material.dart';

class UiListTile extends StatelessWidget {
  const UiListTile({
    required this.leading,
    required this.title,
    this.trailing,
    this.subtitle,
    super.key,
  });
  final Widget leading;
  final Widget? trailing;
  final Widget title;
  final Widget? subtitle;
  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 12,
            end: 14,
          ),
          child: leading,
        ),
        Expanded(
          child: DefaultTextStyle(
            style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16),
            child: title,
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class DefaultCard extends StatelessWidget {
  const DefaultCard({
    required this.child,
    super.key,
  });
  final Widget child;
  @override
  Widget build(final BuildContext context) {
    return Card(
      child: child,
    );
  }
}
