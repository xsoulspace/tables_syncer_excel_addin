import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:office_addin_helper/office_addin_helper.dart';
import 'package:provider/provider.dart';
import 'package:ts_core/ts_core.dart';
import 'package:ts_design_core/ts_design_core.dart';

part 'upsert_table_state.dart';

Future<TableParamsModel?> showUpsertTableDialog(
  final BuildContext context, {
  final TableParamsModel? initialTableParams,
}) {
  return showDialog<TableParamsModel>(
    context: context,
    builder: (final context) {
      return _DialogWindow(
        initialTableParams: initialTableParams,
      );
    },
  );
}

class _DialogWindow extends HookWidget {
  const _DialogWindow({
    required this.initialTableParams,
  });
  final TableParamsModel? initialTableParams;
  @override
  Widget build(final BuildContext context) {
    final state = useTableParamsState(
      read: context.read,
      initialTableParams: initialTableParams,
    );
    final theme = Theme.of(context);
    final uiTheme = UiTheme.of(context);
    return Form(
      key: state.formHelper.formKey,
      child: SimpleDialog(
        insetPadding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        title: Text(
          initialTableParams?.id != null ? 'Update Table' : 'Create Table',
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        children: [
          uiTheme.verticalBoxes.extraLarge,
          const Text('Top Left Cell Index for Headers'),
          uiTheme.verticalBoxes.large,
          Row(
            children: [
              const Text('Row*'),
              uiTheme.horizontalBoxes.medium,
              Expanded(
                child: TextField(
                  controller: state.headerTopLeftRowIndexController,
                ),
              ),
              const Spacer(),
              const Text('Column*'),
              uiTheme.horizontalBoxes.medium,
              Expanded(
                child: TextField(
                  controller: state.headerTopLeftColumnIndexController,
                ),
              ),
            ],
          ),
          uiTheme.verticalBoxes.extraLarge,
          const Text('Top Left Cell Index for Data'),
          uiTheme.verticalBoxes.medium,
          Row(
            children: [
              const Text('Row*'),
              uiTheme.horizontalBoxes.medium,
              Expanded(
                child: TextField(
                  controller: state.dataTopLeftRowIndexController,
                ),
              ),
              const Spacer(),
              const Text('Column*'),
              uiTheme.horizontalBoxes.medium,
              Expanded(
                child: TextField(
                  controller: state.dataTopLeftColumnIndexController,
                ),
              ),
            ],
          ),
          uiTheme.verticalBoxes.extraLarge,
          TextFormField(
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(
                  labelText: 'Keys Column Name (Optional)',
                  helperMaxLines: 5,
                  helperText:
                      'Is the name of a column, responsible for identificating a row as unqiue item. It can be ID or SKU number.\nIf not specified, then Sync Key Column Name will be used.',
                ),
            controller: state.keysColumnNameController,
          ),
          uiTheme.verticalBoxes.large,
          TextField(
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(
                  labelText: 'Worksheet Name*',
                ),
            controller: state.worksheetNameController,
          ),
          uiTheme.verticalBoxes.large,
          TextField(
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(
                  labelText: 'Table Name (optional)',
                ),
            controller: state.nameController,
          ),
          uiTheme.verticalBoxes.extraLarge,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ValueListenableBuilder(
                valueListenable: state.formHelper.loading,
                builder: (final context, final loading, final child) {
                  return TextButton(
                    onPressed: loading
                        ? null
                        : () {
                            Navigator.pop(context);
                          },
                    child: const Text('Cancel'),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: state.formHelper.loading,
                builder: (final context, final loading, final child) {
                  return FilledButton(
                    onPressed: loading ? null : state.onCreate,
                    child: loading
                        ? const SizedBox.square(
                            dimension: 24,
                            child: CircularProgress(),
                          )
                        : Text(
                            initialTableParams?.id != null ? 'Save' : 'Create',
                          ),
                  );
                },
              ),
            ],
          ),
          uiTheme.verticalBoxes.extraLarge,
        ],
      ),
    );
  }
}
