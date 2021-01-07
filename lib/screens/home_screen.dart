import 'package:flutter/material.dart';

import 'package:demo/models/todo.dart';
import 'package:demo/screens/basic_screen.dart';
import 'package:demo/screens/new_todo_screen.dart';
import 'package:demo/utils/navigate.dart';
import 'package:demo/widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todos = [
    Todo(text: 'Comprar yerba Nobleza Gaucha'),
    Todo(text: 'Comprar azucar'),
    Todo(text: 'No ponerle esa azucar al mate'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BasicScreen(
      fab: _buildFab(),
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
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TodoItem(
                      todo: todos[index],
                      onToggled: (value) => _onTodoChecked(index),
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

  Widget _buildFab() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: _onFabPressed,
    );
  }

  void _onTodoChecked(index) {
    final todo = todos[index];
    setState(() {
      todo.toggleCompleted();
    });
  }

  void _addNewTodo(String name) {
    setState(() {
      todos.add(Todo(text: name));
    });
  }

  void _onFabPressed() async {
    final newTodoName = await push(context, NewTodoScreen());
    if (newTodoName == null) return;
    _addNewTodo(newTodoName);
  }
}
