import 'package:dartz/dartz.dart' hide Task;
import 'package:firebase_offline/core/errors/failures.dart';
import 'package:firebase_offline/features/tasks/domain/entities/task.dart';


abstract class TasksRepository {
  Future<Either<AppFailure, Task>> getTask(String id);
  Stream<Either<AppFailure, List<Task>>> getTasksStream();
  Future<Either<AppFailure, bool>> addTask(Task task);
  Future<Either<AppFailure, bool>> deleteTask(String id);
  Future<Either<AppFailure, bool>> updateTask(Task task);
}
