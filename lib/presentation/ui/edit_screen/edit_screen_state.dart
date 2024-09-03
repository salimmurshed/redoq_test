part of 'edit_screen_bloc.dart';

@immutable
class EditScreenState extends Equatable {
  TextEditingController? nameController;
  TextEditingController? ageController;
  String nameError;
  String ageError;
  int? id;
  EditScreenState({
    this.nameController,
    this.ageController,
    this.id,
    this.nameError = "",
    this.ageError = "",
  });

  @override
  List<Object?> get props => [
        nameController,
        ageController,
        id,
        nameError,
        ageError,
      ];
  factory EditScreenState.initial() {
    return EditScreenState(
      nameController: TextEditingController(),
      ageController: TextEditingController(),
      id: null,
      nameError: "",
      ageError: "",
    );
  }
  EditScreenState copyWith({
    TextEditingController? nameController,
    TextEditingController? ageController,
    int? id,
    String? nameError,
    String? ageError,
  }) {
    return EditScreenState(
      nameController: nameController ?? this.nameController,
      ageController: ageController ?? this.ageController,
      id: id ?? this.id,
      nameError: nameError ?? this.nameError,
      ageError: ageError ?? this.ageError,
    );
  }
}
