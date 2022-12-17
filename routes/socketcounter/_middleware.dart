import 'package:dart_frog/dart_frog.dart';
import 'package:frog_example/socketcounter/socketcounter.dart';

// Handler middleware(Handler handler) => handler.use(counterProvider);


Handler middleware(Handler handler) => handler.use(injectionHandler());
