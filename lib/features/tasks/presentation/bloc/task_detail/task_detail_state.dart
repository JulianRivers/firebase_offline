part of 'task_detail_bloc.dart';

sealed class TaskDetailState extends Equatable {
  const TaskDetailState();
  
  @override
  List<Object> get props => [];
}

final class TaskDetailInitial extends TaskDetailState {}
