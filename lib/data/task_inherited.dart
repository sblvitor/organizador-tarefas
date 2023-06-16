import 'package:flutter/material.dart';
import 'package:organizador_de_tarefas/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task(
      nome: 'Aprender a andar de bike',
      image: 'assets/images/bike.jpg',
      dificuldade: 4,
      nivel: 0,
    ),
    Task(
      nome: 'Aprender flutter',
      image: 'assets/images/flutter.png',
      dificuldade: 3,
      nivel: 0
    ),
    Task(
      nome: 'Jogar',
      image: 'assets/images/cs2.png',
      dificuldade: 1,
      nivel: 0
    ),
    Task(
      nome: 'Dar role de golzão',
      image: 'assets/images/gol-2001-aro-18-rebaixado-prata-rodas-amarok.webp',
      dificuldade: 0,
      nivel: 0
    ),
    Task(nome: 'Meditar', image: 'assets/images/meditacao-praia.jpg',
      dificuldade: 5,
      nivel: 0
    )
  ];

  void addNewTask(String name, int difficulty, String image){
    taskList.add(Task(nome: name, dificuldade: difficulty, image: image, nivel: 0,));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
