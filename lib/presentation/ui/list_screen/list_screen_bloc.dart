import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../data_store/mock_data.dart';
import '../../../model/model.dart';

part 'list_screen_event.dart';
part 'list_screen_state.dart';

class ListScreenBloc extends Bloc<ListScreenEvent, ListScreenState> {
  List<ModelData> data = [];
  ListScreenBloc() : super(ListScreenInitial()) {
    on<ListScreenEvent>((event, emit) {});
    on<LoadScreenEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      getData(event, emit);
    });
    on<EditEvent>((event, emit) async {
      emit(EditScreenInitial());
    });
    on<ChangeDataEvent>((event, emit) async {
      emit(EditScreenInitial());
    });
    on<SubmitEvent>((event, emit) async {
      changeData(event, data);
      emit(ListScreenLoaded(data));
      Navigator.pop(event.context);
    });
  }
  changeData(SubmitEvent event, List<ModelData> dataList) {
    for (ModelData v in dataList) {
      if (v.id == event.id) {
        v.name = event.name;
        v.age = int.parse(event.age ?? '0');
      } else {
        changeData(event, v.data ?? []);
      }
    }
  }

  getData(LoadScreenEvent event, Emitter<ListScreenState> emit) {
    Model model = Model.fromJson(mapData);
    data = List.from(model.data ?? []);
    emit(ListScreenLoaded(data));
  }
}
