import 'package:dartz/dartz.dart' hide Task;
import 'package:firebase_offline/core/errors/failures.dart';
import 'package:firebase_offline/features/tasks/domain/entities/task.dart';
import 'package:firebase_offline/features/tasks/domain/repositories/tasks_repository.dart';

class UpdateTaskUseCase {
  final TasksRepository repository;

  UpdateTaskUseCase({required this.repository});

  Future<Either<AppFailure, bool>> call(Task task) {
    return repository.updateTask(task);
  }
}
