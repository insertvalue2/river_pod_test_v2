import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';

// 창고 관리자가 관리하는 상태
class TodoViewModel extends StateNotifier<Todo> {
  // 부모 클래스  StateNotifier 에게 관리할 데이터를 넘긴다.
  TodoViewModel() : super(Todo(true, "공부하기"));

  // 기능 추가
  void toggleIsCompleted() {
    // 멤버로 state 를 가지고 있다. state는 StateNotifier 관리 하는 객체, 값 (상태)
    state = Todo(!state.isCompleted, state.description);
  }
}

// 창고 관리자
final todoViewModelProvider = StateNotifierProvider<TodoViewModel, Todo>((ref) {
  return TodoViewModel();
});
