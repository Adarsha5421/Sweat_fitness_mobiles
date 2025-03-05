import 'package:dartz/dartz.dart';
import 'package:gym_tracker_app/features/Login/data/datasources/remote_datasource/user_remote_datsource.dart';
import 'package:gym_tracker_app/features/Login/data/models/login_modal.dart';
import 'package:gym_tracker_app/features/Login/domain/entities/login_entity.dart';
import 'package:gym_tracker_app/features/Login/domain/repositories/login_repository.dart';
import 'package:gym_tracker_app/features/profile/domain/usecases/profile_usecase.dart';

import '../../../../core/error/failure.dart';

class UserRemoteRepository implements IUserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRemoteRepository({required this.userRemoteDataSource});

  @override
  Future<Either<Failure, LoginEntity>> login(String email, String password) async {
    try {
      // Call the login function from the remote data source
      final response = await userRemoteDataSource.login(email, password);
      return Right(response.toEntity());
    } on Exception catch (e) {   
      // Handle any errors and return the failure message
      return Left(ApiFailure(message: e.toString().replaceAll('Exception: ', '').trim()));
    }
  }

  @override
  Future<Either<Failure, LoginEntity>> signUp(String email, String password, String name) async {
    try {
      final response = await userRemoteDataSource.signUp(email, password, name);
      return Right(response.toEntity());
    } on Exception catch (e) {
      return Left(ApiFailure(message: e.toString().replaceAll('Exception: ', '').trim()));
    }
  }

  @override
  Future<Either<Failure, LoginEntity>> editProfile(ProfileParams params) async {
    try {
      final response = await userRemoteDataSource.updateProfile(params);
      return Right(response.toEntity());
    } on Exception catch (e) {
      return Left(ApiFailure(message: e.toString().replaceAll('Exception: ', '').trim()));
    }
  }

  // @override
  // Future<Either<Failure, EditProfileResponse>> updateProfile(String name, File? image) async {
  //   try {
  //     final response = await userRemoteDataSource.updateProfile(name, image);
  //     return Right(response);
  //   } on Exception catch (e) {
  //     return Left(ApiFailure(message: e.toString().replaceAll('Exception: ', '').trim()));
  //   }
  // }
}
