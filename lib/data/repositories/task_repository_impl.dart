import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/data/datasources/remote/task_remote_datasource.dart';
import 'package:pp191225/domain/entities/tasks/task.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource remoteDataSource;

  TaskRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Task>>> getTasks() async {
    try {
      final dtos = await remoteDataSource.getTasks();
      final tasks = dtos.map((dto) => dto.toEntity()).toList();
      return Right(tasks);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Task>> createTask({
    required String name,
    required DateTime deadline,
    required double estimateHours,
  }) async {
    try {
      final dto = await remoteDataSource.createTask(
        name: name,
        deadline: deadline,
        estimateHours: estimateHours,
      );
      return Right(dto.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
