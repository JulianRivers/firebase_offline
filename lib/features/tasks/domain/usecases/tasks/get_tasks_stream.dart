import 'package:dartz/dartz.dart' hide Task;
import 'package:firebase_offline/core/errors/failures.dart';
import 'package:firebase_offline/features/tasks/domain/entities/task.dart';
import 'package:firebase_offline/features/tasks/domain/repositories/tasks_repository.dart';

class GetTasksStreamUseCase {
  final TasksRepository repository;

  GetTasksStreamUseCase({required this.repository});

  Stream<Either<AppFailure, List<Task>>> call() {
    return repository.getTasksStream();
  }
}
