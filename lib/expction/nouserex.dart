class NoUserEx implements Exception{

final String message;

  NoUserEx(this.message);

  @override
  String toString() {
    return message;
    // return super.toString(); // Instance of HttpException
  }

}