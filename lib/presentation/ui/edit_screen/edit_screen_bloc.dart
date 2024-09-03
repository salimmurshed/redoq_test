import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_screen_event.dart';
part 'edit_screen_state.dart';

class EditScreenBloc extends Bloc<EditScreenEvent, EditScreenState> {
  EditScreenBloc() : super(EditScreenState.initial()) {
    on<EditScreenEvent>((event, emit) {});

    on<GetId>((event, emit) {
      emit(state.copyWith(
        id: event.id,
        nameController: TextEditingController(text: event.name),
        ageController: TextEditingController(text: event.age.toString()),
      ));
    });
  }
}
