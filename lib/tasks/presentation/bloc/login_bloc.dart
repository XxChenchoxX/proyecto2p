import 'package:flutter_bloc/flutter_bloc.dart';

// Evento para el Login
class LoginEvent {}

// Evento para enviar las credenciales
class LoginSubmitEvent extends LoginEvent {
  final String username;
  final String password;

  LoginSubmitEvent({required this.username, required this.password});
}

// Estado del Login
class LoginState {}

// Estado inicial
class LoginInitial extends LoginState {}

// Estado mientras se carga
class LoginLoading extends LoginState {}

// Estado de éxito
class LoginSuccess extends LoginState {}

// Estado de error
class LoginError extends LoginState {
  final String error;
  LoginError({required this.error});
}

// BLoC del Login
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginSubmitEvent) {
      yield LoginLoading();
      try {
        // Aquí va la lógica de autenticación (por ejemplo, verificar las credenciales en un backend o Firebase)
        // Si es exitoso:
        yield LoginSuccess();
      } catch (e) {
        yield LoginError(error: 'Credenciales incorrectas');
      }
    }
  }
}
