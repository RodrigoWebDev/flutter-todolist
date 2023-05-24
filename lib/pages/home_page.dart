import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import "../widgets/list.dart";

class MyHomePage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        title: Text("My todo list")
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: appState.myController,
              onChanged: (text){
                appState.updateInputValue(value: text);
              },
              decoration: InputDecoration(
                hintText: "Type something"
              ),
            ),
            ElevatedButton(
              onPressed: (){
                appState.addItem();
              }, 
              child: Text("Add item")
            ),
            ListItems()
          ],
        ),
      )
    );
  }
}