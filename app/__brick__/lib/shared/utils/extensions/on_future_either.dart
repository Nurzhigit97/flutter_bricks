import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Generic extension for `Future<Either<L, R>>`. Use for any L, R (e.g. [String], [T]).
extension OnFutureEitherGeneric<L, R> on Future<Either<L, R>> {
  /// Awaits this future and runs [onLeft] or [onRight] with the result. Returns [Future<void>].
  Future<void> foldVoid(
    void Function(L) onLeft,
    void Function(R) onRight,
  ) async {
    final result = await this;
    result.fold(onLeft, onRight);
  }

  /// Awaits, runs [onSuccess] with the right value if present, then returns the same result.
  Future<Either<L, R>> onSuccess(void Function(R) onSuccess) async {
    final result = await this;
    result.fold((_) {
      return;
    }, (right) => onSuccess(right));

    return result;
  }

  /// Awaits, runs [onFailure] with the left value if present, then returns the same result.
  Future<Either<L, R>> onFailure(void Function(L) onFailure) async {
    final result = await this;
    result.fold((left) => onFailure(left), (_) {
      return;
    });

    return result;
  }
}

extension OnFutureEither<R> on Future<Either<String, R>> {
  /// Shows loading/success/error feedback via [AppOverlay].
  /// [context] is required for all snackbar calls.
  /// If [onSuccess] is provided, it runs on right after showing [successMessage] (if any).
  /// If [onFailure] is provided, it runs on left after showing error (if [showError]).
  Future<Either<String, R>> withSnackBar(
    BuildContext context, {
    String? loadingMessage,
    String? successMessage,
    String? errorMessage,
    void Function(R)? onSuccess,
    VoidCallback? onFailure,
    bool showLoading = true,
    bool showError = true,
  }) async {
    if (showLoading) {
      EasyLoading.show(status: loadingMessage ?? 'Загрузка...');
    }
    final result = await this;
    if (showLoading) {
      EasyLoading.dismiss();
    }

    result.fold(
      (error) {
        if (showError) {
          EasyLoading.showError(errorMessage ?? error);
        }
        onFailure?.call();
      },
      (right) {
        if (successMessage != null) {
          EasyLoading.showSuccess(successMessage);
        }
        onSuccess?.call(right);
      },
    );

    return result;
  }
}
