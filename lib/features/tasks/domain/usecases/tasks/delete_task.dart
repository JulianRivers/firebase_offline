import 'package:dartz/dartz.dart';
import 'package:firebase_offline/core/errors/failures.dart';
import 'package:firebase_offline/features/tasks/domain/repositories/tasks_repository.dart';

class DeleteTaskUseCase {
  final TasksRepository repository;

  DeleteTaskUseCase({required this.repository});

  Future<Either<AppFailure, bool>> call(String id){
    return repository.deleteTask(id);
  }

}
