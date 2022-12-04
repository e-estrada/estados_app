import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estados_app/bloc/usuario/usuario_cubit.dart';


class Pagina2Page extends StatelessWidget {
 const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final newUser = Usuario(nombre: 'Erick Estrada', edad: 39, profesiones: ['PHP Developer', 'Flutter Developer']);
                usuarioCubit.seleccionarUsuario(newUser);
              },
              color: Colors.blue,
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),

            MaterialButton(
              onPressed: () {
                usuarioCubit.cambiarEdad(45);
              },
              color: Colors.blue,
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),

            MaterialButton(
              onPressed: () {
                usuarioCubit.agregarProfesion();
              },
              color: Colors.blue,
              child: const Text('Añadir Profesión', style: TextStyle(color: Colors.white)),
            ),


          ],
        ),
     ),
   );
  }
}