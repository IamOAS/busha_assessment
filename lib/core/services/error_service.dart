import 'package:busha_assessment/core/utils/exports.dart';

// Service class to handle error messages
class ErrorService {
  // Map to store default error messages based on DioExceptionType
  final Map<DioExceptionType, String> defaultErrorMessages = {
    DioExceptionType.cancel: 'Request cancelled!',
    DioExceptionType.connectionError: 'Please check your network connection!',
    DioExceptionType.receiveTimeout: 'Network connection timed out!',
    DioExceptionType.sendTimeout: 'Network connection timed out!',
  };

  // Method to handle DioException and return a Response object
  Response handleError(DioException? e) {
    final message = _getMessageFromDioException(e);
    final errorCode = _getStatusCodeFromResponse(e?.response);

    return Response(
      data: requestResponse(message: message, errorCode: errorCode),
      requestOptions: RequestOptions(path: ''),
    );
  }

  // Method to get the error message from DioException
  String _getMessageFromDioException(DioException? e) {
    if (e == null) return 'An unexpected error occurred.';

    switch (e.type) {
      case DioExceptionType.cancel:
        return defaultErrorMessages[e.type]!;
      case DioExceptionType.connectionError:
        return defaultErrorMessages[e.type]!;
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionTimeout:
        return defaultErrorMessages[DioExceptionType.connectionTimeout]!;
      default:
        return _getMessageFromSpecificError(e.error);
    }
  }

  // Method to get the error message from specific error types
  String _getMessageFromSpecificError(dynamic error) {
    if (error is SocketException) {
      return 'Please check your network connection!';
    } else if (error is HttpException) {
      return 'Network connection issue. Please try again later!';
    } else if (error is TimeoutException) {
      return 'Network connection timed out!';
    } else {
      return 'An unexpected error occurred.';
    }
  }

  // Method to get the status code from the response
  String? _getStatusCodeFromResponse(Response? response) {
    return response?.statusCode?.toString();
  }

  // Method to create a request response map
  Map<String, dynamic> requestResponse({
    String? message,
    String? errorCode,
    dynamic data,
  }) =>
      {
        'message': message,
        'errorCode': errorCode,
        'data': data,
      };
}
