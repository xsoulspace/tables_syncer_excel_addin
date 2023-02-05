import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_core/ts_core.dart';

Future<void> showDeleteTablesSyncDialog(
  final BuildContext context, {
  required final TablesSyncParamsModel tablesSync,
}) {
  return showDialog<TableParamsModel>(
    context: context,
    builder: (final context) {
      return _DialogWindow(
        tablesSync: tablesSync,
      );
    },
  );
}

class _DialogWindow extends StatelessWidget {
  const _DialogWindow({
    required this.tablesSync,
  });
  final TablesSyncParamsModel tablesSync;
  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final apiServices = context.read<ApiServices>();
    return AlertDialog(
      insetPadding: const EdgeInsets.all(8),
      title: Text(
        'Are you sure you want to delete Table Sync ${tablesSync.name}?',
      ),
      content: const Text(
        'You still will be able to use , \n'
        'all associated syncs will be not possible to use!',
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
          onPressed: () {
            apiServices.tablesSync.deleteTableSync(tablesSync);
            Navigator.pop(context);
          },
          child: Text(
            'Delete',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.error,
            ),
          ),
        ),
        FilledButton.tonal(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        )
      ],
    );
  }
}
