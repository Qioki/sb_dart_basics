class Basics {
// Реализуйте методы для преобразования целых чисел из десятичной системы в двоичную и обратно.
// П.С. Десятичное число будет равно двоичному, тип данных не изменится, что из чего преобразовывать? Мне в массив преобразовать? В строку?
// П.П.С. Сделаю преобразования со строкой
  static String toBinaryString(int decimal) {
    return decimal.toRadixString(2);
  }

  static int toDecimal(String binary) {
    return int.parse(binary, radix: 2);
  }

// Реализуйте метод, который принимает строку слов, разделённых пробелами. Задача — найти в данной строке числа и вернуть коллекцию num этих чисел.
  static List<num> findNums(String str) {
    List<num> nums = [];
    str.split(' ').forEach((element) {
      var value = num.tryParse(element);
      if (value != null) {
        nums.add(value);
      }
    });
    return nums;
  }

// Есть коллекция слов. Реализуйте метод, возвращающий Map. Данный Map должен соотносить слово и количество его вхождений в данную коллекцию.
  static Map<String, int> findMatches(List<String> strList) {
    final matches = <String, int>{};
    for (var e in strList) {
      if (matches.containsKey(e)) {
        matches[e] = matches[e]! + 1;
      } else {
        matches[e] = 1;
      }
    }
    return matches;
  }

// Есть коллекция строк вида ‘one, two, three, cat, dog’ или любого другого. Реализуйте метод, возвращающий цифры без повторений, которые встречаются в данной строке. Однако цифры встречаются в виде английских слов от zero до nine. Например, в результате строки ‘one, two, zero, zero’ мы получим следующий результат: [1, 2, 0]. Если в строке есть слова, не являющиеся цифрами от 0 до 9, пропускайте их.
  static var tmp = 0; // костыль
  static final Map<String, int> numbersNames2 = {
    for (var e in 'one two three four five six seven eight nine'.split(' '))
      e: ++tmp
  };

  static Set<int> findNumbers(String str) {
    var set = <int>{};
    str.split(' ').forEach((e) {
      if (numbersNames2.containsKey(e)) {
        set.add(numbersNames2[e]!);
      }
    });
    return set;
  }
}

num mabs(num x) => (x < 0) ? -x : x;

// Реализуйте метод, который вычисляет корень любой заданной степени из числа. Реализуйте данный метод как extension-метод для num. Алгоритм можете взять на википедии как «Алгоритм нахождения корня n-й степени». Запрещается использовать методы math. В случае когда значение вернуть невозможно, необходимо бросать исключение с описанием ошибки.
extension NumberParsing on num {
  num root(int n) {
    if (n == 0) return 1;
    if (this < 0 && n % 2 == 0) {
      throw ArgumentError(
          'Нельзя извлекать корень чётной степени из отрицательного числа');
    }
    num eps = 0.00001;
    num rt = this / n;
    num rn = toDouble();
    while (mabs(rt - rn) >= eps) {
      rn = toDouble();
      for (int i = 1; i < n; i++) {
        rn = rn / rt;
      }
      rt = 0.5 * (rn + rt);
    }
    return rt;
  }
  // ···
}

// (Усложнённое). Реализуйте метод, который вычисляет значение определённого интеграла Римана в заданных значениях и с заданной точностью разбиения.
// По возможности учтите случаи, когда функция имеет точки разрыва. Реализованный метод должен принимать функцию, точки x1 и x2, точность разбиения.
double integral(
    double Function(double x) f, double x1, double x2, double accuracy) {
  double area = 0, start = 0, x = accuracy / 2;
  var n = (x2 - x1 - x) ~/ accuracy;
  for (var i = 0; i < n; i++) {
    area += f(x) * accuracy;
    x += accuracy;
  }
  x1 += accuracy * n;
  area += f((x2 - x1) / 2) * (x2 - x1);

  return area;
}
