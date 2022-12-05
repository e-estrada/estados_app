
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:estados_app/models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  
  UserBloc() : super(const UserInitialState()) {

    on<ActivateUser>( (event, emit) => emit( UserSetState(event.user) ) );
    
    on<DeleteUser>( (event, emit) => emit( const UserInitialState() ) );

    on<ChangeUserAge>((event, emit) {
      if(!state.existUser) return;
      emit( UserSetState(state.user!.copyWith(edad: event.edad)) );
    });

    on<AddUserProfesion>((event, emit) {
      if(!state.existUser) return;
      final profesiones = [...state.user!.profesiones, event.profesion];
      emit( UserSetState(state.user!.copyWith(profesiones: profesiones)) );
    });
  }

  

}