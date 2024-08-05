import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

@immutable
class Person {
  final String name;
  final int age;
  final String uuid;

  Person({required this.name, required this.age, String? uuid})
      : uuid = uuid ?? Uuid().v4();

  Person updated([String? name, int? age]) =>
      Person(name: name ?? this.name, age: age ?? this.age, uuid: uuid);

  String get displayName => '$name ($age years old)';
  @override
  bool operator ==(covariant Person other) => uuid == other.uuid;

  @override
  int get hashCode => uuid.hashCode;

  @override
  String toString() => 'Person(name:$name, age:$age, uuid: $uuid)';
}
