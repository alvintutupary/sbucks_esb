import 'package:flutter/material.dart';

class SimpleStreamBuilder<T> extends StatelessWidget {
  final T initialData;
  final Stream<T> stream;
  final bool asSliver;
  final Widget Function(BuildContext context) onLoading;
  final Widget Function(BuildContext context, String message) onError;
  final Widget Function(BuildContext context, T data) onComplete;

  const SimpleStreamBuilder({
    this.initialData,
    @required this.stream,
    this.asSliver = false,
    this.onLoading,
    this.onError,
    this.onComplete,
  });

  Widget _buildSizedBox() {
    return asSliver ? SliverToBoxAdapter(child: SizedBox()) : SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      initialData: this.initialData,
      stream: this.stream,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (!snapshot.hasData) {
          // @Notes: Handle initialData exists, emit initialData to onComplete.
          if (this.initialData != null) {
            return this.onComplete != null
                ? this.onComplete(context, this.initialData)
                : _buildSizedBox();
          }

          return this.onLoading != null
              ? this.onLoading(context)
              : _buildSizedBox();
        }

        if (snapshot.hasError) {
          return this.onError != null
              ? this.onError(context, snapshot.error)
              : _buildSizedBox();
        }

        return this.onComplete != null
            ? this.onComplete(context, snapshot.data)
            : _buildSizedBox();
      },
    );
  }
}
