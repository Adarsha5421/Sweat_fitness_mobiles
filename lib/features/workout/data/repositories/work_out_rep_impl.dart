import 'package:dartz/dartz.dart';
import 'package:gym_tracker_app/core/error/failure.dart';
import 'package:gym_tracker_app/features/workout/data/datasources/work_out_remote_datasource.dart';
import 'package:gym_tracker_app/features/workout/data/models/work_out_model.dart';
import 'package:gym_tracker_app/features/workout/domain/entities/work_out_entity.dart';
import 'package:gym_tracker_app/features/workout/domain/repositories/work_out_rep.dart';

class WorkOutRepImpl implements WorkOutRep {
  final WorkOutRemoteDatasource workOutRemoteDatasource;

  WorkOutRepImpl({required this.workOutRemoteDatasource});

  @override
  Future<Either<Failure, List<WorkOutEntity>>> getWorkOuts() async {
    try {
      // Call the workouts function from the remote data source
      final response = await workOutRemoteDatasource.workOuts();
      return Right(response.map((e) => e.toEntity()).toList());
    } on Exception catch (e) {
      // Handle any errors and return the failure message
      return Left(ApiFailure(message: e.toString().replaceAll('Exception: ', '').trim()));
    }
  }
}
