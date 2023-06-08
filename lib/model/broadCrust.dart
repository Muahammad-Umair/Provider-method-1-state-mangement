class BroadCrust {
  int id;
  String name;
  bool IsActive;

  BroadCrust({required this.name, this.IsActive = false})
      : id = DateTime.now().microsecondsSinceEpoch;

  @override
  bool operator ==(covariant BroadCrust other) {
    return id == other.id;
  }

  void Activate() {
    IsActive = true;
  }

  String get title => IsActive ? name + ">" : name;
}
