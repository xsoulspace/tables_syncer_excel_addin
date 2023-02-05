part of 'tables_sync_bloc.dart';

@immutable
abstract class TablesSyncEvent extends Equatable {
  const TablesSyncEvent();
  @override
  List<Object?> get props => [];
}

@immutable
class TablesSyncInitEvent extends TablesSyncEvent {
  const TablesSyncInitEvent({
    this.syncId,
  });
  final TablesSyncParamsModelId? syncId;
}

@immutable
class TablesSyncSaveEvent extends TablesSyncEvent {
  const TablesSyncSaveEvent();
}

@immutable
class TablesSyncAddColumnNameEvent extends TablesSyncEvent {
  const TablesSyncAddColumnNameEvent();
}

@immutable
class TablesSyncDeleteColumnNameEvent extends TablesSyncEvent {
  const TablesSyncDeleteColumnNameEvent({
    required this.columnName,
  });
  final String columnName;
}

@immutable
class TablesSyncAddDestinationTableEvent extends TablesSyncEvent {
  const TablesSyncAddDestinationTableEvent({
    required this.table,
  });
  final TableParamsModel table;
}

@immutable
class TablesSyncDeleteDestinationTableEvent extends TablesSyncEvent {
  const TablesSyncDeleteDestinationTableEvent({
    required this.table,
  });
  final TableParamsModel table;
}

@immutable
class TablesSyncSelectSourceTableEvent extends TablesSyncEvent {
  const TablesSyncSelectSourceTableEvent({
    required this.table,
  });
  final TableParamsModel? table;
}

@immutable
class TablesSyncShouldUpdateValuesTableEvent extends TablesSyncEvent {
  const TablesSyncShouldUpdateValuesTableEvent({
    required this.shouldUpdate,
  });
  final bool shouldUpdate;
}

@immutable
class TablesSyncShouldAddNewValuesTableEvent extends TablesSyncEvent {
  const TablesSyncShouldAddNewValuesTableEvent({
    required this.shouldAdd,
  });
  final bool shouldAdd;
}
