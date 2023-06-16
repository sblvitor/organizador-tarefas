import 'package:organizador_de_tarefas/components/task.dart';
import 'package:organizador_de_tarefas/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_image TEXT, '
      '$_difficulty INTEGER)';

  static const String _tableName = 'taskTable';
  static const String _name = 'name';
  static const String _image = 'image';
  static const String _difficulty = 'difficulty';

  save(Task task) async {
    print('Acessando o save');
    final Database database = await getDatabase();

    Map<String, dynamic> taskMap = toMap(task);
    var itemExists = await find(task.nome);
    if(itemExists.isEmpty){
      // Save
      print('A tarefa não existia');
      return await database.insert(_tableName, taskMap);
    } else {
      // Update
      print('A tarefa já existia');
      return await database.update(_tableName, taskMap, where: '$_name = ?', whereArgs: [task.nome]);
    }
  }

  Future<List<Task>> findAll() async {
    print('Acessando o findAll');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tableName);
    print('Procurando dados no banco de dados.. encontrado: $result');
    return toList(result);
  }

  Future<List<Task>> find(String taskName) async {
    print('Acessando o find');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tableName, where: '$_name = ?', whereArgs: [taskName]);
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String taskName) async {
    print('Deletando a tarefa: $taskName');
    final Database database = await getDatabase();
    return database.delete(_tableName, where: '$_name = ?', whereArgs: [taskName]);
  }

  List<Task> toList(List<Map<String, dynamic>> taskMap) {
    print('Convertendo toList');
    final List<Task> tasks = [];
    for(Map<String,dynamic> line in taskMap){
      final Task task = Task(nome: line[_name], image: line[_image], dificuldade: line[_difficulty]);
      tasks.add(task);
    }
    print('Lista de tarefas: $tasks');
    return tasks;
  }

  Map<String, dynamic> toMap(Task task) {
    print('Convertendo task em map');
    final Map<String, dynamic> taskMap = {};
    taskMap[_name] = task.nome;
    taskMap[_difficulty] = task.dificuldade;
    taskMap[_image] = task.image;
    print('Mapa de tarefas: $taskMap');
    return taskMap;
  }
}