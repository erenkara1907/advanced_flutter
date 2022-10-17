import 'package:equatable/equatable.dart';

class GenericUser extends Equatable {
  final String name;
  final String id;
  final int money;

  const GenericUser(this.name, this.id, this.money);

  bool findUserName(String name) {
    return this.name == name;
  }

  @override
  String toString() => 'GenericUser(name: $name, id: $id, money: $money)';

  @override
  List<Object?> get props => [id];
}
