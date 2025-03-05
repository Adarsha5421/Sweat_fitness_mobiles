import 'package:dio/dio.dart';
import 'package:gym_tracker_app/app/di/di.dart';
import 'package:gym_tracker_app/core/api_endpoints.dart';
import 'package:gym_tracker_app/features/Login/data/datasources/local_datasource/login_local_datasource.dart';
import 'package:gym_tracker_app/features/Login/data/models/login_modal.dart';
import 'package:gym_tracker_app/features/profile/domain/usecases/profile_usecase.dart';

class UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSource({required this.dio});

  /// Signs up a user
  Future<LoginModal> signUp(String email, String password, String name) async {
    try {
      var response = await dio.post(APIEndPoints.signUpUrl, data: {'email': email, 'password': password, 'name': name});
      if (response.statusCode == 400 || response.statusCode == 401) throw Exception(response.data['error']);
      final responseData = response.data;
      return LoginModal.fromJson(responseData);
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Logs in a user
  Future<LoginModal> login(String email, String password) async {
    try {
      Response response = await dio.post(APIEndPoints.loginUrl, data: {'email': email, 'password': password});
      if (response.statusCode == 400 || response.statusCode == 401) throw Exception(response.data['error']);
      final responseData = response.data;
      return LoginModal.fromJson(responseData);
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<LoginModal> updateProfile(ProfileParams params) async {
    try {
      var tokenResult = await getIt<TokenSharedPrefs>().getToken();
      String? token;

      tokenResult.fold(
        (failure) => throw Exception("Token Error: ${failure.message}"), // Handle token failure
        (t) => token = t, // Assign token if available
      );

      if (token == null) {
        throw Exception("Token is missing");
      }

      FormData formData = FormData.fromMap({
        "name": params.name,
        "age": params.age,
        "height": params.height,
        "weight": params.weight,
        "fitnessGoal": params.fitnessGoal,
        if (params.profilePic != null)
          "profilePic": await MultipartFile.fromFile(
            params.profilePic!.path,
            // filename: params.profilePic!.path.split("/").last + DateTime.now().toString(),
            // contentType: DioMediaType.parse('image/jpeg'),
          ),
      });

      Response response = await dio.put(
        APIEndPoints.editProfileUrl,
        data: formData,
        options: Options(headers: {
          "Content-Type": "multipart/form-data",
          "Authorization": "Bearer $token", // Add Bearer token here
        }),
      );

      if (response.statusCode == 400 || response.statusCode == 401) {
        throw Exception(response.data['error']);
      }

      return LoginModal.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Dio Error: ${e.message ?? 'Unknown error'}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
