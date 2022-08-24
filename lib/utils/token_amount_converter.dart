/// "wei" 为单位的数量转换为 token 标准单位数量，可以自定义保留的小数点位数
///
/// - [wei] 拥有的token 的数量
/// - [decimals] token 的精确度
/// - [fixed] 保留小数点位数，默认是去尾法，取 2 位小数
String weiToAmount(String? wei, int decimals, {int fixed = 2}) {
  if (wei == null) return "0.00";
  String unit = [1, ...List.filled(decimals, 0)].join("");
  final amount = BigInt.parse(wei) / BigInt.parse(unit);
  return keepDecimal(amount, fixed: fixed);
}

String keepDecimal(
  double? value, {
  int fixed = 2,
  String nullReplace = "--",
  String prefix = "",
  String subfix = "",
}) {
  if (value == null) return nullReplace;
  final amountWithFixed = value.toStringAsFixed(fixed + 1);
  final fixedAmount =
      amountWithFixed.substring(0, amountWithFixed.length - 1).toString();
  return prefix + fixedAmount + subfix;
}
