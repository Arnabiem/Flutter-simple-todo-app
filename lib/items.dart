import 'package:flutter/material.dart';
import 'package:flutter_todo_app/todo.dart';
class items extends StatelessWidget {
  const items({Key? key,required this.todo,required this.ontodochange,required this.ontododelete}) : super(key: key);

final ToDo todo;
final ontodochange;
final ontododelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: (){
                  ontodochange(todo);
                  },

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        tileColor: Colors.white,
        leading: Icon(todo.isdone?Icons.check_box:Icons.check_box_outline_blank,color: Colors.blue),
        title: Text(todo.todotxt!,
            style: TextStyle(fontSize: 23,color: Colors.black,
            decoration:todo.isdone ?TextDecoration.lineThrough:null)),
        trailing: Container(
          height: 35,width: 35,
          decoration: BoxDecoration(
            color: Colors.redAccent,borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon:Icon(Icons.delete),
          onPressed: (){
                  ontododelete(todo.id);
          },
          )
        ),
      ),
    );
  }
}
