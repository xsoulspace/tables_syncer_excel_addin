import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [Text(r'At least it works ¯\_(ツ)_/¯')],
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgress(),
          ],
        ),
      ),
    );
  }
}

class CircularProgress extends StatelessWidget {
  const CircularProgress({
    this.dimension = 24,
    super.key,
  });
  final double? dimension;
  @override
  Widget build(final BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: const CircularProgressIndicator.adaptive(),
    );
  }
}
