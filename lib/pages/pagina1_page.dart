import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/controllers/usuario_controller.dart';


class Pagina1Page extends StatelessWidget {
 const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {

    final usuarioCtrl = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
      ),
      body: Obx(
        () => (usuarioCtrl.existeUsuario.value) 
          ? InformacionUsuario(usuario: usuarioCtrl.usuario.value,)
          : const NoInfo(),
      ),
     floatingActionButton: FloatingActionButton(
      // onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      onPressed: () => Get.toNamed('pagina2'),
      child: const Icon(Icons.arrow_circle_right_outlined),
     ),
   );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No hay usuario seleccionado.'),
    );
  }
}
class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;
  
  const InformacionUsuario({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

          const Divider(),

          ListTile( title: Text('Nombre: ${ usuario.nombre }') ),
          ListTile( title: Text('Edad: ${ usuario.edad }') ),

          const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

          const Divider(),

          ...usuario.profesiones.map((profesion) => ListTile( title: Text(profesion) )).toList(),

        ],
      ),
    );
  }
}