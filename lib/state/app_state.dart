import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var inputValue = "";
  List<String> todoList = [];

  final myController = TextEditingController();

  void addItem() {
    todoList.add(myController.text);
    myController.text = "";
    print(todoList);
    notifyListeners();
  }

  void removeItem({required String itemToRemove}){
    List<String> filter = todoList.where((item) => item != itemToRemove).toList();
    todoList = filter;
    notifyListeners();
  }

  void updateInputValue({ required String value }) {
    inputValue = value;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }
}