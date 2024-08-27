import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_connection_event.dart';
part 'internet_connection_state.dart';

late StreamSubscription? _subscription;

class InternetConnectionBloc
    extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  InternetConnectionBloc() : super(InternetConnectionInitial()) {
    on<InternetConnectionEvent>((event, emit) {
      if (event is InternetConnected) {
        emit(ConnectedState(
            message:
                "Internet's Connected.")); // 2 // emits the State with message to the Event
      } else {
        emit(DisconnectedState(message: "Internet's Disconnected."));
      }
    });

    _subscription = Connectivity().onConnectivityChanged.listen(
      (result) {
        if (result.contains(ConnectivityResult.wifi) ||
            result.contains(ConnectivityResult.mobile)) {
              print(result);
          add(InternetConnected()); // 1
        } else {
          add(InternetDisconnected());
        }
      },
    );
  }

  @override
  Future<void> close() {
    _subscription!.cancel();
    return super.close();
  }
}
