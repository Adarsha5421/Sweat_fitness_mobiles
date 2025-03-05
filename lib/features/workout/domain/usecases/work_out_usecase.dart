import 'package:dartz/dartz.dart';
import 'package:gym_tracker_app/features/workout/domain/entities/work_out_entity.dart';
import 'package:gym_tracker_app/features/workout/domain/repositories/work_out_rep.dart';

// import 'package:wastemanagement/app/di/di.dart';
// import 'package:wastemanagement/features/auth/data/dto/login_dto.dart';

// import '../../../../app/shared_prefs/token_shared_prefs.dart';
// import '../../../../app/shared_prefs/user_shared_prefs.dart';
import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
// import '../repository/user_repository.dart';

// class LoginUserParams extends Equatable {
//   final String email;
//   final String password;

//   const LoginUserParams({required this.email, required this.password});

//   const LoginUserParams.empty()
//       : email = '_empty.email',
//         password = '_empty.password';

//   @override
//   List<Object?> get props => [email, password];
// }

class WorkOutUsecase implements UsecaseWithParams<List<WorkOutEntity>, void> {
  final WorkOutRep workOutRep;
  // final UserSharedPrefs tokenSharedPrefs;
  // final UserSharedPrefs userSharedPrefs;

  const WorkOutUsecase({required this.workOutRep});

  @override
  Future<Either<Failure, List<WorkOutEntity>>> call(void params) async {
    // Call the repository to login
    return workOutRep.getWorkOuts().then((value) {
      return value.fold((failure) => Left(failure), (userData) {
        // Save user data in Shared Preferences
        // userSharedPrefs.setUserData(userData.user ?? const UserEntity());
        // tokenSharedPrefs.saveToken(userData.token);

        // getIt<Dio>().options.headers['Authorization'] = userData.token;

        return Right(userData);
      });
    });
  }
}
