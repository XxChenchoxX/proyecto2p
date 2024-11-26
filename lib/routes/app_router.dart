import 'package:flutter/material.dart';
import 'package:task_manager_app/routes/pages.dart';
import 'package:task_manager_app/splash_screen.dart';
import 'package:task_manager_app/tasks/data/local/model/task_model.dart';
import 'package:task_manager_app/tasks/presentation/pages/new_task_screen.dart';
import 'package:task_manager_app/tasks/presentation/pages/tasks_screen.dart';
import 'package:task_manager_app/tasks/presentation/pages/update_task_screen.dart';
import 'package:task_manager_app/tasks/presentation/pages/auth/login_screen.dart';
import 'package:task_manager_app/tasks/presentation/pages/auth/register_screen.dart';


import '../page_not_found.dart';
Route onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Pages.initial: // Ruta inicial al SplashScreen
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
    case Pages.home: // Ruta al Home
      return MaterialPageRoute(
        builder: (context) => const TasksScreen(),
      );
    case Pages.createNewTask: // Ruta para Crear Tarea
      return MaterialPageRoute(
        builder: (context) => const NewTaskScreen(),
      );
    case Pages.updateTask: // Ruta para Actualizar Tarea
      final args = routeSettings.arguments as TaskModel;
      return MaterialPageRoute(
        builder: (context) => UpdateTaskScreen(taskModel: args),
      );
    case Pages.login: // Ruta para Login
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case Pages.register: // Ruta para Registro
      return MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      );
    default: // Ruta por defecto
      return MaterialPageRoute(
        builder: (context) => const PageNotFound(),
      );
  }
}