import 'package:flutter/material.dart';
import 'package:todo/data/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;

  const TodoCard({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: make a beautiful card
    return Card(
      child: Row(
        children: [
          /* CheckboxListTile(
              value: true,
              onChanged: (_) {
                todo.toggleStatus();
              }) */
          Checkbox(
            value: todo.isDone,
            onChanged: (value) {
              todo.isDone = value as bool;
              // todo.toggleStatus();
            },
          ),
          Text(todo.task),
        ],
      ),
    );
  }
}
