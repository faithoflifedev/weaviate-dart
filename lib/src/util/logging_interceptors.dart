import 'dart:async';

import 'package:dio/dio.dart';
import 'package:loggy/loggy.dart';

/// Dio instance may have one or more interceptors by which you can intercept
/// requests/responses/errors before they are handled by `then` or `catchError`.
class LoggingInterceptors extends Interceptor with UiLoggy {
  /// The callback will be executed before the request is initiated.
  @override
  FutureOr<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    loggy.debug('METHOD: ${options.method}');

    loggy.debug('URI: ${options.uri}');

    if (options.queryParameters.isNotEmpty) {
      loggy.debug('QUERY PARAMETERS:\n${options.queryParameters}');
    }

    if (options.data != null) {
      loggy.debug('REQUEST:\n${options.data}');
    }

    handler.next(options);
  }

  /// The callback will be executed on error.
  @override
  FutureOr<dynamic> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    loggy.error('ERROR:\n$err');

    handler.next(err);
  }

  /// The callback will be executed on success.
  @override
  FutureOr<dynamic> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (response.data != null) {
      loggy.debug('RESPONSE:\n${response.data}');
    }

    handler.next(response);
  }
}
