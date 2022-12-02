import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:estados_app/services/usuario_service.dart';


class Pagina2Page extends StatelessWidget {
 const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuarioService>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario 
          ? Text('Nombre: ${usuarioService.usuario!.nombre}')
          : const Text('Página 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final nuevoUsuario = Usuario(
                  nombre: 'Erick Estrada', 
                  edad: 39, 
                  profesiones: [
                    'Ingeniero',
                    'Programador PHP',
                  ]
                );
                usuarioService.usuario = nuevoUsuario;
              },
              color: Colors.blue,
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),

            MaterialButton(
              onPressed: () {
                usuarioService.cambiarEdad = 40;
              },
              color: Colors.blue,
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),

            MaterialButton(
              onPressed: () {
                usuarioService.agregarProfesion();
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