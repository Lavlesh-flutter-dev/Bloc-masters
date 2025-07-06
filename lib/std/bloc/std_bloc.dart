import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'std_event.dart';
part 'std_state.dart';

class StdBloc extends Bloc<StdEvent, StdState> {
  StdBloc() : super(StdInitial()) {
    on<StdClickHeartEvent>(stdClickHeartEvent);
    on<StdNavigationEvent>(stdNavigationEvent);
  }

  bool isHeartFilled = false;

  FutureOr<void> stdClickHeartEvent(
    StdClickHeartEvent event,
    Emitter<StdState> emit,
  ) {
    isHeartFilled = !isHeartFilled;
    emit(StdHeartState(isFilled: isHeartFilled));
  }

  FutureOr<void> stdNavigationEvent(
    StdNavigationEvent event,
    Emitter<StdState> emit,
  ) {
    emit(StdButtonClickedState());
  }
}
