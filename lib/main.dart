import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';  // Add this import
import 'package:to_do_dlist/Homeage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Add this first
  await Hive.initFlutter();
  
  // Open your Hive box
  var box = await Hive.openBox('todolist');
  
  runApp(const App());  // Changed to const
}

class App extends StatelessWidget {  // Changed class name to PascalCase
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homeage(),
    );
  }
}