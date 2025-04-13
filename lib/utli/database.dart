import 'package:hive/hive.dart';

class TodoDateBase {
List Mynotes=[];
// refernce our Box 
final _myBox = Hive.box('todolist');

void creteIntilaData(){
  Mynotes=[
    'have a work to do',false
];
}

void loadDta(){
Mynotes = _myBox.get('item');
}

void misajourdata(){
  _myBox.put('item', Mynotes);
}

}