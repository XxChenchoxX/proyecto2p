import 'package:flutter_bloc/flutter_bloc.dart';

// Evento para el Registro
class RegisterEvent {}

// Evento para enviar las credenciales de registro
class RegisterSubmitEvent extends RegisterEvent {
  final String username;
  final String password;

  RegisterSubmitEvent({required this.username, required this.password});
}

// Estado del Registro
class RegisterState {}

// Estado inicial
class RegisterInitial extends RegisterState {}

// Estado mientras se carga
class RegisterLoading extends RegisterState {}

// Estado de éxito
class RegisterSuccess extends RegisterState {}

// Estado de error
class RegisterError extends RegisterState {
  final String error;
  RegisterError({required this.error});
}

// BLoC del Registro
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterSubmitEvent) {
      yield RegisterLoading();
      try {
        // Aquí va la lógica para registrar al usuario (por ejemplo, crear la cuenta en Firebase o en un API)
        // Si es exitoso:
        yield RegisterSuccess();
      } catch (e) {
        yield RegisterError(error: 'Error en el registro');
      }
    }
  }
}
