part of 'std_bloc.dart';

@immutable
sealed class StdEvent {}


class StdClickHeartEvent extends StdEvent {}

class StdNavigationEvent extends StdEvent {}
