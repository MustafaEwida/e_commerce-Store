class NoPassex implements Exception{

final String message;

   NoPassex(this.message);

  @override
  String toString() {
    return message;
    // return super.toString(); // Instance of HttpException
  }

}