import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/entities/tasks/task.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/task_repository.dart';

/// UseCase for getting all tasks
/// Contains business logic for fetching tasks
class GetTasksUseCase {
  final TaskRepository repository;

  GetTasksUseCase(this.repository);

  Future<Either<Failure, List<Task>>> call() async {
    return repository.getTasks();
  }
}
