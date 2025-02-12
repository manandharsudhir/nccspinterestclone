import 'package:dio/dio.dart';

class BaseClient {
  BaseClient._();

  static BaseClient get instance => BaseClient._();

  Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://api.themoviedb.org/3/",
      headers: {
        "accept": "application/json",
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NzcyZTQ1MzdhZGFlMjU2NGUwNTVhOTYwMTc3YjVkZCIsIm5iZiI6MTYxNzg2NjIyNi45NzUwMDAxLCJzdWIiOiI2MDZlYWRmMjg0ZjI0OTAwNDE3MzA1ODIiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.f95gaPqRwfa44zWupWxKFG1rfJ667Fp0qDwfUiE6Qvg"
      },
    ),
  );

  Future<Map<String, dynamic>> get(String path) async {
    try {
      final response = await dio.get(path);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
