import 'package:flutter/material.dart';
import 'package:flutter_todo_app/items.dart';
import 'package:flutter_todo_app/todo.dart';
class  home extends StatefulWidget {
   home ({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
final todoslist=ToDo.todolist();
final todocontroller=TextEditingController();
List<ToDo> todosearch=[];
@override
  void initState() {
todosearch=todoslist;
super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
    appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            child: Column(
              children: [
                searchbar(),
                Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50,bottom: 20,left: 8),
                          child: Text(
                            'All ToDos',style: TextStyle(
                            fontSize: 30,fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                        for(ToDo i in todosearch.reversed)
                        items(
                            todo: i,
                          ontodochange: changetodo,
                        ontododelete: deltodo,
                        ),
                      ],
                    )
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10,right: 10,left: 15),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const[BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0,0),
                        blurRadius: 10,
                        spreadRadius: 0,
                      )],
                      borderRadius: BorderRadius.circular(10)
                    ),

                    child: TextField(
                      controller: todocontroller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: 'Add new Todo Items here',
                            hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10,right: 15),
                  child: ElevatedButton(
                    onPressed: (){
                      addtodoitem(todocontroller.text);
                    },
                    child: Text('+',style: TextStyle(fontSize: 45)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      minimumSize: Size(50, 50),
                      elevation: 5,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
              void changetodo(ToDo todo){
                setState(() {
                  todo.isdone=!todo.isdone;

                });
              }
              void deltodo(String id){
                setState(() {
                  todoslist.removeWhere((item) => item.id==id);

                });
              }
              void addtodoitem (String todo){
                setState(() {
                  todoslist.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todotxt: todo));
                });
                todocontroller.clear();
              }
              void search(String key){
                    List<ToDo> reslt=[];
                    if(key.isEmpty){
                      reslt=todoslist;
                    }
                    else{
                      reslt=todoslist.where((item) => item.todotxt!.toLowerCase().contains(key.toLowerCase())).toList();
                    }
                    setState(() {
                      todosearch=reslt;
                    });
              }


Widget searchbar(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged:(val)=> search(val) ,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            prefixIconConstraints: BoxConstraints(
                maxHeight: 25,
                maxWidth: 30
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey)
        ),
      ),
    );
}

  AppBar buildAppBar() {
    return AppBar(
    backgroundColor: Colors.grey[200],
  elevation: 0,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Icon(
          Icons.menu,
        color: Colors.black,
        size: 30,
      ),
      Text(
          'Flutter simple ToDo App',
          style: TextStyle(color: Colors.black),
      ),
      Container(
      height: 50,
        width: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset('images/img.png'),
        ),
  )
    ],
  ),
  );
  }
}
