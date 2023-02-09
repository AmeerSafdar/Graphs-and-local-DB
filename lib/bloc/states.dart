// ignore_for_file: unnecessary_this

enum Status { initial, addFields, dataAdded, succes, updated }

class States {
   States({
    this.status = Status.initial,
    this.data = const [],
    this.keys=const[]
  });
  final Status status;
    List? data;
    List? keys;
    States copyWith({
    Status? status,
    List? data,
    List? keys
  }) {
    return States(
      status: status ?? this.status,
      data: data ?? this.data,
      keys: keys ?? this.keys
    );
  }
}