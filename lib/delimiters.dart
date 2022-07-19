/*
Реализуйте методы вычисления НОД и НОК целых чисел. Реализуйте метод, который разбивает число на простые множители и возвращает их.
*/
class Delimiters {
  static int nokEvklid(int val1, int val2) {
    return val1 ~/ nodEvklid(val1, val2) * val2;
  }

  static int nodEvklid(int val1, int val2) {
    if (val1 < val2) {
      var tmp = val1;
      val1 = val2;
      val2 = tmp;
    }

    return val2 != 0 ? nodEvklid(val2, val1 % val2) : val1;
  }

  static int nok(int val1, int val2) {
    if (val1 <= 0 || val2 <= 0) throw ArgumentError();

    var multi1 = getDelimiters(val1);
    var multi2 = getDelimiters(val2);

    var result = 1;
    multi1.forEach((element) {
      result *= element;
      if (multi2.contains(element)) multi2.remove(element);
    });

    multi2.forEach((element) {
      result *= element;
    });

    return result;
  }

  static int nod(int val1, int val2) {
    if (val1 <= 0 || val2 <= 0) throw ArgumentError();

    var multi1 = getDelimiters(val1, all: true);
    var multi2 = getDelimiters(val2, all: true);

    for (var i = multi1.length - 1; i >= 0; i--) {
      if (multi2.contains(multi1[i])) {
        return multi1[i];
      }
    }
    throw Exception();
  }

  static List<int> getDelimiters(int val, {bool all = false}) {
    var tmp = val;
    var list = [1];
    for (var i = 2; i <= tmp; i++) {
      if (tmp % i == 0) {
        list.add(i);
        if (!all) {
          tmp ~/= i;
          i--;
        }
      }
    }
    return list;
  }
}
