part of 'edit_screen_bloc.dart';

@immutable
sealed class EditScreenEvent {}

class GetId extends EditScreenEvent {
  GetId(
    this.id,
    this.name,
    this.age,
  );
  int id;
  String name;
  int age;
}

class SubmitIDEvent extends EditScreenEvent {
  SubmitIDEvent(this.context, this.id);
  BuildContext context;
  int? id;
}
