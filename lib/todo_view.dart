import 'package:flutter/material.dart';
import 'package:uwtests/form_validate.dart';
import 'package:uwtests/Todo.dart';

class TodoView extends StatefulWidget {
  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  final formKey = GlobalKey<FormState>();
  List<Todo> todoList = [];
  String _todoName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    key: Key('todo'),
                    onSaved: (save) {
                      _todoName = save;
                      setState(() {});
                    },
                    validator: (val) {
                      return FormValidate.todoValidate(val);
                    },
                  ),
                  RaisedButton(
                    key: Key('add'),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        todoList.add(Todo(
                          todoName: _todoName,
                        ));
                      }

                      formKey.currentState.reset();
                      setState(() {});
                    },
                    child: Text("Add"),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: todoList.length != 0
                  ? ListView.separated(
                      key: Key('3'),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: todoList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            key: Key('delete_button'),
                            onPressed: () {
                              if (todoList[index].isDone)
                                todoList.removeAt(index);
                              else
                                getBottomSheet;
                              setState(() {});
                            },
                          ),
                          title: Text(todoList[index].todoName),
                          leading: Checkbox(
                              value: todoList[index].isDone,
                              onChanged: (state) {
                                setState(() {
                                  todoList[index].isDone = state;
                                });
                              }),
                        );
                      })
                  : CircularProgressIndicator()),
        ],
      ),
    );
  }

  Future get getBottomSheet {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.all(30),
        child: Text(
          "First Sign Checkbox for delete!!",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
