import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';


class Notes extends StatelessWidget {
  const Notes({
    super.key,
    required this.ischecked,
    required this.toogle,
    required this.data,
    required this.delte_note });
  final bool ischecked;
  final VoidCallback toogle;
  final String data;
  final VoidCallback delte_note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                delte_note();
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          width: 400,
          height: 75,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 1, 132, 38),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
          ),
          child: Row(
            children: [
              Checkbox(
                value: ischecked,
                onChanged: (bool? value) {
                  return toogle();
                },
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  data,
                  style: TextStyle(
                    decoration:
                        ischecked
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                    color:
                        ischecked
                            ? const Color.fromARGB(122, 0, 0, 0)
                            : Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

