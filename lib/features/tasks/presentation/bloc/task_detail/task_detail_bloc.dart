import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'task_detail_event.dart';
part 'task_detail_state.dart';

class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  TaskDetailBloc() : super(TaskDetailInitial()) {
    on<TaskDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
