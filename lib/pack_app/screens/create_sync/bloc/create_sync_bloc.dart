import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts_core/ts_core.dart';

part 'create_sync_bloc.freezed.dart';
part 'create_sync_bloc_events.dart';
part 'create_sync_bloc_states.dart';

class CreateSyncBloc extends Bloc<CreateSyncEvent, CreateSyncState> {
  CreateSyncBloc() : super(const EmptyCreateSyncState()) {
    on<CreateSyncInitEvent>(_onInit);
  }

  void _onInit(
    final CreateSyncInitEvent event,
    final Emitter<CreateSyncState> state,
  ) {}
}
