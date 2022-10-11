import 'package:flutter/material.dart';

import '../data/todo.dart';
import '../ui/todo_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todoList = [Todo(task: 'Zero'), Todo(task: 'One')];
  final textController = TextEditingController();

  Future<void> _addTask() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          height: MediaQuery.of(context).viewInsets.bottom + 64,
          child: TextField(
            // controller: tc,
            controller: textController,
            autofocus: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'New Task',
              suffixIcon: IconButton(
                  onPressed: () {
                    final task = Todo(task: textController.text);
                    setState(() {
                      todoList.add(task);
                    });
                    textController.clear();
                  },
                  icon: const Icon(Icons.check)),
            ),
          ),
        );
      },
    );
  }

  Future<void> _refreshList() async {
    setState(() {
      todoList;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'ToDo',
          ),
        ),
        body: RefreshIndicator(
          onRefresh: _refreshList,
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              final todo = todoList[index];
              return Dismissible(
                key: Key(todo.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    todoList.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${todo.task} deleted')));
                },
                background: Container(color: Colors.red),
                child: TodoCard(todo: todoList[index]),
              );
            },
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
