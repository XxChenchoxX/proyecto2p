import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_app/routes/pages.dart';
import 'package:task_manager_app/utils/color_palette.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _register() async {
    if (_formKey.currentState?.validate() ?? false) {
      // Guardar el usuario en SharedPreferences (o cualquier otra lógica de almacenamiento)
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('username', _usernameController.text);

      // Redirigir al login
      Navigator.pushNamedAndRemoveUntil(context, Pages.login, (route) => false);

      // Mostrar mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.white),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  '¡Registro exitoso! Ahora puedes iniciar sesión.',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 76, 220, 78),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple.shade200,
              Colors.pink.shade200,
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.2, 0.6, 1.0],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Título "Registro"
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Registro',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Título en negro
                  ),
                ),
              ),
              const SizedBox(height: 40), // Separación entre título y formulario
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Campo de usuario con ícono
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Usuario',
                        prefixIcon: const Icon(Icons.person, color: Colors.purple),
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'El usuario no puede estar vacío' : null,
                    ),
                    const SizedBox(height: 16),
                    // Campo de contraseña con ícono
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        prefixIcon: const Icon(Icons.lock, color: Colors.purple),
                        border: const OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) =>
                          (value?.length ?? 0) < 6 ? 'La contraseña debe tener al menos 6 caracteres' : null,
                    ),
                    const SizedBox(height: 24),
                    // Botón "Registrar" con ícono
                    ElevatedButton.icon(
                      onPressed: _register,
                      icon: const Icon(Icons.app_registration),
                      label: const Text('Registrar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white, // Texto del botón en blanco
                        minimumSize: const Size(double.infinity, 48),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, Pages.login),
                      child: const Text('¿Ya tienes cuenta? Inicia sesión'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
