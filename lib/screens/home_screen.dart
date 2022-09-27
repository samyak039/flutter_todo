import 'package:flutter/material.dart';

import '../data/todo.dart';
import '../ui/todo_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todoList = [];

  void _addTask() {
    print('<< FAB Pressed');
  }

  @override
  Widget build(BuildContext context) {
    List<Todo> todoList = [
      Todo(task: 'One'),
      Todo(task: 'Two'),
      Todo(task: 'Three'),
    ];
    for (int i = 0; i < 100; i++) {
      final task = Todo(task: '$i');
      todoList.add(task);
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Title',
          ),
        ),
        body: Center(
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: todoList.length,
            itemBuilder: ((context, index) {
              print('>> index: $index');
              return TodoCard(todo: todoList[index]);
            }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addTask,
          tooltip: 'FAB Pressed',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
