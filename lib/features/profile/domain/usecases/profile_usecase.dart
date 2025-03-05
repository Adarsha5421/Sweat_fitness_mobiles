import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
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

class ProfileParams extends Equatable {
  final String age;
  // final String password;
  final String name;
  final String weight;
  final String height;
  final String fitnessGoal;
  final File? profilePic;

  const ProfileParams({
    required this.weight,
    required this.height,
    required this.fitnessGoal,
    required this.age,
    // required this.password,
    required this.name,
    required this.profilePic,
  });

  // const ProfileParams.empty()
  //     : age = '_empty.age',
  //       // password = '_empty.password',
  //       name = '_empty.name',
  //       fitnessGoal = '_empty.fitnessGoal',
  //       weight = '_empty.weight',
  //       height = '_empty.height',
  //       profilePic = '_empty.profilePic'
  //       ;

  @override
  List<Object?> get props => [age, name, fitnessGoal, weight, height];
}

class ProfileUsecase implements UsecaseWithParams<LoginEntity, ProfileParams> {
  final IUserRepository userRepository;
  // final UserSharedPrefs tokenSharedPrefs;
  final UserSharedPrefs userSharedPrefs;

  const ProfileUsecase({required this.userRepository, required this.userSharedPrefs});

  @override
  Future<Either<Failure, LoginEntity>> call(ProfileParams params) async {
    // Call the repository to login
    return userRepository
        .editProfile(ProfileParams(
      weight: params.weight,
      height: params.height,
      fitnessGoal: params.fitnessGoal,
      age: params.age,
      name: params.name,
      profilePic: params.profilePic
    ))
        .then((value) {
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
