import 'package:dartz/dartz.dart' hide Task;
import 'package:firebase_offline/core/errors/failures.dart';
import 'package:firebase_offline/features/tasks/domain/entities/task.dart';
import 'package:firebase_offline/features/tasks/domain/repositories/tasks_repository.dart';

class GetTaskUseCase {
  final TasksRepository repository;

  GetTaskUseCase({required this.repository});

  Future<Either<AppFailure, Task>> call(String id){
    return repository.getTask(id);
  }
}
