part of 'list_screen_bloc.dart';

@immutable
sealed class ListScreenState {}

final class ListScreenInitial extends ListScreenState {}

final class EditScreenInitial extends ListScreenState {}

final class ListScreenLoaded extends ListScreenState {
  ListScreenLoaded(this.data);
  List<ModelData> data;
}
