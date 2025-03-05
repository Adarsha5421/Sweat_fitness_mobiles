import 'package:dartz/dartz.dart';
import 'package:gym_tracker_app/core/error/failure.dart';
import 'package:gym_tracker_app/features/Login/data/models/login_modal.dart';
import 'package:gym_tracker_app/features/Login/domain/entities/login_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPrefs {
  late SharedPreferences _sharedPreferences;

  // Set User Details
  Future<Either<Failure, bool>> setUserData(UserEntity data) async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();

      if (data.id != null) await _sharedPreferences.setString('id', data.id!);
      if (data.name != null) await _sharedPreferences.setString('name', data.name!);
      if (data.email != null) await _sharedPreferences.setString('email', data.email!);
      if (data.profilePic != null) await _sharedPreferences.setString('profilePic', data.profilePic!);
      if (data.role != null) await _sharedPreferences.setString('role', data.role!);
      if (data.fitnessGoal != null) await _sharedPreferences.setString('fitnessGoal', data.fitnessGoal!);
      if (data.createdAt != null) await _sharedPreferences.setString('createdAt', data.createdAt!);
      if (data.updatedAt != null) await _sharedPreferences.setString('updatedAt', data.updatedAt!);
      if (data.v != null) await _sharedPreferences.setInt('v', data.v!);

      return const Right(true);
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  // Get User Data
  Future<Either<Failure, User>> getUserData() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();

      final id = _sharedPreferences.getString('id');
      final name = _sharedPreferences.getString('name');
      final email = _sharedPreferences.getString('email');
      final profilePic = _sharedPreferences.getString('profilePic');
      final role = _sharedPreferences.getString('role');
      final fitnessGoal = _sharedPreferences.getString('fitnessGoal');
      final createdAt = _sharedPreferences.getString('createdAt');
      final updatedAt = _sharedPreferences.getString('updatedAt');
      final v = _sharedPreferences.getInt('v');

      final user = User(
        id: id,
        name: name,
        email: email,
        profilePic: profilePic,
        role: role,
        fitnessGoal: fitnessGoal,
        createdAt: createdAt,
        updatedAt: updatedAt,
        v: v,
      );

      if (id == null && name == null && email == null) {
        return Left(SharedPrefsFailure(message: 'No user data found'));
      }

      return Right(user);
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  // Update User Data
  Future<Either<Failure, bool>> updateUserData(User updatedUser) async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();

      final result = await getUserData();

      return result.fold((failure) => Left(failure), (currentUser) async {
        // Only update fields that are not null in updatedUser
        if (updatedUser.name != null) await _sharedPreferences.setString('name', updatedUser.name!);
        if (updatedUser.email != null) await _sharedPreferences.setString('email', updatedUser.email!);
        if (updatedUser.profilePic != null) await _sharedPreferences.setString('profilePic', updatedUser.profilePic!);
        if (updatedUser.role != null) await _sharedPreferences.setString('role', updatedUser.role!);
        if (updatedUser.fitnessGoal != null) await _sharedPreferences.setString('fitnessGoal', updatedUser.fitnessGoal!);
        if (updatedUser.updatedAt != null) await _sharedPreferences.setString('updatedAt', updatedUser.updatedAt!);
        if (updatedUser.v != null) await _sharedPreferences.setInt('v', updatedUser.v!);

        return const Right(true);
      });
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  // Clear User Data
  Future<Either<Failure, bool>> clear() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();

      await _sharedPreferences.remove('id');
      await _sharedPreferences.remove('name');
      await _sharedPreferences.remove('email');
      await _sharedPreferences.remove('profilePic');
      await _sharedPreferences.remove('role');
      await _sharedPreferences.remove('fitnessGoal');
      await _sharedPreferences.remove('createdAt');
      await _sharedPreferences.remove('updatedAt');
      await _sharedPreferences.remove('v');

      return const Right(true);
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }
}

class TokenSharedPrefs {
  late SharedPreferences _sharedPreferences;

  // Save Token
  Future<Either<Failure, bool>> saveToken(String token) async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.setString('token', token);
      return const Right(true);
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  // Get Token
  Future<Either<Failure, String>> getToken() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      final token = _sharedPreferences.getString('token');

      if (token != null) {
        return Right(token);
      } else {
        return Left(SharedPrefsFailure(message: 'No token found'));
      }
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  // Clear Token
  Future<Either<Failure, bool>> clearToken() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.remove('token');
      return const Right(true);
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }
}
