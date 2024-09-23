part of 'services.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions() async {
    await Future.delayed(Duration(seconds: 2));

    return ApiReturnValue(value: mockTransaction);
  }

  static Future<ApiReturnValue<List<Transaction>>> submitTransactions(
      Transaction transaction) async {
    await Future.delayed(Duration(seconds: 2));

    return ApiReturnValue(value: mockTransaction);
  }
}
