extension AddIfExtension<E> on List<E> {
  void addIf(bool condition, E? item) {
    if (condition && item != null) {
      add(item);
    }
  }
}
