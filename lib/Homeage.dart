import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_dlist/utli/Dialog_widget.dart';
import 'package:to_do_dlist/utli/database.dart';
import 'package:to_do_dlist/utli/note.dart';

class Homeage extends StatefulWidget {
  const Homeage({super.key});

  @override
  State<Homeage> createState() => _HomeageState();
}

class _HomeageState extends State<Homeage> {

  // refernce to box
  final _myBox = Hive.box('todolist');

  TextEditingController controller =TextEditingController();

  TodoDateBase bd =TodoDateBase();

  @override
  void initState() {
    if(_myBox.get('item')==null){
      bd.creteIntilaData();
    }else{
      bd.loadDta();
    }
    super.initState();
    print(bd.Mynotes);
  }

  void toogle(index) {
    setState(() {
      bd.Mynotes[index][1] = !bd.Mynotes[index][1];
    });
    bd.misajourdata();
  }

  void save() {
    setState(() {
      bd.Mynotes.add([controller.text,false]);
    });
    Navigator.pop(context);
    controller.clear();
    bd.misajourdata();
  }



void delte_note(index){
  setState(() {
    bd.Mynotes.removeAt(index);
  });
    bd.misajourdata();

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          'To Do List',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: bd.Mynotes.length,
                itemBuilder: (BuildContext, index) {
                  return Notes(
                    delte_note: (){
                      delte_note(index);
                    },
                    data:bd.Mynotes[index][0],
                    ischecked:bd.Mynotes[index][1],
                    toogle: () {
                      toogle(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return Dialog_widget(
                save: () {
                  save();
                },
                controller: controller,
              );
            },
          );
        },
        child: Icon(Icons.add, color: Colors.black),
        backgroundColor: Color.fromARGB(255, 1, 132, 38),
      ),
    );
  }
}

