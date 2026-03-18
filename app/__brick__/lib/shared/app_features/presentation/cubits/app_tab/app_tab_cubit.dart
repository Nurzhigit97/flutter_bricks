// Cubit для управления табами
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTabCubit extends Cubit<CustomTabState> {
  CustomTabCubit({int? currentIndex})
    : super(CustomTabState(currentIndex: currentIndex ?? 0));

  void changeTab(int index) {
    if (state.currentIndex != index) {
      emit(CustomTabState(currentIndex: index));
    }
  }

  void reset() {
    emit(CustomTabState(currentIndex: 0));
  }
}

// State для табов
class CustomTabState {
  final int currentIndex;

  CustomTabState({required this.currentIndex});
}
