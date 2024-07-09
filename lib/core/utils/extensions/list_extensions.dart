extension AddIfExtension<E> on List<E> {
  void addWhere(bool condition, List<E> items) {
    if (condition) {
      addAll(items);
    }
  }
}
