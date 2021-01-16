import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import 'package:demo/models/todo.dart';

class TodosApiProvider {
  final http.Client client;

  TodosApiProvider(this.client);

  final baseUrl = 'https://jsonplaceholder.typicode.com/todos/';

  Future<Todo> getRandomTodo() async {
    final randomNumber = Random().nextInt(201);
    
    final url = '$baseUrl$randomNumber';
    final response = await client.get(url);
    
    final body = json.decode(response.body);
    
    final name = body['title'];

    return Todo(text: name);
  }
}
