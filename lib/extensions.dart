extension StringExtension on String {
  String toPersianNumber() {
    return replaceAll('0', '۰')
        .replaceAll('1', '۱')
        .replaceAll('2', '۲')
        .replaceAll('3', '۳')
        .replaceAll('4', '۴')
        .replaceAll('5', '۵')
        .replaceAll('6', '۶')
        .replaceAll('7', '۷')
        .replaceAll('8', '۸')
        .replaceAll('9', '۹');
  }

  String toRegularNumber() {
    return replaceAll('۰', '0')
        .replaceAll('۱', '1')
        .replaceAll('۲', '2')
        .replaceAll('۳', '3')
        .replaceAll('۴', '4')
        .replaceAll('۵', '5')
        .replaceAll('۶', '6')
        .replaceAll('۷', '7')
        .replaceAll('۸', '8')
        .replaceAll('۹', '9');
  }

  String addSplitters(int groupLength, String splitter, [bool ltr = false]) {
    String output = '';

    final remainder = this.length % groupLength;

    final int length = remainder == 0
        ? this.length ~/ groupLength - 1
        : this.length ~/ groupLength;

    if (ltr) {
      for (var i = 0; i < length; i++) {
        output += substring(i * groupLength, (i + 1) * groupLength) + splitter;
      }

      output += substring(length * groupLength);
    } else {
      if (remainder > 0) {
        output = substring(0, remainder);

        for (var i = 1; i <= length; i++) {
          output += ',' +
              substring(i * groupLength - (groupLength - remainder),
                  (i + 1) * groupLength - (groupLength - remainder));
        }
      } else {
        output = substring(0, groupLength);

        for (var i = 1; i <= length; i++) {
          output += ',' + substring(i * groupLength, (i + 1) * groupLength);
        }
      }
    }

    return output;
  }
}


extension ListExtension<T> on List<T> {
  List<T> joinAsList(List<T> seperator) {
    final output = List<T>.from(this);

    for (var i = 1; i < length; i++) {
      output.insertAll(i + seperator.length * (i - 1), seperator);
    }

    return output;
  }
}
