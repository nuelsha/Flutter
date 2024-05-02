import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/todo_list_model.dart' as model;

class Task {
  final String title;
  final String description;

  Task({required this.title, required this.description});
}

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To-Do List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 71, 62, 62),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Consumer<model.TodoListModel>(
          builder: (context, todoList, child) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: todoList.tasks.length,
              itemBuilder: (context, index) {
                final task = todoList.tasks[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(8.0),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          task.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Divider(color: Colors.grey),
                        Text(
                          task.description,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    trailing: Checkbox(
                      value: false,
                      onChanged: (bool? value) {
                        if (value != null && value) {
                          todoList.removeTask(task);
                        }
                      },
                    ),
                    dense: true,
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTask(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTask(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _taskTitleController = TextEditingController();
    final TextEditingController _taskDescriptionController =
        TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _taskTitleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a task title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Task Title',
                  ),
                ),
                TextFormField(
                  controller: _taskDescriptionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a task description';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Task Description',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  final title = _taskTitleController.text;
                  final description = _taskDescriptionController.text;
                  Provider.of<model.TodoListModel>(context, listen: false)
                      .addTask(title, description);
                  _taskTitleController.clear();
                  _taskDescriptionController.clear();
                  Navigator.pop(context);
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
