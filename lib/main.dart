import 'dart:math';

import 'package:dart_collections_journey/names.dart';
import 'package:word_generator/word_generator.dart';

void main() {
  separator(1);
  task01();
  separator(2);
  task02();
  separator(3);
  task03();
}

void separator(int task) {
  print('============ Task $task ============');
}

// Task 1: Списки (List)
// Створіть список numbers зі 100 елементів. Кожен елемент — випадкове число від 0 до 100 (використайте Random().nextInt(101)).
// Виведіть цей список на екран.
// Виведіть на екран 65-й елемент списку у форматі: "65-й елемент: [значення]".
// Вставте число 1000000000 на 50-ту позицію списку.
// Видаліть зі списку елементи зі значеннями: 24, 45, 66, 88.
// За допомогою циклу for переберіть список. Під час перебору:
// Порахуйте суму всіх елементів, що діляться на 3 без залишку.
// Виведіть результат.
// Створіть порожній список temp. За допомогою циклу for-in переберіть numbers. Додайте до temp лише ті елементи, що діляться на 2 без залишку.
// Виведіть довжину списку temp.
void task01() {
  final List<int> numbers = List.generate(100, (i) => Random().nextInt(101));
  print('список випадкових чисел: ${numbers.join(', ')}');
  print('65-й елемент: ${numbers[64]}');
  numbers.insert(49, 1000000000);
  final List<int> bannedNumbers = [24, 45, 66, 88];
  numbers.removeWhere(bannedNumbers.contains);
  int sum = 0;
  for (var i = 0; i < numbers.length; i++) {
    if (numbers[i] % 3 == 0) {
      sum += numbers[i];
    }
  }
  print('сума елементів, що діляться на 3 без залишку: $sum');
  final List<int> temp = [];
  for (var i in numbers) {
    if (i % 2 == 0) {
      temp.add(i);
    }
  }
  print('кількість парних чисел: ${temp.length}');
}

// Task 2: Множини (Set)
// Створіть окремий файл names.dart.
// У цьому файлі створіть дві змінні:
// List<String> ukrainianNames1
// List<String> ukrainianNames2
// За допомогою ChatGPT згенеруйте список із 50 українських імен та збережіть його в ukrainianNames1.
// За допомогою DeepSeek згенеруйте інший список із 50 українських імен для ukrainianNames2.
// Поверніться до основного файлу з домашнім завданням (lib/main.dart).
// Створіть Set uniqueNames1 і додайте до нього всі імена з ukrainianNames1.
// Створіть Set uniqueNames2 і додайте до нього всі імена з ukrainianNames2.
// Створіть новий Set зі спільними іменами обох списків. Виведіть кількість елементів у цій множині.
// Створіть множину з іменами, що є в uniqueNames1, але яких немає в uniqueNames2. Виведіть ці імена.
// Створіть множину з іменами, що є в uniqueNames2, але яких немає в uniqueNames1. Виведіть ці імена.
void task02() {
  final Set<String> uniqueNames1 = ukrainianNames1.toSet();
  final Set<String> uniqueNames2 = ukrainianNames2.toSet();
  final Set<String> commonNames = uniqueNames1.intersection(uniqueNames2);
  print('кількість спільних імен: ${commonNames.length}');
  final Set<String> onlyInUnique1 = uniqueNames1.difference(uniqueNames2);
  print('імена що є лише в першому списку: ${onlyInUnique1.join(', ')}');
  final Set<String> onlyInUnique2 = uniqueNames2.difference(uniqueNames1);
  print('імена що є лише в другому списку: ${onlyInUnique2.join(', ')}');
  final Set<String> uniqueNames =
      {...uniqueNames1, ...uniqueNames2}.difference(commonNames);
  // or
  // Set<String> uniqueNames = {...onlyInUnique1, ...uniqueNames2}
  print('імена що є лише в одному зі списків: ${uniqueNames.join(', ')}');
}

// Task 3: Словники (Map)
// Підключіть до проєкту пакет word_generator (див. https://pub.dev/packages/word_generator).
// Створіть список nounsList із 50 випадкових слів (як це зробити, дивіться в документації: https://pub.dev/packages/word_generator#randomnouns).
// Із nounsList створіть Map<String, int> nounsMap, де:
// ключ — слово;
// значення — кількість символів у цьому слові.
// Створіть нову змінну Map<String, int> tempNouns.
// Додайте у tempNouns лише ті пари зі nounsMap, де довжина слова — парне число.
// Виведіть всі ключі зі tempNouns.
void task03() {
  final wordGenerator = WordGenerator();
  final List<String> nouns = wordGenerator.randomNouns(50);
  final Map<String, int> nounsMap =
      Map.fromIterables(nouns, nouns.map((e) => e.length));
  final tempNounsEntries = nounsMap.entries.where((e) => e.value.isEven);
  final Map<String, int> tempNouns = Map.fromEntries(tempNounsEntries);
  print('слова, довжина яких парне число: ${tempNouns.keys.join(', ')}');
}
