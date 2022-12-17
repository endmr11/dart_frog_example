import 'package:dart_frog/dart_frog.dart';
import 'package:frog_example/socketcounter/cubit/counter_cubit.dart';

/// Provides an instance of a [CounterCubit].
final counterProvider = provider<CounterCubit>((_) => CounterCubit());

/// Provides an instance of a [CounterCubit].
Middleware injectionHandler() {
  return (handler) {
    return handler.use(
      provider<CounterCubit>(
        (context) => CounterCubit(),
      ),
    );
  };
}
