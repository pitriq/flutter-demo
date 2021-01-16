import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:demo/models/todo.dart';
import 'package:demo/repositories/todos_repository.dart';
import 'package:demo/screens/basic_screen.dart';
import 'package:demo/screens/new_todo_screen.dart';
import 'package:demo/utils/navigate.dart';
import 'package:demo/widgets/todo_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final repository = Provider.of<TodosRepository>(context);

    return BasicScreen(
      fab: _buildFab(context),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    'My TODOs',
                    style: theme.textTheme.headline2,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                itemCount: repository.todos.length,
                itemBuilder: (context, index) {
                  final todo = repository.todos[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TodoItem(
                      todo: todo,
                      onPressed: () => _onTodoPressed(context, todo),
                      onLongPressed: () => _onLongTodoPressed(context, todo),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFab(BuildContext context) {
    final repository = Provider.of<TodosRepository>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: UniqueKey(),
          mini: true,
          child: _buildRandomFabContent(context),
          onPressed: () => repository.addRandomTodo(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: FloatingActionButton(
            heroTag: UniqueKey(),
            child: Icon(Icons.add),
            onPressed: () => _onFabPressed(context),
          ),
        ),
      ],
    );
  }

  Widget _buildRandomFabContent(BuildContext context) {
    final repository = Provider.of<TodosRepository>(context);
    if (repository.loading) {
      return SizedBox(
        height: 10,
        width: 10,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
          strokeWidth: 2,
        ),
      );
    }
    return Icon(Icons.shuffle);
  }

  void _onTodoPressed(BuildContext context, Todo todo) {
    final repository = Provider.of<TodosRepository>(context, listen: false);
    repository.toggleTodo(todo);
  }

  void _onLongTodoPressed(BuildContext context, Todo todo) {
    final repository = Provider.of<TodosRepository>(context, listen: false);
    repository.removeTodo(todo);
  }

  void _onFabPressed(BuildContext context) async {
    final repository = Provider.of<TodosRepository>(context, listen: false);
    final newTodoName = await push(context, NewTodoScreen());
    if (newTodoName == null) return;
    repository.addTodo(Todo(text: newTodoName));
  }
}
