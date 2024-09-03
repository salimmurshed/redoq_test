part of 'list_screen_bloc.dart';

@immutable
sealed class ListScreenEvent {}

class LoadScreenEvent extends ListScreenEvent {}

class EditEvent extends ListScreenEvent {}

class ChangeDataEvent extends ListScreenEvent {}

class SubmitEvent extends ListScreenEvent {
  SubmitEvent(this.context, this.id, this.name, this.age);
  BuildContext context;
  int? id;
  String? name;
  String? age;
}
