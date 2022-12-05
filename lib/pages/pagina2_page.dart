import 'package:estados_app/controllers/usuario_controller.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Pagina2Page extends StatelessWidget {
 const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {

    final usuarioCtrl = Get.find<UsuarioController>();

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
                final newUser = Usuario(nombre: 'Erick Estrada', edad: 39, profesiones: ['PHP Develorper', 'Flutter Developer']);
                usuarioCtrl.cargarUsuario(newUser);
                Get.snackbar(
                  'Usuario Establecido', 
                  'Erick es el nombre del usuario', 
                  backgroundColor: Colors.white, 
                  boxShadows: [
                    const BoxShadow(color: Colors.black38, blurRadius: 10)
                  ]
                );
              },
              color: Colors.blue,
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),

            MaterialButton(
              onPressed: () {
                usuarioCtrl.cambiarEdad(45);
              },
              color: Colors.blue,
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),

            MaterialButton(
              onPressed: () {
                usuarioCtrl.agregarProfesion('Profesión ${ usuarioCtrl.profesionesCount }');
              },
              color: Colors.blue,
              child: const Text('Añadir Profesión', style: TextStyle(color: Colors.white)),
            ),


            MaterialButton(
              onPressed: () {
                Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
              color: Colors.blue,
              child: const Text('Cambiar Tema', style: TextStyle(color: Colors.white)),
            ),

          ],
        ),
     ),
   );
  }
}