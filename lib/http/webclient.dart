import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

var httpClientWithInterceptor = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: Duration(seconds: 15),
);

const String baseUr = 'http://192.168.0.105:8081/transactions';
