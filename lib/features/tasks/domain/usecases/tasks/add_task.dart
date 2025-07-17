import 'package:dartz/dartz.dart';
import 'package:firebase_offline/core/errors/failures.dart';
import 'package:firebase_offline/features/tasks/domain/repositories/tasks_repository.dart';

class AddTaskUseCase {
  final TasksRepository repository;

  AddTaskUseCase({required this.repository});

  Future<Either<AppFailure, bool>> call(Task task){
    return repository.addTask(task);
  }
}
