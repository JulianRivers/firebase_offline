part of 'task_list_bloc.dart';

sealed class TaskListState extends Equatable {
  const TaskListState();
  
  @override
  List<Object> get props => [];
}

final class TaskListInitial extends TaskListState {}
