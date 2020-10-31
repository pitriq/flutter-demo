import 'package:demo/models/todo.dart';
import 'package:demo/screens/new_todo_screen.dart';
import 'package:demo/widgets/todo_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Todo> todos = [];

  @override
  void initState() {
    todos.add(Todo(text: 'Un TODO de prueba', completed: false));
    todos.add(Todo(text: 'Otro TODO de prueba', completed: false));
    todos.add(Todo(text: 'Otro TODO de prueba más', completed: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onFabPressed,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'My TODOs',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.grey[900],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return TodoItem(
                      todo: todos[index],
                      onChanged: (value) => _onTodoChecked(index),
                    );
                  },
                ),
              )
            ],
          )
        ),
      ),
    );
  }

  void _onTodoChecked(index) {
    final todo = todos[index];
    setState(() {
      todo.completed = !todo.completed;
    });
  }

  void _addNewTodo(String name) {
    setState(() {
      todos.add(Todo(text: name, completed: false));
    });
  }

  void _onFabPressed() async {
    final newTodoName = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewTodoScreen()
      )
    );
    if (newTodoName == null) return;
    _addNewTodo(newTodoName);
  }

}