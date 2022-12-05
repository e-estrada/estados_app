part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final Usuario user;
  ActivateUser(this.user);
}

class ChangeUserAge extends UserEvent {
  final int edad;

  ChangeUserAge(this.edad);
}

class AddUserProfesion extends UserEvent {
  final String profesion;

  AddUserProfesion(this.profesion);
}

class DeleteUser extends UserEvent {}