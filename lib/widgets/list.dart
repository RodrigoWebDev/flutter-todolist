import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';


class ListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Column(
      children: <Widget>[
        for(var item in appState.todoList ) 
          Column(
            children: <Widget>[
              Text(item),
              ElevatedButton(
                onPressed: (){
                  appState.removeItem(itemToRemove: item);
                }, 
                child: Text("Remove")
              )
            ],
          )
      ],
    );
  }
}