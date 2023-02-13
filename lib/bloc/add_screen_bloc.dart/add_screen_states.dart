// ignore_for_file: unnecessary_this

class AddScreenStates {
   AddScreenStates({
    this.dataAdded,
    this.fieldsAdded
  });
    bool? dataAdded;
    bool ? fieldsAdded;
    AddScreenStates copyWith({
    bool? dataAdded,
    bool? fieldsAdded
  }) {
    return AddScreenStates(
      dataAdded: dataAdded ?? this.dataAdded,
      fieldsAdded:fieldsAdded ?? this.fieldsAdded
    );
  }
}