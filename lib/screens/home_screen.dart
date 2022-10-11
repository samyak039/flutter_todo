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
                    print('<> add task');
                    final task = Todo(task: textController.text);
                    setState(() {
                      todoList.add(task);
                    });
                    print('>> todolist: $todoList');
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
    print('<> refresh list');
    setState(() {
      todoList;
    });
  }

  @override
  void initState() {
    super.initState();
    print("<< todoList: $todoList");
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
            'Title',
          ),
        ),
        body: RefreshIndicator(
          onRefresh: _refreshList,
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
