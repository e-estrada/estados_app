

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estados_app/models/usuario.dart';
part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  
  UsuarioCubit() : super( UsuarioInitial() );
  
  void seleccionarUsuario(Usuario user){
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad){
    final currentState = state;
    if(currentState is UsuarioActivo){
      final newUser = currentState.usuario.copyWith(edad: edad);
      
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion(){
    final currentState = state;
    if(currentState is UsuarioActivo){
      final newProfesion = currentState.usuario.profesiones;
      newProfesion.add('Developer ${newProfesion.length}');
      final newUser = currentState.usuario.copyWith(profesiones: newProfesion);
      
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario(){
    emit(UsuarioInitial());
  }
  

}