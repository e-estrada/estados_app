import 'package:flutter/material.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';


class Pagina2Page extends StatelessWidget {
 const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          return Text(snapshot.data?.nombre ?? 'Página 2');
        },
      ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final nuevoUsuario = Usuario(
                  nombre: 'Erick', 
                  edad: 39, 
                  profesiones: [
                    'Ingeniero'
                  ]
                );
                usuarioService.cargarUsuario(nuevoUsuario);
              },
              color: Colors.blue,
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),

            MaterialButton(
              onPressed: () {
                usuarioService.cargarEdad(40);
              },
              color: Colors.blue,
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),

            MaterialButton(
              onPressed: () {
                
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