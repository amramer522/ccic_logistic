import 'package:dio/dio.dart';

class DioHelper {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://wa7eed.growfet.com/',
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    ),
  );

  static Future<CustomResponse> getData(
    String path, {
    Map<String, dynamic>? params,
  }) async {
    try {
      final resp = await _dio.get(path, queryParameters: params);
      return CustomResponse(isSuccess: true, data: resp.data);
    } on DioException catch (ex) {
      return CustomResponse(isSuccess: false, data: ex.response?.data);
    }
  }

  static Future<CustomResponse> sendData(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final resp = await _dio.post(path, data: data);
      return CustomResponse(isSuccess: true, data: resp.data);
    } on DioException catch (ex) {
      return CustomResponse(isSuccess: false, data: ex.response?.data);
    }
  }

  static Future<CustomResponse> deleteData(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final resp = await _dio.delete(path, data: data);
      return CustomResponse(isSuccess: true, data: resp.data);
    } on DioException catch (ex) {
      return CustomResponse(isSuccess: false, data: ex.response?.data);
    }
  }
}
// hello amr
class CustomResponse {
  final bool isSuccess;
  final dynamic data;
  late String msg;

  CustomResponse({required this.isSuccess, required this.data}) {
    if (data is Map) {
      msg = data['message'] ?? data['msg'] ?? data['Msg'];
    } else {
      msg = "the data is List";
    }
    print('amr $data');
  }
}





// git   global information trakcer
// vcs