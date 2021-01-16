import 'package:demo/models/todo.dart';
import 'package:demo/providers/todos_api_provider.dart';
import 'package:flutter/widgets.dart';

class TodosRepository extends ChangeNotifier {
  final TodosApiProvider todosApiProvider;

  TodosRepository(this.todosApiProvider);

  List<Todo> todos = [];
  bool loading = false;

  void addTodo(Todo todo) {
    todos.add(todo);
    loading = false;
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    todos.remove(todo);
    notifyListeners();
  }

  void toggleTodo(Todo todo) {
    todo.toggleCompleted();
    notifyListeners();
  }

  Future<void> addRandomTodo() async {
    loading = true;
    notifyListeners();
    final newTodo = await todosApiProvider.getRandomTodo();
    addTodo(newTodo);
  }
}
