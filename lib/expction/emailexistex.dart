class useremailEx implements Exception{

final String message;

   useremailEx(this.message);

  @override
  String toString() {
    return message;
    // return super.toString(); // Instance of HttpException
  }

}