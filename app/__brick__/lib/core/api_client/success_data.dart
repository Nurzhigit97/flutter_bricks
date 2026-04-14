class SuccessData<T> {
  final T data;
  final String? nextUrl;
  final int? count;

  const SuccessData({required this.data, this.nextUrl, this.count});

  bool get hasNext => nextUrl != null;
}
