import 'package:flutter/material.dart';
import 'package:organizador_de_tarefas/data/task_inherited.dart';

import 'initial_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskInherited(child: const InitialPage()),
    );
  }
}

