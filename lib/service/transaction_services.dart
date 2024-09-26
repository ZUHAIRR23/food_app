part of 'services.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions() async {
    await Future.delayed(Duration(seconds: 2));

    return ApiReturnValue(value: mockTransaction);
  }

  static Future<ApiReturnValue<Transaction>> submitTransactions(
      Transaction transaction) async {
    await Future.delayed(Duration(seconds: 2));

    return ApiReturnValue(
      value: transaction.copyWith(
        id: 123,
        status: TransactionStatus.pending,
        total: (transaction.quantity! * transaction.food!.price! * 1.1).toInt(),
      ),
    );
  }
}
