part of 'std_bloc.dart';

@immutable
sealed class StdState {}

sealed class StdActionState extends StdState {}

final class StdInitial extends StdState {}

class StdButtonClickedState extends StdActionState {}

class StdHeartState extends StdState {
  final bool isFilled;
  StdHeartState({required this.isFilled});
}
