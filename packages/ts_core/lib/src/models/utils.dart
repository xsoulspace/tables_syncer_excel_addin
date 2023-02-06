part of 'models.dart';

DateTime fromTimestamp(final Timestamp timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
}

Timestamp toTimestamp(final DateTime dateTime) {
  return Timestamp.fromMillisecondsSinceEpoch(dateTime.millisecondsSinceEpoch);
}

DateTime? fromMaybeTimestamp(final Timestamp? timestamp) {
  if (timestamp == null) return null;
  return DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
}

Timestamp? toMaybeTimestamp(final DateTime? dateTime) {
  if (dateTime == null) return null;
  return Timestamp.fromMillisecondsSinceEpoch(dateTime.millisecondsSinceEpoch);
}
