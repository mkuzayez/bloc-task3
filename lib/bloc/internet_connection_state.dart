part of 'internet_connection_bloc.dart';

@immutable

sealed class InternetConnectionState {}

final class InternetConnectionInitial extends InternetConnectionState {}


class ConnectedState extends InternetConnectionState {
  final String message;

  ConnectedState({required this.message});

}

class DisconnectedState extends InternetConnectionState {
  final String message;

  DisconnectedState({required this.message});

}