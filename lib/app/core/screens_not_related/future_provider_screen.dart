import 'dart:developer';

import 'package:salefny/app/core/api_helpers/exceptions.dart';
import 'package:salefny/app/core/screens_not_related/no_internet_screen.dart';
import 'package:salefny/app/core/screens_not_related/server_error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension ONExt on WidgetRef {
  Widget watchWhen<T>({
    bool skipError = false,
    Widget Function()? loading,
    bool skipLoadingOnReload = false,
    bool skipLoadingOnRefresh = true,
    required Widget Function(T data) data,
    required ProviderBase<AsyncValue<T>> provider,
    Widget Function(Object error, StackTrace stackTrace)? error,
  }) {
    return watch(provider).when(
      data: data,
      skipError: skipError,
      skipLoadingOnReload: skipLoadingOnReload,
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      error: error ??
          (e, s) {
            log(e.toString(), stackTrace: s, name: 'watchWhen');
            return e is NoInternetConnection
                ? NoInternetScreen(
                    isLoading: watch(provider).isLoading,
                    onRetry: () => invalidate(provider),
                  )
                : ServerErrorScreen(
                    isLoading: watch(provider).isLoading,
                    onRetry: () => invalidate(provider),
                  );
          },
      loading: loading ??
          () => const Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
