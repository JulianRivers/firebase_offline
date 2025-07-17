import 'package:dartz/dartz.dart';
import 'package:firebase_offline/core/errors/failures.dart';
import 'package:firebase_offline/features/tasks/domain/repositories/tasks_repository.dart';

class GetTaskUseCase {
  final TasksRepository repository;

  GetTaskUseCase({required this.repository});

  Future<Either<AppFailure, bool>> call(String id){
    return repository.getTask(id);
  }
}
