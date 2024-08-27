part of 'internet_connection_bloc.dart';

@immutable
sealed class InternetConnectionEvent {}

class InternetConnected extends InternetConnectionEvent {}

class InternetDisconnected extends InternetConnectionEvent {}
