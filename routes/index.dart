import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;

  //! Content-Type  application/json değilse bu çalışır.
  final body = await request.body();

  final method = request.method;
  final headers = request.headers;
  final params = request.uri.queryParameters;
  //! Content-Type  application/json ise bu çalışır.
  // final jsonBody = await request.json();

  //! Content-Type  application/x-www-form-urlencoded ise bu çalışır.
  // final formBody = await request.formData();

  print('body: $body');
  print('method: ${method.name}');
  print('headers: $headers');
  print('params: $params');
  // print('jsonBody: $jsonBody');
  
  switch (method) {
    case HttpMethod.get:
      print('GETTT');
      break;
    case HttpMethod.post:
      print('POSTTT');
      break;
    default:
    
  }

  // return Response(body: 'Welcome to Dart Frog!');
  return Response.json(statusCode: 404, body: body);
}
