part of 'create_sync_bloc.dart';

@immutable
abstract class CreateSyncEvent extends Equatable {
  const CreateSyncEvent();
  @override
  List<Object?> get props => [];
}

@immutable
class CreateSyncInitEvent extends CreateSyncEvent {
  const CreateSyncInitEvent();
}
