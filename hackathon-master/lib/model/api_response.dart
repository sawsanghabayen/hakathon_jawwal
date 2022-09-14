class ProcessResponse<T> {
  final String  message;
  final bool success   ;
  T? model;

  ProcessResponse({
   required this.message,
    required this.success ,
    this.model,
  });
}
