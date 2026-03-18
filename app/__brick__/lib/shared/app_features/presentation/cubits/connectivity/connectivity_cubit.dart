import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(const ConnectivityState()) {
    _subscription = Connectivity().onConnectivityChanged.listen(
      _onConnectivityChanged,
    );
  }

  StreamSubscription<List<ConnectivityResult>>? _subscription;

  void _onConnectivityChanged(List<ConnectivityResult> results) {
    final isConnected =
        results.isNotEmpty && !results.contains(ConnectivityResult.none);
    emit(
      state.copyWith(
        status: isConnected
            ? ConnectivityStatus.connected
            : ConnectivityStatus.disconnected,
      ),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
