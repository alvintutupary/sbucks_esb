import 'package:flutter/material.dart';
import 'package:sbucks/src/models/api_response_model.dart';

class CustomStreamBuilder<T> extends StatelessWidget {
  final ApiResponse<T> initialData;
  final Stream<ApiResponse<T>> stream;
  final bool asSliver;
  final Widget Function(BuildContext context) onNoData;
  final Widget Function(BuildContext context, T data) onLoading;
  final Widget Function(BuildContext context, T data) onComplete;
  final Widget Function(BuildContext context, String message) onError;
  final Widget Function(BuildContext context, T data) onNotComplete;
  final Widget Function(BuildContext context, Status status, T data) onHasData;

  /// The [stream] must not be null and must be type of [ApiResponse].
  ///
  /// The [onNoData] handles !snapshot.hasData.
  ///
  /// The [onNotComplete] overrides [onNoData], [onLoading] and [onError].
  /// Can be used when [onNoData], [onLoading] and [onError] do not really matter.
  ///
  /// The [onHasData] overrides [onLoading] and [onComplete] as long the data is not null.
  /// Can be used when [onLoading] and [onComplete] both have data.
  const CustomStreamBuilder({
    this.initialData,
    @required this.stream,
    this.asSliver = false,
    this.onNoData,
    this.onLoading,
    this.onComplete,
    this.onError,
    this.onNotComplete,
    this.onHasData,
  });

  Widget _buildSizedBox() {
    return asSliver ? SliverToBoxAdapter(child: SizedBox()) : SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ApiResponse<T>>(
      initialData: this.initialData,
      stream: this.stream,
      builder: (BuildContext context, AsyncSnapshot<ApiResponse<T>> snapshot) {
        if (snapshot.hasData) {
          /// Handle status not complete and onNotComplete is not null.
          if (snapshot.data.status != Status.COMPLETE &&
              this.onNotComplete != null) {
            return this.onNotComplete(context, snapshot.data.body);
          }

          /// Handle has data, aka. snapshot.data.body != null.
          if (snapshot.data.status != Status.ERROR &&
              snapshot.data.body != null &&
              this.onHasData != null) {
            return this
                .onHasData(context, snapshot.data.status, snapshot.data.body);
          }

          switch (snapshot.data.status) {

            /// Handle loading
            case Status.LOADING:
              if (snapshot.data.body == null && this.onNoData != null) {
                return this.onNoData(context);
              }
              return this.onLoading != null
                  ? this.onLoading(context, snapshot.data.body)
                  : _buildSizedBox();
              break;

            /// Handle complete
            case Status.COMPLETE:
              return this.onComplete != null
                  ? this.onComplete(context, snapshot.data.body)
                  : _buildSizedBox();
              break;

            /// Handle error
            case Status.ERROR:
              return this.onError != null
                  ? this.onError(context, snapshot.data.message)
                  : _buildSizedBox();
              break;
            default:
          }
        }

        /// Handle initialData exists, emit initialData to onComplete.
        if (this.initialData != null) {
          return this.onComplete != null
              ? this.onComplete(context, this.initialData.body)
              : _buildSizedBox();
        }

        /// Handle no data and onNotComplete exists.
        if (this.onNotComplete != null) {
          return this.onNotComplete(context, null);
        }

        return this.onNoData != null
            ? this.onNoData(context)
            : _buildSizedBox();
      },
    );
  }
}
