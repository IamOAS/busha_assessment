import 'package:busha_assessment/core/utils/exports.dart';

// Network service class. This class is responsible for making network requests.
class NetworkService {
  /// This variable stores the access token.
  String? accessToken;
  // This variable stores the Dio instance.
  final Dio _dio;

  // This constructor initializes the Dio instance.
  NetworkService()
      : _dio = Dio(
          BaseOptions(
            receiveDataWhenStatusError: true,
            sendTimeout: const Duration(seconds: 30),
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            headers: {'Content-type': 'application/json'},
          ),
        );

  // This method updates the authorization header with the access token if it exists.
  void _updateAuthorizationHeader() {
    if (accessToken != null) {
      _dio.options.headers['Authorization'] = 'Bearer $accessToken';
    } else {
      _dio.options.headers.remove('Authorization');
    }
  }

  // This method handles the network request and returns the response.
  Future<Response<dynamic>> _handleRequest(Future<Response<dynamic>> Function() request) async {
    try {
      _updateAuthorizationHeader();
      return await request();
    } on DioException catch (e) {
      return ErrorService().handleError(e);
    }
  }

  /// GET request. This method makes a GET request to the specified URL.
  Future<Response<dynamic>> get({required String url}) async => await _handleRequest(() => _dio.get(url));

  /// POST request. This method makes a POST request to the specified URL.
  Future<Response<dynamic>> post({
    required String url,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async =>
      await _handleRequest(
        () => _dio.post(
          url,
          data: data,
          queryParameters: queryParameters,
        ),
      );
}
