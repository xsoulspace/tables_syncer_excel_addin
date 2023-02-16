import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/src/query_builder.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FirestoreReorderableListView<Document>
    extends FirestoreQueryBuilder<Document> {
  /// {@macro firebase_ui.firestoreReordarablelistview}
  FirestoreReorderableListView({
    required super.query,
    required final FirestoreItemBuilder<Document> itemBuilder,
    required final void Function(
      int oldIndex,
      int newIndex,
      List<QueryDocumentSnapshot<Document>>,
    )
        onReorder,
    super.key,
    super.pageSize,
    final FirestoreLoadingBuilder? loadingBuilder,
    final FirestoreErrorBuilder? errorBuilder,
    final FirestoreEmptyBuilder? emptyBuilder,
    final Axis scrollDirection = Axis.vertical,
    final bool reverse = false,
    final ScrollController? controller,
    final bool? primary,
    final ScrollPhysics? physics,
    final bool shrinkWrap = false,
    final EdgeInsets? padding,
    final double? itemExtent,
    final Widget? prototypeItem,
    final double? cacheExtent,
    final DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    final String? restorationId,
    final Clip clipBehavior = Clip.hardEdge,
  }) : super(
          builder: (final context, final snapshot, final _) {
            if (snapshot.isFetching) {
              return loadingBuilder?.call(context) ??
                  const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError && errorBuilder != null) {
              return errorBuilder(
                context,
                snapshot.error!,
                snapshot.stackTrace!,
              );
            }

            if (snapshot.docs.isEmpty && emptyBuilder != null) {
              return emptyBuilder(context);
            }

            return ReorderableListView.builder(
              onReorder: (final oldIndex, final newIndex) {
                onReorder(oldIndex, newIndex, snapshot.docs);
              },
              itemCount: snapshot.docs.length,
              itemBuilder: (final context, final index) {
                final isLastItem = index + 1 == snapshot.docs.length;
                if (isLastItem && snapshot.hasMore) snapshot.fetchMore();

                final doc = snapshot.docs[index];
                return itemBuilder(context, doc);
              },
              scrollDirection: scrollDirection,
              reverse: reverse,
              scrollController: controller,
              primary: primary,
              physics: physics,
              shrinkWrap: shrinkWrap,
              padding: padding,
              itemExtent: itemExtent,
              prototypeItem: prototypeItem,
              cacheExtent: cacheExtent,
              dragStartBehavior: dragStartBehavior,
              keyboardDismissBehavior: keyboardDismissBehavior,
              restorationId: restorationId,
              clipBehavior: clipBehavior,
            );
          },
        );
}
