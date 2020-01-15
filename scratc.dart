import 'dart:io';


void main() {
  performTask();
}


void performTask() async{
  task1();
  String task2Result = await task2();
  task3(task2Result);
}


task1(){
  String result = "task 1 data";
  print(result);
}
Future<String> task2() async{
  Duration sec = Duration(seconds: 3);
  String result;
  await Future.delayed(sec, (){
    result = "task 2 data";
    print(result);
  });
  return result;
}
task3(String task2Result){
  String result = "task 3 data $task2Result";
  print(result);
}