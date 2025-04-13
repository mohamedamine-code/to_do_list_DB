import 'package:flutter/material.dart';

class Dialog_widget extends StatelessWidget {
  const Dialog_widget({required this.save,required this.controller});
  final VoidCallback save;
  final controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      title: Text('Take a Note', style: TextStyle(color: Colors.white)),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              style: TextStyle(
                color: Colors.white, // Text color
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // When focused (green)
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'N O T E ..',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    save();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 1, 132, 38),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text('Save', style: TextStyle(fontSize: 17)),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 1, 132, 38),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text('Cancel', style: TextStyle(fontSize: 17)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
