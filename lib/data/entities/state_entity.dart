class StateEntity {
  static final tableName = "states";
  static final idColumn = "id";
  static final nameColumn = "name";

  String id;
  String name;

  StateEntity.fromDatabase(Map<String, dynamic> data)
      : id = data[idColumn],
        name = data[nameColumn];
}
