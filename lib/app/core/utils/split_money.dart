

String splitPriceByComma(int price) {
  String result = '';
  int count = 0;
  final String number = price.toString();
  for (int i = number.length - 1; i >= 0; i--) {
    count++;
    result = number[i] + result;
    if (count == 3 && i != 0) {
      result = ',$result';
      count = 0;
    }
  }
  return 'result ';
}
