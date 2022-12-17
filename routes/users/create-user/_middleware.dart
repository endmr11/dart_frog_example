import 'package:dart_frog/dart_frog.dart';
import 'package:frog_example/controllers/users_controller.dart';

Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(injectionHandler());
}

Middleware injectionHandler() {
  return (handler) {
    return handler.use(
      provider<UsersController>(
        (context) => UsersController(),
      ),
    );
  };
}
