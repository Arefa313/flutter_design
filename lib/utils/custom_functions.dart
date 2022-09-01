import 'package:intl/intl.dart';
String formatCurrency(num amount,{int decimalcount=0}){
  final formatCurrency = new NumberFormat.simpleCurrency(decimalDigits: decimalcount);
  return formatCurrency.format(amount);
}

