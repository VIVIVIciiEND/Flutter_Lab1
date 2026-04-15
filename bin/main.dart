class Todo {
  final int id; 
  String title; 
  bool isDone; 
  Todo({required this.id , required this.title , this.isDone= false});
  Todo.empty() : id = 0 , title ='' , isDone = false ;
  @override
  String toString() => '${isDone ? '+' : '-'} [$id] $title' ; 
  
}

void printTodo({required String title , bool done = false }){
  print('${done ? '+' : '-'} $title');
}

void main(){
  String name = 'динара' ; 
  String? name2 = null ; 
  var count = 0 ; 
  var title = 'учить rust ' ; 
  var x = 5 ; 
  final id = 1 ; 
  const appName = 'TodoApp';
  print('$name , $name2 , ${count+5}, $title  , $id , $appName');
  String greet(String name) => 'Hello , $name'; 
  printTodo(title: 'купить молоко'); 
  printTodo(title: 'проверить код' , done: true); 
  String repeat(String s , [int times = 2])=> s*times ; 


}