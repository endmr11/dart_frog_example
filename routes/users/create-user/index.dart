import 'package:dart_frog/dart_frog.dart';
import 'package:frog_example/controllers/users_controller.dart';

Future<Response> onRequest(
  RequestContext context,
) async {
  final usersController = context.read<UsersController>();
  if (context.request.method == HttpMethod.post) {
    final userName = context.request.uri.queryParameters['user_name'];
    final userPassword = context.request.uri.queryParameters['user_password'];
    if (userName != null && userPassword != null) {
      try {
        final users = await usersController.userCreate(
          userName: userName,
          userPassword: userPassword,
        );
        return Response.json(body: users);
      } catch (error) {
        return Response(body: error.toString());
      }
    } else {
      return Response.json(body: {'error': 'All Parameters Are Required'});
    }
  } else {
    return Response.json(
      body: {'error': '${context.request.method.name.toUpperCase()} Not Supported'},
    );
  }
}
