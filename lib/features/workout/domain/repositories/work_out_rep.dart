import 'package:dartz/dartz.dart';
import 'package:gym_tracker_app/features/workout/domain/entities/work_out_entity.dart';
// import 'package:gym_tracker_app/features/workout/domain/entities/work_out_entity';

import '../../../../core/error/failure.dart';
// import '../../data/dto/logi ofile_respons.dart';

abstract interface class WorkOutRep {
  Future<Either<Failure, List<WorkOutEntity>>> getWorkOuts();

  // Future<Either<Failure, EditProfileResponse>> updateProfile(String name, File? image);
}
