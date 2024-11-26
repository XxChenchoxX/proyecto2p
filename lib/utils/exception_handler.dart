import 'dart:io';

String handleException(dynamic exception) {
  if (exception is FormatException) {
    return 'Formato de datos no válido. Por favor revise su entrada.';
  } else if (exception is PathAccessException) {
    return 'No se puede cargar el almacenamiento';
  } else {
    return 'Se produjo un error inesperado. Por favor inténtalo de nuevo más tarde.';
  }
}