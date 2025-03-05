import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:gym_tracker_app/app/di/di.dart';
import 'package:gym_tracker_app/features/Login/data/datasources/local_datasource/login_local_datasource.dart';
import 'package:gym_tracker_app/features/Login/domain/entities/login_entity.dart';
import 'package:gym_tracker_app/features/Login/domain/repositories/login_repository.dart';

// import 'package:wastemanagement/app/di/di.dart';
// import 'package:wastemanagement/features/auth/data/dto/login_dto.dart';

// import '../../../../app/shared_prefs/token_shared_prefs.dart';
// import '../../../../app/shared_prefs/user_shared_prefs.dart';
import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
// import '../repository/user_repository.dart';

class SignUpUserParams extends Equatable {
  final String email;
  final String password;
  final String name;

  const SignUpUserParams({
    required this.email,
    required this.password,
    required this.name,
  });

  const SignUpUserParams.empty()
      : email = '_empty.email',
        password = '_empty.password',
        name = '_empty.name'
        ;

  @override
  List<Object?> get props => [email, password,name];
}

class SignUpUsecase implements UsecaseWithParams<LoginEntity, SignUpUserParams> {
  final IUserRepository userRepository;
  // final UserSharedPrefs tokenSharedPrefs;
  final UserSharedPrefs userSharedPrefs;

  const SignUpUsecase({required this.userRepository, required this.userSharedPrefs});

  @override
  Future<Either<Failure, LoginEntity>> call(SignUpUserParams params) async {
    // Call the repository to login
    return userRepository.signUp(params.email, params.password,params.name).then((value) {
      return value.fold((failure) => Left(failure), (userData) {
        // Save user data in Shared Preferences
        userSharedPrefs.setUserData(userData.user ?? const UserEntity());
        // tokenSharedPrefs.saveToken(userData.token);

        getIt<Dio>().options.headers['Authorization'] = userData.token;

        return Right(userData);
      });
    });
  }
}
