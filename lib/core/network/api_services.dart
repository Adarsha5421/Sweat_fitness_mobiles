import 'package:dio/dio.dart';
import 'package:gym_tracker_app/core/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// import '../../app/constants/api_endpoints.dart';
import 'dio_error_interceptor.dart';

class ApiService {
  final Dio _dio;

  Dio get dio => _dio;

  ApiService(this._dio) {
    _dio
      ..options.baseUrl = APIEndPoints.baseUrl
      ..options.connectTimeout = APIEndPoints.connectionTimeout
      ..options.receiveTimeout = APIEndPoints.receiveTimeout
      ..interceptors.add(DioErrorInterceptor())
      ..interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true))
      ..options.headers = {'Accept': 'application/json', 'Content-Type': 'application/json'}
      ..options.validateStatus = (status) => status! < 500;
  }
}
