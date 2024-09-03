part of 'edit_screen_bloc.dart';

@immutable
class EditScreenState extends Equatable {
  TextEditingController? nameController;
  TextEditingController? ageController;
  int? id;
  EditScreenState({
    this.nameController,
    this.ageController,
    this.id,
  });

  @override
  List<Object?> get props => [
        nameController,
        ageController,
        id,
      ];
  factory EditScreenState.initial() {
    return EditScreenState(
      nameController: TextEditingController(),
      ageController: TextEditingController(),
      id: null,
    );
  }
  EditScreenState copyWith({
    TextEditingController? nameController,
    TextEditingController? ageController,
    int? id,
  }) {
    return EditScreenState(
      nameController: nameController ?? this.nameController,
      ageController: ageController ?? this.ageController,
      id: id ?? this.id,
    );
  }
}
