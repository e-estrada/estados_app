import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/bloc/usuario/usuario_cubit.dart';

class Pagina1Page extends StatelessWidget {
 const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
        actions: [
          IconButton(
            onPressed: () => context.read<UsuarioCubit>().borrarUsuario(), 
            icon: const Icon(Icons.exit_to_app)
          )
        ],
      ),
      body: const BodyScaffold(),
     floatingActionButton: FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      child: const Icon(Icons.arrow_circle_right_outlined),
     ),
   );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: ( _ , state) {

        switch (state.runtimeType) {
          case UsuarioInitial:
            return const Center(child: Text('No hay información del usuario'));
          case UsuarioActivo:
            return InformacionUsuario((state as UsuarioActivo).usuario);
          default:
            return const Center(child: Text('Estado no reconocido'));
        }
        // if(state is UsuarioInitial){
        //   return const Center(child: Text('No hay información del usuario'));
        // } else if(state is UsuarioActivo){
        //   return InformacionUsuario(state.usuario);
        // } else {
        //   return const Center(child: Text('Estado no reconocido'));
        // }

      }
    );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;
  const InformacionUsuario(this.usuario, {super.key});

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

          ListTile( title: Text('Nombre: ${usuario.nombre}') ),
          ListTile( title: Text('Edad: ${usuario.edad}') ),

          const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

          const Divider(),

          ...usuario.profesiones.map(
            (profesion) => ListTile( title: Text(profesion) ),
          ).toList(),
          

        ],
      ),
    );
  }
}