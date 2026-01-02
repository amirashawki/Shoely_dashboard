class CustomExceptions implements Exception {
  final String message;

  CustomExceptions(this.message);
  
  String toString() {
    return message;
  }
}
