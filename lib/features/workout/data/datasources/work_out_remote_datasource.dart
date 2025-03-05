import 'package:dio/dio.dart';
import 'package:gym_tracker_app/core/api_endpoints.dart';
import 'package:gym_tracker_app/features/workout/data/models/work_out_model.dart';

class WorkOutRemoteDatasource {
  final Dio dio;

  WorkOutRemoteDatasource({required this.dio});

  /// Signs up a user
  Future<List<WorkOutModel>> workOuts() async {
    try {
      var response = await dio.get(
        APIEndPoints.workOutsUrl,
      );
      if (response.statusCode == 400 || response.statusCode == 401) throw Exception(response.data['error']);
      final responseData = response.data as List<dynamic>;
      return responseData.map((json) => WorkOutModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Logs in a user
}
