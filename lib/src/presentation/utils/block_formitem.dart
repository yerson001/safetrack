class BlockFormItem {
  final String value;
  final String? error;

  const BlockFormItem({this.value = '', this.error});

  BlockFormItem copyWith({String? value, String? error}) {
    return BlockFormItem(
        value: value ?? this.value, error: error ?? this.error);
  }
}
