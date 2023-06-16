import 'package:organizador_de_tarefas/components/task.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_image TEXT, '
      '$_difficulty INTEGER)';

  static const String _tableName = 'taskTable';
  static const String _name = 'name';
  static const String _image = 'image';
  static const String _difficulty = 'difficulty';

  // Future<void> save(Task task) async {}
  // Future<List<Task>> findAll() async {return [];}
  // Future<List<Task>> find(String taskName) async {}
  // Future<void> delete(String taskName) async {}
}