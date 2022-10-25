class ToDo {
  String? id;
  String? todotxt;
  late bool isdone;

  ToDo({
    required this.id,
    required this.todotxt,
    this.isdone = false,
  });

  static List<ToDo> todolist(){
    return[
    // ToDo(id: '01',todotxt: 'todo',isdone: true),
    // ToDo(id: '02',todotxt: 'flutter',isdone: true),
    // ToDo(id: '03',todotxt: 'gym',),
    // ToDo(id: '04',todotxt: 'football',),
    // ToDo(id: '05',todotxt: 'cricket',),
    // ToDo(id: '06',todotxt: 'utube',isdone: true),
];


    }
}