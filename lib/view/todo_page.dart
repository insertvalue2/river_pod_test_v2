import 'package:class_riverpod_v2/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_models/todo_view_model.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoViewModelProvider);

    return Center(
      child: InkWell(
        onTap: () {
          ref.read(todoViewModelProvider.notifier).toggleIsCompleted();
          // todoViewModelProvider -->  StateNotifierProvider(창고 관리자)
          // todoViewModelProvider.notifier --> StateNotifier(인스턴스를 가져오는 속성)
          // ref.read(todoViewModelProvider.notifier).state --> (StateNotifier를 통해 관리되는 상태의 값을 가져오기 위한 표현식입니다. )
          // ref.read(todoViewModelProvider.notifier).state = Todo(false, '운동하기');
        },
        child: Text(
          "완료 : ${todo.isCompleted}, 내용 : ${todo.description}",
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
