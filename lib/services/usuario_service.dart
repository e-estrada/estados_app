

import 'package:flutter/material.dart';

import 'package:estados_app/models/usuario.dart';

class UsuarioService with ChangeNotifier {
  Usuario? _usuario;

  Usuario? get usuario => _usuario;
  bool get existeUsuario => (_usuario != null) ? true : false;

  set usuario(Usuario? user){
    _usuario = user;
    notifyListeners();
  }

  set cambiarEdad(int edad){
    _usuario?.edad = edad;
    notifyListeners();
  }

  void removerUsuario(){
    _usuario = null;
    notifyListeners();
  }

  void agregarProfesion(){
    _usuario?.profesiones.add('Developer ${ _usuario?.profesiones.length }');
    notifyListeners();
  }

}