import 'dart:io';
import 'package:todo_ap/todo.dart';
import 'package:todo_ap/todo_repository.dart';
import 'package:ansicolor/ansicolor.dart';

final AnsiPen greenPen = AnsiPen()..green() ;
final AnsiPen redPen = AnsiPen()..red();
final AnsiPen bluePen = AnsiPen()..blue();
final AnsiPen yellowPen = AnsiPen()..yellow();
void printMenu(){
  print(yellowPen("консольное приложение todo")); 
  print(("команды "));
  print((" add <текст>         - добавить задачу "));
  print((" list                - показать список"));
  print((" done <id>           - отметить выполненной"));
  print((" delete <id>         - удалить задачу"));
  print((" exit                - выход"));
  print("");
}
void addCommand(TodoRepository repo , String input){
  if(input.length <= 4){
    print("ошибка : введите текст задачи");
    return ; 
  }
  String title = input.substring(4).trim();
  repo.add(title) ; 
  print("задача добавлена"); 
}
void listCommand(TodoRepository repo ){
  List<Todo> todos = repo.gelAll(); 
  if (todos.isEmpty) {
    print("список задач пуст"); 
    return ; 
  }
  for (var todo in todos){
    print(todo); 
  }
}
void doneCommand(TodoRepository repo , List<String> parts ){
  if(parts.length <2 ){
    print("ошибка укажите id");
    return ; 
  }
  int id = int.parse(parts[1]); 
  repo.complete(id); 
  print("задача отмечена выполненной"); 
} 
void deleteCommand(TodoRepository repo , List<String> parts){
  if(parts.length <2 ){
    print("ошибка укажите id"); 
    return; 
  }
  int id = int.parse(parts[1]);
  repo.delete(id); 
  print("задача удалена" ); 
}
bool handleCommand(TodoRepository repo , String input){
  List<String> parts = input.split(" "); 
  String command = parts[0].toLowerCase(); 
  try{
    switch(command){
      case "add" :
      addCommand(repo, input);
      break; 
      case "list": 
      listCommand(repo) ;
      break; 
      case "done": 
      doneCommand(repo, parts);
      break; 
      case "delete": 
      deleteCommand(repo, parts);
      break ; 
      case "exit" : 
      print("выход из программы"); 
      default:
      print("неизвестная команда"); 
    }
  } catch (e){
    print(redPen("ошибка $e")); 
  }
  return false ; 
}
void main(){
  TodoRepository repo = TodoRepository(); 
  printMenu(); 
  while (true){
    stdout.write("> "); 
    String? input = stdin.readLineSync();
    if( input ==null ){
      continue; 
    }
    input = input.trim(); 
    if(input.isEmpty){
      continue; 
    }
    bool shouldExit  = handleCommand(repo , input);
    if(shouldExit){
      break;
    }
  }
}