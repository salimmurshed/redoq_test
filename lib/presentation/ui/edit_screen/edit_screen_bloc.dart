import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../list_screen/list_screen_bloc.dart';

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
    on<SubmitIDEvent>((event, emit) {
      String nameError = "";
      String ageError = "";
      if (state.nameController!.text.isEmpty) {
        nameError = "Need to fill!";
      } else {
        nameError = "";
      }
      if (state.ageController!.text.isEmpty) {
        ageError = "Need to fill!";
      } else {
        ageError = "";
      }
      emit(state.copyWith(nameError: nameError, ageError: ageError));
      if (nameError.isEmpty && ageError.isEmpty) {
        BlocProvider.of<ListScreenBloc>(event.context).add(SubmitEvent(
            event.context,
            event.id,
            state.nameController!.text,
            state.ageController!.text));
      }
      // context.read<ListScreenBloc>().add(SubmitEvent(
      //     context,
      //     state.id,
      //     state.nameController!.text,
      //     state.ageController!.text));
      // emit(state.copyWith(
      //   id: event.id,
      //   nameController: TextEditingController(text: state.name),
      //   ageController: TextEditingController(text: event.age.toString()),
      // ));
    });
  }
}
