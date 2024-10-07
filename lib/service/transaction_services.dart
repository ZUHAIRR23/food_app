part of 'services.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions(
      {http.Client? client}) async {
    client ??= http.Client();

    String url = baseUrl + '/transaction';

    print("URL Transaction : $url");

    var response = await client.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${User.token}'
    });

    print("USER TOKEN : ${User.token}");

    print("Response Transacion : ${response.body}");

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Failed To Get Transaction');
    }

    var data = jsonDecode(response.body);

    print("Data Transaction : $data");

    List<Transaction> transaction = (data['data']['data'] as Iterable)
        .map((e) => Transaction.fromJson(e))
        .toList();

    return ApiReturnValue(value: transaction);
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
