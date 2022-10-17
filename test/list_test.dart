// ignore_for_file: unused_local_variable, unrelated_type_equality_checks

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_full_learn/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('List best of', () {
    List<GenericUser> users = [
      const GenericUser('Eren1', '1', 28),
      const GenericUser('Eren2', '1', 25),
      const GenericUser('Eren3', '1', 25),
    ];

    List<HighCard> highCards = users.map((e) {
      return HighCard(items: e.name.split('').toList());
    }).toList();

    try {
      final response = users
          .singleWhere((element) => element.findUserName('Eren'), orElse: () {
        return const GenericUser("name", "id", 1);
      });
      if (kDebugMode) {
        print(response);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Action $e');
      }
    }

    //

    if (kDebugMode) {
      print('${users.where((element) => element.money > 25)}');
    }

    users.addAll([const GenericUser("name", "id", 1)]);
    users.lastWhere((element) => element.id == '5');

    users.take(5);
    users.remove(const GenericUser("Eren2", "1", 25));
    users.removeAt(2);
    users.removeWhere((element) => element.id == '11');

    users.indexOf(const GenericUser("Eren2", "1", 25));
    final result = users.indexWhere((element) => element.id == '11');
    if (result >= 0) {
      users[result] = const GenericUser('as', "id", 2);
    }

    users.expand((element) => [const GenericUser("name", "id", 2)]);
  });

  //

  test('List best of with collection', () {
    List<GenericUser> users = [
      const GenericUser('Eren1', '1', 28),
      const GenericUser('Eren2', '1', 25),
      const GenericUser('Eren3', '1', 25),
    ];

    final response = users.singleWhereOrNull(
      (element) => element.findUserName('Eren'),
    );

    users.lastWhereOrNull((element) => element.id == 5);

    users.lastOrNull;
    users.forEachIndexed((index, element) {});
  });
}
