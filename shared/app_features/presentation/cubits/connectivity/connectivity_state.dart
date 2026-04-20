part of 'connectivity_cubit.dart';

enum ConnectivityStatus { unknown, connected, disconnected }

class ConnectivityState extends Equatable {
  const ConnectivityState({this.status = ConnectivityStatus.unknown});

  final ConnectivityStatus status;

  bool get isConnected => status == ConnectivityStatus.connected;
  bool get isDisconnected => status == ConnectivityStatus.disconnected;

  ConnectivityState copyWith({ConnectivityStatus? status}) {
    return ConnectivityState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];
}
