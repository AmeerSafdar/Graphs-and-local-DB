class MainScreenStates {
   MainScreenStates({
    this.data = const [],
    this.keys=const[],
    this.dataUpdated
  });
    List<dynamic>? data;
    List<dynamic>? keys;
    bool? dataDeleted;
    bool? dataUpdated;
    MainScreenStates copyWith({
    List<dynamic>? data,
    List<dynamic>? keys,
    bool? dataUpdated,
  }) {
    return MainScreenStates(
      data: data ?? this.data,
      keys: keys ?? this.keys,
      dataUpdated: dataUpdated ?? this.dataUpdated
    );
  }
}