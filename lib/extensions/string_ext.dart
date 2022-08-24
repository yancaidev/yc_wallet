const rmbMark = "¥";

extension StringExt on String {
  static bool isEmpty(String? text) {
    return text?.isEmpty ?? true;
  }

  static bool isNotEmpty(String? text) {
    return text?.isNotEmpty ?? false;
  }
}
