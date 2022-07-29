extension ListExt<E> on List<E> {
  int? firstIndex(E e) {
    for (int i = 0; i < length; i++) {
      if (e == this[i]) return i;
    }
    return null;
  }

  bool containsNoNull() {
    for (int i = 0; i < length; i++) {
      if (this[i] == null) return false;
    }
    return true;
  }
}
