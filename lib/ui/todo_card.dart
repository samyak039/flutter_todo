import 'package:flutter/material.dart';
import 'package:todo/data/todo.dart';

class TodoCard extends StatefulWidget {
  final Todo todo;

  const TodoCard({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
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
            value: widget.todo.isDone,
            onChanged: (value) {
              print('>> CHECKED');
              setState(() {
                widget.todo.isDone = value as bool;
              });
            },
          ),
          Text(
            widget.todo.task,
            style: (widget.todo.isDone)
                ? const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  )
                : const TextStyle(),
          ),
        ],
      ),
    );
  }
}
