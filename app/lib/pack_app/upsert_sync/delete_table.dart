import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_core/ts_core.dart';

Future<void> showDeleteTableDialog(
  final BuildContext context, {
  required final TableParamsModel table,
}) {
  return showDialog<TableParamsModel>(
    context: context,
    builder: (final context) {
      return _DialogWindow(
        table: table,
      );
    },
  );
}

class _DialogWindow extends StatelessWidget {
  const _DialogWindow({
    required this.table,
  });
  final TableParamsModel table;
  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final apiServices = context.read<ApiServices>();
    return AlertDialog(
      insetPadding: const EdgeInsets.all(8),
      title: Text('Are you sure you want to delete Table ${table.name}?'),
      content: const Text(
        'In case if the table will be deleted, '
        'all associated syncs will be not possible to use!\n',
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
          onPressed: () {
            apiServices.tables.deleteTable(table);
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
